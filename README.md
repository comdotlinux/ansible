# ansible ![yaml-lint](https://github.com/comdotlinux/ansible/workflows/yaml-lint/badge.svg) ![ansible-lint](https://github.com/comdotlinux/ansible/workflows/ansible-lint/badge.svg)

All my ansible playbooks are stored here. However not all are maintained.

## My Local setup (only tested on Linux Mint / Ubuntu / Pop OS)

1. This is stored in [local-setup](./local-setup) directory
1. Currently it does the following
   1. Installs some common softwares
      1. stow
      1. neovim
      1. htop
      1. conky-all
      1. byobu
      1. evolution-ews
      1. guake
      1. autokey-gtk
      1. slack-desktop
      1. powerline
      1. curl
      1. unzip
   1. Sets up the [bat](https://github.com/sharkdp/bat) `batcat` command as replacement of cat (`cat` is renamed to `oldcat`)
   1. Sets up [put](https://github.com/ericchiang/pup/)
   1. [Visual Studio Code](https://code.visualstudio.com/)
   1. [Docker](https://docs.docker.com/get-docker/)
   1. Sets Up [Jetbrains Font](https://www.jetbrains.com/lp/mono/) and [Powerline](https://fedoramagazine.org/add-power-terminal-powerline) fonts
   1. Installs / Upgrades GIT using [PPA](https://git-scm.com/download/linux)
   1. Installs [github-cli](https://github.com/cli/cli)
   1. Installs google-chrome
   1. Installs [hub](https://hub.github.com)
   1. [KeepassXC](https://launchpad.net/~phoerious/+archive/ubuntu/keepassxc)
   1. [Ngrok](https://ngrok.com/download)
   1. [Smplayer](https://www.smplayer.info/en/downloads)
   1. [peek](https://github.com/phw/peek#ubuntu)
   1. [VirtualBox](https://www.virtualbox.org/wiki/Downloads) including the extpack
   1. [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-using-native-package-management)
   1. [minikube](https://github.com/kubernetes/minikube)
   1. [insync](https://www.insynchq.com/)
   1. [yubico](https://support.yubico.com/support/solutions/articles/15000010964-enabling-the-yubico-ppa-on-ubuntu)

### Things planned (someday!)

1. Jetbrains Toolbox
1. [Openshift OC](https://console-openshift-console.apps.ocp-eu2.prod.nextcle.com/command-line-tools)
   * Problem seems to be that now this requires login.
