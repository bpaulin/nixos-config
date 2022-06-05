# My NixOs config

 > Don't use this! i'm not even using it on my main laptop (yet?)

I have no real experience in nixos, so this will be a for ever work in progress. My choices here may be bad choices and should never taken as good practices. Best case scenario is 'it works on my laptop'

## Structure

On my laptops, /etc/nixos is a clone of this repo.

[configuration.nix](configuration.nix) is the first file read by nixos and (will) contain common system settings across my machines.

It expects a symlink **local** in **machines/**, targeting the real machine

| machine                 |                                                                |
| ----------------------- | -------------------------------------------------------------- |
| [oldc4](machines/oldc4) | my previous work laptop, now used as backup or testing machine |
| [hpc4](machines/hpc4)   | my current work laptop, the next one to migrate to nixos       |

In a machine folder:
 * **hardware-configuration.nix** is generated by nix and should never be modified
 * **configuration.nix** contains specific system settings and imports 'flavors' needed on this machine

| flavor                   |                                                                | imported by       |
| ------------------------ | -------------------------------------------------------------- | ----------------- |
| [base](flavors/base)     | shell related tools and config                                 | configuration.nix |
| [devops](flavors/devops) | everything to code, test and deploy with every tech i've tried | machine           |
| [work](flavors/work)     | proxy, connections, accessetc needed for my company            | machine           |
| [home](flavors/home)     | connections needed at home                                     | machine           |
| [x](flavors/x)           | graphical apps on gnome                                        | machine           |

This repo aims to be modular, but for now it has never been tested.

## Install

see [INSTALL.md](INSTALL.md)

## References

see [REFERENCES.md](REFERENCES.md)

