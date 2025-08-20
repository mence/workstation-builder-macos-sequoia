# macOS Workstation Builder for Sequoia

Some shell scripts to help me set up development environments on macOS Sequoia.

## Setup Process:

1. `./setup_macos_and_install_homebrew.sh`
2. `./setup_macos_defaults.sh`
3. `./install_homebrew_bundle_dependencies.sh`
4. `./install_brewfile.sh`
	- For Mac App Store installs:
		1. Sign into the Mac App Store Australia _first_
		2. When prompted, sign out of Australia, and sign into the USA App Store
		3. At completion, you can recert to the Australian MAS.
5. Sign into Dropbox.
6. `./setup_dotfiles.sh`
7. `./install_vscodium_extensions_and_settings.sh`
8. `./install_tex_packages.sh`
