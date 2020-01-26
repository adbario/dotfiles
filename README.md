# Dotfiles (macOS Catalina)

This repository is a collection of config files and install scripts I use to setup my Mac.

**WARNING:** If you wish to use these dotfiles, you should review the code and remove things you don't want or need.

At least the following changes should be made:

1. Change Oh My Zsh installation path and default user in [config/zsh/.zshrc](config/zsh/.zshrc) to your own values.
2. Change Git username and email address in [git.sh](git.sh) to your own values.

**NOTE:** Visual Studio Code currently has a bug that requires security permissions before it can be opened. Installer loops opening VS Code as long as the permissions are missing. Security & Privacy settings are opened automatically where permissions can be given. Read more: https://github.com/microsoft/vscode/issues/74782

## Install

Clone the repository:

```bash
git clone https://github.com/adbario/dotfiles.git
cd dotfiles
```

Configure Mac OS X:

```bash
bash macos.sh
```

Install and configure applications:

```bash
bash install.sh
```

Install and configure Vagrant:

```bash
bash vagrant.sh
```

Install color profiles and PDF export settings:

```bash
bash adobe.sh
```

Configure git:

```bash
bash git.sh
```

## Additional steps

### Xcode

Install Xcode from App Store. To install Network Link Conditioner, download [Additional Tools for Xcode](https://developer.apple.com/download/more/?=additional%20tools) (requires login).

### iTerm2

Copy iTerm2 preferencies:

1. Open iTerm2
2. Open preferencies: `CMD + ,`
3. Select `Preferencies` tab and select `Load preferencies from a custom folder or URL`
4. Select folder `config/iterm2` and restart iTerm2

### VirtualBox

If you wish to install VirtualBox, it needs to be done manually as VirtualBox kernel extension requires extra permissions.

[Download VirtualBox](https://www.virtualbox.org/wiki/Downloads)

### Other applications

- Pocket: install from App Store https://apps.apple.com/us/app/pocket/id568494494?mt=12
- The Unarchiver: install from App Store https://apps.apple.com/us/app/the-unarchiver/id425424353?mt=12

### SSH key

Copy existing SSH keys to `~/.ssh/` folder or generate a new one:

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

### Cloudflare DNS

Use Cloudflare 1.1.1.1 as DNS resolver. Set the following addresses as DNS servers:

```
1.1.1.1
1.0.0.1
2606:4700:4700::1111
2606:4700:4700::1001
```

Read more: https://1.1.1.1/dns/
