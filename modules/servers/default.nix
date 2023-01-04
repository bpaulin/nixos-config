{ ... }:
{
  imports = [
    ./k3s.nix
    ./openssh.nix
  ];

  users.users.bpaulin = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICLatnqf7B6dDnH9NepGdgo5xwNq4Zn7Lq/qrtuzSodF brunopaulin@bpaulin.net"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK/VsidDLXw+2KKToJfqgP9ka7FdYSnIhPGgNYrOhNzu bpaulin@lithium"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAKJV5Cl4HA7wlZPtkVLsU9LuIRJ+5B13bucTvmSxPlh bpaulin@boron"
    ];
  };
}

