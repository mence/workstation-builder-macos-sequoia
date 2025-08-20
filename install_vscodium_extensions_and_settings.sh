#!/bin/bash

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

source $(dirname "$0")/scripts/bash_helper_functions.sh

header_message "macOS Sequoia Workstation Builder"

warning_message "VSCodium needs to be run for the first time to initialise settings locations."

read -p "Press Enter once VSCodium has been run for the first time and closed."

# TODO: Automate opening VSCodium (open ~/Applications/VSCodium.app ?)
# TODO: Automate killing VSCodium (osascript to kill VSCodium?) - would this override the Apple security check and therefore fail to properly load VSCodium?

info_message "VSCodium > Backing up existing default user settings.json ..."

cp -v ~/Library/Application\ Support/VSCodium/User/settings.json ~/Library/Application\ Support/VSCodium/User/settings_default.json_bak || true

info_message "VSCodium > Applying user settings.json ..."

cp -v ./vscodium_settings.json ~/Library/Application\ Support/VSCodium/User/settings.json

info_message "VSCodium > Backing up existing default keyboard shortcuts ..."

cp -v ~/Library/Application\ Support/VSCodium/User/keybindings.json ~/Library/Application\ Support/VSCodium/User/keybindings_default.json_bak || true

info_message "VSCodium > Applying user keybindings ..."

# TODO: Copy keybindings.json from Windows PC or MacOS Monterey installation

# cp -v ./vscodium_keybindings.json ~/Library/Application\ Support/VSCodium/User/keybindings.json

info_message "VSCodium > Copying Visual Studio Code and Open VSX Marketplace product.json settings ..."

cp -v ./vscodium_vscode-marketplace_product.json ~/Library/Application\ Support/VSCodium/product_vscode-marketplace.json
cp -v ./vscodium_open-vsx_product.json ~/Library/Application\ Support/VSCodium/product_open-vsx.json

info_message "VSCodium > Setting VSCodium Extensions Gallery to Visual Studo Code Marketplace ..."

cp -v ~/Library/Application\ Support/VSCodium/product_vscode-marketplace.json ~/Library/Application\ Support/VSCodium/product.json

info_message "VSCodium > Listing existing VSCodium extensions ..."

codium --list-extensions --show-versions

info_message "VSCodium > Installing VSCodium extensions ..."

# TODO: Reduce number of extensions installed here, lots of dupes especially themes

codium --install-extension aaaaronzhou.nginx-config-formatter-vscode-extension || true
codium --install-extension aaron-bond.better-comments || true
codium --install-extension abusaidm.html-snippets || true
codium --install-extension alexdauenhauer.catppuccin-noctis || true
codium --install-extension alexkrechik.cucumberautocomplete || true
codium --install-extension anseki.vscode-color || true
codium --install-extension arcticicestudio.nord-visual-studio-code || true
codium --install-extension bbenoist.nix || true
codium --install-extension bceskavich.theme-dracula-at-night || true
codium --install-extension bierner.color-info || true
codium --install-extension bierner.markdown-mermaid || true
codium --install-extension bierner.markdown-preview-github-styles || true
codium --install-extension bpruitt-goddard.mermaid-markdown-syntax-highlighting || true
codium --install-extension bungcip.better-toml || true
codium --install-extension christian-kohler.npm-intellisense || true
codium --install-extension christian-kohler.path-intellisense || true
codium --install-extension codezombiech.gitignore || true
codium --install-extension continue.continue || true
codium --install-extension darkriszty.markdown-table-prettify || true
codium --install-extension davidanson.vscode-markdownlint || true
codium --install-extension dbaeumer.vscode-eslint || true
codium --install-extension dcasella.monokai-plusplus || true
codium --install-extension donjayamanne.githistory || true
codium --install-extension dotjoshjohnson.xml || true
codium --install-extension dracula-theme.theme-dracula || true
codium --install-extension eamodio.gitlens || true
codium --install-extension editorconfig.editorconfig || true
codium --install-extension eg2.vscode-npm-script || true
codium --install-extension enkia.tokyo-night || true
codium --install-extension Equinusocio.vsc-material-theme || true
codium --install-extension Equinusocio.vsc-material-theme-icons || true
codium --install-extension Equinusocio.moxer-theme || true
codium --install-extension Equinusocio.moxer-icons || true
codium --install-extension esbenp.prettier-vscode || true
codium --install-extension evgeniypeshkov.syntax-highlighter || true
codium --install-extension file-icons.file-icons || true
codium --install-extension formulahendry.auto-close-tag || true
codium --install-extension hookyqr.beautify || true
codium --install-extension humao.rest-client || true
codium --install-extension ibm.output-colorizer || true
codium --install-extension idleberg.hopscotch || true
codium --install-extension james-yu.latex-workshop || true
codium --install-extension jnoortheen.nix-ide || true
codium --install-extension oouo-diogo-perdigao.docthis || true
codium --install-extension johnpapa.vscode-peacock || true
codium --install-extension jolaleye.horizon-theme-vscode || true
codium --install-extension keesschollaart.vscode-home-assistant || true
codium --install-extension kisstkondoros.vscode-gutter-preview || true
codium --install-extension lonefy.vscode-js-css-html-formatter || true
codium --install-extension magicstack.magicpython || true
codium --install-extension marlosirapuan.nord-deep || true
codium --install-extension mblode.pretty-formatter || true
codium --install-extension mgmcdermott.vscode-language-babel || true
codium --install-extension mhutchie.git-graph || true
codium --install-extension monosans.djlint || true
codium --install-extension ms-azuretools.vscode-docker || true
codium --install-extension ms-kubernetes-tools.vscode-kubernetes-tools || true
codium --install-extension ms-mssql.mssql || true
codium --install-extension ms-python.python || true
codium --install-extension ms-toolsai.jupyter || true
codium --install-extension ms-toolsai.jupyter-keymap || true
codium --install-extension ms-toolsai.jupyter-renderers || true
codium --install-extension ms-toolsai.vscode-jupyter-cell-tags || true
codium --install-extension ms-toolsai.vscode-jupyter-slideshow || true
codium --install-extension ms-vscode.go || true
codium --install-extension ms-vscode.powershell || true
codium --install-extension ms-vscode.sublime-keybindings || true
codium --install-extension ms-vscode.theme-1337 || true
codium --install-extension ms-vscode.theme-markdownkit || true
codium --install-extension msjsdiag.debugger-for-chrome || true
codium --install-extension msjsdiag.vscode-react-native || true
codium --install-extension oderwat.indent-rainbow || true
codium --install-extension pflannery.vscode-versionlens || true
codium --install-extension pkief.material-icon-theme || true
codium --install-extension prisma.vscode-graphql || true
codium --install-extension pshershov.blueberry-banana || true
codium --install-extension psudo-dev.nebula-oni-theme || true
codium --install-extension randomfractalsinc.vscode-data-preview || true
codium --install-extension rebornix.ruby || true
codium --install-extension redhat.java || true
codium --install-extension redhat.vscode-xml || true
codium --install-extension redhat.vscode-yaml || true
codium --install-extension reditorsupport.r || true
codium --install-extension rust-lang.rust || true
codium --install-extension samuelcolvin.jinjahtml || true
codium --install-extension sdras.night-owl || true
codium --install-extension shardulm94.trailing-spaces || true
codium --install-extension shd101wyy.markdown-preview-enhanced || true
codium --install-extension streetsidesoftware.code-spell-checker || true
codium --install-extension teabyii.ayu || true
codium --install-extension this-fifo.natty || true
codium --install-extension timonwong.shellcheck || true
codium --install-extension tombonnike.vscode-status-bar-format-toggle || true
codium --install-extension twxs.cmake || true
codium --install-extension tyriar.sort-lines || true
codium --install-extension vincaslt.highlight-matching-tag || true
codium --install-extension vscode-icons-team.vscode-icons || true
codium --install-extension wakatime.vscode-wakatime || true
codium --install-extension wesbos.theme-cobalt2 || true
codium --install-extension wingrunr21.vscode-ruby || true
codium --install-extension wmaurer.change-case || true
codium --install-extension xabikos.javascriptsnippets || true
codium --install-extension zhuangtongfa.material-theme || true
codium --install-extension zignd.html-css-class-completion || true

info_message "VSCodium > Reverting product.json to Open VSX Marketplace ..."

cp -v ~/Library/Application\ Support/VSCodium/product_open-vsx.json ~/Library/Application\ Support/VSCodium/product.json

warning_message "The following extensions need to be manually installed in VSCodium with the Visual Studio Code Marketplace enabled: "

# TODO: Work out why these extensions aren't able to be installed from CLI. Possibly due to untrusted publisher settings?

echo "AtomMaterial.a-file-icon-vscode"
echo "brittanychiang.halcyon-vscode"
echo "lakshits11.ayu-monokai"
echo "siris01.ayu-green"
echo "shakram02.bash-beautify"

info_message "VSCodium > Finished."
