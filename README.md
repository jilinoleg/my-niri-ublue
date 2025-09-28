
My own personal image that adds Niri WM/wayland composer and some packages for my setup on top of Aurora (possibly with Bazzite variant later). Also adds Developer Edition packages without VS Code and some other specific things I don't want. If you want to use it for some unknown reason, you can replace underlying KDE with GNOME by using Bluefin image instead of Aurora.

A lot of packages I use are currently not installed into this image, because they can be installed with Homebrew (Linuxbrew) or Flatpak. Packages that I could install in distrobox are prefferably added here instead, as long as I use them often enough.

# Justfile Documentation

This `Justfile` contains various commands and configurations for building and managing container images and virtual machine images using Podman and other utilities.

## Environment Variables

- `repo_organization`: The GitHub repository owner (default: "yourname").
- `image_name`: The name of the image (default: "yourimage").
- `centos_version`: The CentOS version (default: "stream10").
- `fedora_version`: The Fedora version (default: "41").
- `default_tag`: The default tag for the image (default: "latest").
- `bib_image`: The Bootc Image Builder (BIB) image (default: "quay.io/centos-bootc/bootc-image-builder:latest").

## Aliases

- `build-vm`: Alias for `build-qcow2`.
- `rebuild-vm`: Alias for `rebuild-qcow2`.
- `run-vm`: Alias for `run-vm-qcow2`.


## Commands

### `check`

Checks the syntax of all `.just` files and the `Justfile`.

### `fix`

Fixes the syntax of all `.just` files and the `Justfile`.

### `clean`

Cleans the repository by removing build artifacts.

## Build Commands

### `build`

Builds a container image using Podman.

```bash
just build $target_image $tag $dx $hwe $gdx
```

Arguments:
- `$target_image`: The tag you want to apply to the image (default: aurora).
- `$tag`: The tag for the image (default: lts).
- `$dx`: Enable DX (default: "0").
- `$hwe`: Enable HWE (default: "0").
- `$gdx`: Enable GDX (default: "0").

## Building Virtual Machines and ISOs

### `build-qcow2`

Builds a QCOW2 virtual machine image.

```bash
just build-qcow2 $target_image $tag
```

### `build-raw`

Builds a RAW virtual machine image.

```bash
just build-raw $target_image $tag
```

### `build-iso`

Builds an ISO virtual machine image.

```bash
just build-iso $target_image $tag
```

### `rebuild-qcow2`

Rebuilds a QCOW2 virtual machine image.

```bash
just rebuild-qcow2 $target_image $tag
```

### `rebuild-raw`

Rebuilds a RAW virtual machine image.

```bash
just rebuild-raw $target_image $tag
```

### `rebuild-iso`

Rebuilds an ISO virtual machine image.

```bash
just rebuild-iso $target_image $tag
```

## Run Virtual Machines

### `run-vm-qcow2`

Runs a virtual machine from a QCOW2 image.

```bash
just run-vm-qcow2 $target_image $tag
```

### `run-vm-raw`

Runs a virtual machine from a RAW image.

```bash
just run-vm-raw $target_image $tag
```

### `run-vm-iso`

Runs a virtual machine from an ISO.

```bash
just run-vm-iso $target_image $tag
```

### `spawn-vm`

Runs a virtual machine using systemd-vmspawn.

```bash
just spawn-vm rebuild="0" type="qcow2" ram="6G"
```

## Lint and Format

### `lint`

Runs shell check on all Bash scripts.

### `format`

Runs shfmt on all Bash scripts.
