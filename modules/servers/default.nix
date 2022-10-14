{ config, pkgs, ... }:
{
  imports = [
    ./k3s.nix
    ./openssh.nix
  ];

  users.users.bpaulin = {
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDVMdiw46CR5vSunoLUvxwB48bc4NKD4QLXoVL9PdyoMR+2BA4S2hl/Obebkwm3495Opslbw2YhyKqSHeC83iHp/XYwvMhm835BnB+7ywffglSn3qq8mO4aXQ85KfDsf7wCosDaE0UFDkKwTTk7mPstVyD8HqX9F11waGw1WrJ48B1pCGEFiJfHPVDOUP7E3v3HTiXKvSQs33llF+XA/0NnAYepzuk08XxPivvTorx1xIUQwcN8m2Fed9kPKMpxfRawpvvrdOF1PuL+1n7ADjy+52olCiAzSP5T83pE25E6xgyTBi/nKfwh9rUgZVBcZm1KxBZwldXN6iQTb4WmXKKni/AWiS8pjW1QsJhEVVUfWpjCnLuii0n+AficjhXUiZ6V5hJ/kQZ2BxjER0fDwLCWnfzfot6d3HGoc/EVREJSfmHzOsHloYbXb3yEwrvfpHXs/273Gio3YP/PgOSX0givxjeMkwHstvAO+XzUhwDDU6Id5KDjDFBW3HENxOZBKXs=" # work
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTx7CHqLr9A9N63GeyWZRXIxCfZQGLI+PmZhkeoCdWLzTTXUEkQX7nTRz6wX8Gw94TIkcwLglAIToCFH7RwODnkauRdsG42xJUazSiVm2PInp7UFhPkeb+dFVyO6wa1YQWQyCEpH4WnXLBrjNyPQVjv3VRfKQPo9Rv+0v0n+zvC65O8WMPhyAVu2Bc/EUqv+GlXTCaJ/hoB/xiLXTJgFyHzoeo0+UoWirGbQkb7mBvCY2R0YnoNl1dQ6dR2RNbzXpzDERTUw37BJm9XlXyF6TrXc7FFY9cGHp7q2yKzN3nRMmsQJwFfU/WijHCDQetIrJODs3+/4NCWFW+N8JeFMjzEUPN4lA981MRu5bMWc/O/sjpvuT+06V6sUkmuofNvewRxEs4Egw7mbBwVOzmdxD9FcjO+57pRr90EkSgcVyGmUJ1dpcYZPVs7E76NDduJHWN37yzyKAax0vNR4JHtEMLexZ+Sb9ZTXyP7iCgn7GP/vDAPlcE4pLBp/q0hQ3GQis=" # perso
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICLatnqf7B6dDnH9NepGdgo5xwNq4Zn7Lq/qrtuzSodF brunopaulin@bpaulin.net"
    ];
  };
}

