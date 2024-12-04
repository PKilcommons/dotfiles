# (Optional) Setup `keychain`
To improve ergonomics of dealing with `ssh-agent` and `ssh-add`, use
[`keychain`](https://www.funtoo.org/Funtoo:Keychain) instead. For instance, here's the
[Ubuntu package](https://packages.ubuntu.com/jammy/keychain).

See the `man` page for what command to run for your specific shell, for instance in `bash`:
```sh
eval $(keychain --clear --eval ${private_key} 2> /dev/null)
```

# (Optional) Install `fish`
If using `fish` as a shell, check the [main page](https://fishshell.com/) for installation instructions for your
specific distro's setup. For instance, on Ubuntu the [PPA](https://launchpad.net/~fish-shell/+archive/ubuntu/release-3)
should be used.

# Link with `stow`
Install GNU Stow. For instance `apt install stow` on Debian-based systems. Once installed and this repo is cloned, `cd`
to it and run `stow <package>` to symlink the directory. For instance, `stow git`.


# Install `nvim`

Install [dependencies](https://github.com/neovim/neovim/blob/master/BUILD.md#build-prerequisites)

```sh
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX="$HOME/.local/neovim" install
```

`$HOME/.local/neovim` can be changed to whatever. In any case, `./neovim/bin` must be in $PATH.

`CMAKE_BUILD_TYPE` can be set to `Release` for a smaller binary.

# Common tooling

## Toolchains
- gcc
- clang
- cmake
- [rustup](https://www.rust-lang.org/tools/install)

## Binaries
- [jq](https://jqlang.github.io/jq/download/)
- [fzf](https://junegunn.github.io/fzf/installation/)

### Python
All standalone Python applications should be installed with either [`uvx`](https://docs.astral.sh/uv/guides/tools/) or
[`pipx`](https://pipx.pypa.io/stable/installation/) to properly isolate the installs.

- [csvkit](https://csvkit.readthedocs.io/en/latest/)
- [tldr](https://github.com/tldr-pages/tldr)

### Rust
The easiest way to deal with Rust programs is to install
[`cargo binstall`](https://github.com/cargo-bins/cargo-binstall?tab=readme-ov-file#installation) to simplify
installations and [`cargo install-update`](https://github.com/nabijaczleweli/cargo-update?tab=readme-ov-file#manual) to
ease updating.

- [git-delta](https://github.com/dandavison/delta)
- [jj-cli](https://github.com/martinvonz/jj)
- [pdu](https://github.com/KSXGitHub/parallel-disk-usage)
