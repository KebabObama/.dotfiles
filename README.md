# Dotfiles Flake (Dynamic Hosts + Users)

This repository builds NixOS and Home Manager configurations dynamically from the directory tree.
You do not maintain a central host/user list; folders are discovered automatically.

## How it works

### Flake outputs

`flake.nix` exports outputs from `lib/outputs.nix`:

- `nixosConfigurations.<host>` for each host in `machines/<host>`
- `homeConfigurations.<user>@<host>` for each user folder in `machines/<host>/users/<user>`
- `formatter.<system>` using `alejandra`

### Auto-discovery rules

Discovery logic is in `lib/functions.nix`. Module paths are configured via templates in `lib/configurations.nix`:

```nix
userModulesTemplate = "machines/<host>/users/<user>";
hostModulesTemplate = "machines/<host>/modules";
```

Hosts are all directories under `machines/`. Users are all directories under `machines/<host>/users/`.

A module is included automatically if it is:

- a `.nix` file directly inside the scanned directory (except `default.nix`), or
- a directory directly inside the scanned directory that contains `default.nix`

Scanned roots:

- NixOS global modules: `system/`
- NixOS host modules: `machines/<host>/modules/`
- Home Manager global modules: `home-manager/`
- Home Manager user modules: `machines/<host>/users/<user>/`

> Note: You can customize `hostModulesTemplate` and `userModulesTemplate` in `lib/configurations.nix` to change the directory structure.
> Nested module files are **not** auto-discovered unless imported by a discovered `default.nix` (for example `hyprland/default.nix` importing `hyprland/*.nix`).

### Primary user behavior

`data.primaryUser` is derived from the first discovered user for a host. It is used in places like:

- autologin (`machines/<host>/modules/login.nix`)
- SOPS age key path (`system/secrets/default.nix`)

If you use multiple users, make sure this behavior matches your expectations.

## Common commands

From repo root:

```bash
cd /path/to/your/dotfiles
```

List outputs:

```bash
nix flake show
```

Build a host without switching:

```bash
nix build .#nixosConfigurations.<host>.config.system.build.toplevel
```

Switch NixOS host:

```bash
sudo nixos-rebuild switch --flake .#<host>
```

Build Home Manager profile without switching:

```bash
nix build '.#homeConfigurations."<user>@<host>".activationPackage'
```

Switch Home Manager profile:

```bash
home-manager switch --flake .#<user>@<host>
# or if home-manager is not installed globally:
# nix run github:nix-community/home-manager -- switch --flake .#<user>@<host>
```

Format Nix files:

```bash
nix fmt
```

## Live ISO install helper

Use the interactive installer script from a NixOS live ISO:

```bash
cd /path/to/your/dotfiles
bash scripts/install-live-iso.sh
```

What it does:

- asks for password to unlock `keys.txt.enc` (AES-256 encrypted with OpenSSL)
- optionally scaffolds new hosts under `machines/<host>` (repeatable)
- asks for users for each host and creates user folders
- asks to configure `machines/<host>/modules/partitioning/default.nix`
- asks for target SSH (`user@ip`) and runs `nixos-anywhere --flake .#<host>`
- injects decrypted `keys.txt` as `/home/<primaryUser>/.dotfiles/keys.txt` via `--extra-files`

If `keys.txt.enc` does not exist but `keys.txt` exists, the script can create `keys.txt.enc` for you.
nixos-anywhere is destructive (through Disko), so the script requires explicit confirmation before wiping disks.

## Tutorial: add a user (existing host)

Example: add `alice` to host `hell`.

### 1) Create the user folder

```bash
mkdir -p machines/hell/users/alice
```

At minimum, add one Home Manager module that sets user basics, for example:

```nix
# machines/hell/users/alice/home/default.nix
{
  home = {
    preferXdgDirectories = true;
  };
}
```

Because discovery happens at `machines/hell/users/alice/*`, modules under `home/`, `programs/`, etc. are auto-loaded if they contain `default.nix`.

### 2) Add password secret for that user

This repo defines users declaratively with:

- `users.mutableUsers = false`
- `users.users.<name>.hashedPasswordFile = config.sops.secrets.<name>.path`

So each username must exist in `system/secrets/users.json` as a **password hash string**.

Generate a hash (SHA-512 crypt):

```bash
openssl passwd -6
```

Open SOPS file and add user key:

```bash
sops system/secrets/users.json
```

Inside decrypted view, add:

```json
{
  "alice": "$6$...your-hash..."
}
```

Save/exit; SOPS re-encrypts automatically.

### 3) Apply

```bash
sudo nixos-rebuild switch --flake .#hell
home-manager switch --flake .#alice@hell
```

## Tutorial: create (generate) a new host

Example: create host `void`.

### 1) Create host directories

```bash
mkdir -p machines/void/modules
mkdir -p machines/void/users/<primary-user>
```

### 2) Add mandatory module files

Create at least:

- `machines/void/modules/hardware-configuration.nix`
- `machines/void/modules/partitioning.nix` (if you use disko)
- `machines/void/modules/login.nix`, `locale.nix`, `programs.nix`, etc. as desired

A quick way is to copy from an existing host and adjust:

```bash
cp -r machines/hell/modules machines/void/
```

Then replace hardware/disk settings for the new machine.

Generate hardware config from target machine:

```bash
sudo nixos-generate-config --show-hardware-config > machines/void/modules/hardware-configuration.nix
```

### 3) Add at least one user for the host

```bash
mkdir -p machines/void/users/<primary-user>/home
```

Add user modules (`default.nix` files) under that user directory.

### 4) Add password secret for each host user

Edit `system/secrets/users.json` with SOPS and add one entry per username (same tutorial as above).

### 5) Build and switch

```bash
nix build .#nixosConfigurations.void.config.system.build.toplevel
sudo nixos-rebuild switch --flake .#void
```

Home profile:

```bash
home-manager switch --flake .#<primary-user>@void
```

## Tutorial: switch between hosts

To switch to another host config from this flake:

```bash
sudo nixos-rebuild switch --flake .#<host>
```

Examples:

```bash
sudo nixos-rebuild switch --flake .#hell
sudo nixos-rebuild switch --flake .#void
```

For each user session:

```bash
home-manager switch --flake .#<user>@<host>
```

## Customizing paths

If you want to use different directory structures, edit `lib/configurations.nix`:

```nix
userModulesTemplate = "machines/<host>/users/<user>";
hostModulesTemplate = "machines/<host>/modules";
```

For example, to use `hosts/` instead of `machines/`:

```nix
userModulesTemplate = "hosts/<host>/users/<user>";
hostModulesTemplate = "hosts/<host>/modules";
```

## Troubleshooting

- `attribute '<user>@<host>' missing`: ensure `machines/<host>/users/<user>/` exists and contains at least one discovered module.
- Password/auth problems on first boot: verify `system/secrets/users.json` has an entry for each username.
- SOPS decryption errors: check your age key exists at `/home/<primaryUser>/.config/sops/age/keys.txt` and matches `.sops.yaml` recipients.
- Module not loaded: check discovery rules (direct file or directory with `default.nix` in the scanned root).
