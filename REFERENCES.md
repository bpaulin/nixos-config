# References

## Memo

Set stable channels:

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

Update hardware config:

```bash
nixos-generate-config --dir /etc/nixos/machines/local
```

Encrypt secrets

```bash
sops --encrypt secrets.json > secrets.enc.json
```

Decrypt secrets

```bash
sops --decrypt secrets.enc.json > secrets.json
```
