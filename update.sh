# Fail on first error
set -e

# Source env
source ./.private_env.sh

# template files
mkdir -p etc
for f in `ls etc-env`; do
    echo $f
    envsubst --no-unset --no-empty \
        -i etc-env/$f -o etc/$f
done

# update env structure
cat .private_env.sh | sed "s/=$VALUE.*/='REDACTED'/" > .private_env.dist.sh
