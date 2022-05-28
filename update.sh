# Fail on first error
set -e
# Source env
source ./.private_env_run.sh
source ./.private_env_build.sh

# template files
mkdir -p etc
envsubst --no-unset --no-empty \
    -i etc-env/work_vpn.nmconnection -o etc/work_vpn.nmconnection
envsubst --no-unset --no-empty \
    -i etc-env/home_wifi.nmconnection -o etc/home_wifi.nmconnection

# update env structure
cat .private_env_run.sh | sed "s/=$VALUE.*/='REDACTED'/" > .private_env_run.dist
cat .private_env_build.sh | sed "s/=$VALUE.*/='REDACTED'/" > .private_env_build.dist

# only one thing to do now...
sudo nixos-rebuild switch
