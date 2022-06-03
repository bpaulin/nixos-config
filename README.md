# My NixOs config

 > Don't use this! i'm not even using it on my main laptop (yet?)

## memo

Set unstable channesl:

```bash
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update
```

Set stable channesl:

```bash
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz home-manager
sudo nix-channel --add https://nixos.org/channels/nixos-22.05 nixos
sudo nix-channel --update
```

Update config:

```bash
sudo nixos-rebuild switch
```

Upgrade config:

```bash
sudo nixos-rebuild switch --upgrade
```

Clean unused configs:

```bash
sudo nix-collect-garbage -d
```

List installed packages (must be a better way)

```
nix-store -q --references /var/run/current-system/sw | cut -d'-' -f2- | grep -v '\-man' | grep -v '\-doc' | grep -v '\-info' | sort > packages.txt
```
