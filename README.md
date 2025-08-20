# macOS Workstation Builder for Sequoia

Some shell scripts to help me set up development environments on macOS Sequoia.

## Setup Process:

1. Basic macOS Setup: `./setup_macos_and_install_homebrew.sh`
2. Configure macOS preferences: `./setup_macos_defaults.sh`
3. Install any dependencies required for the Bundle install: `./install_homebrew_bundle_dependencies.sh`
4. Install Homebrew Bundle (core, cask, mas): `./install_brewfile.sh`
	- For Mac App Store installs:
		1. Sign into the Mac App Store Australia _first_
		2. When prompted, sign out of Australia, and sign into the USA App Store
		3. At completion, you can revert to the Australian MAS.
5. Sign into Dropbox.
6. Set up dotfiles and required symlinks: `./setup_dotfiles.sh`
7. Install VSCodium extensions and preferences: `./install_vscodium_extensions_and_settings.sh`
8. Install LaTeX packages via tlmgr: `./install_tex_packages.sh`
