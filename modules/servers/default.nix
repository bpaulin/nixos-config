{ config, pkgs, ... }:
{
  imports = [
    ./k3s.nix
    ./openssh.nix
  ];

  users.users.bpaulin = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICLatnqf7B6dDnH9NepGdgo5xwNq4Zn7Lq/qrtuzSodF brunopaulin@bpaulin.net"
    ];
  };
}

