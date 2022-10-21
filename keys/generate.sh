users=( bpaulin oneup )
m=`hostname`
for u in "${users[@]}"
do
      echo "${u}_${m}"
      ssh-keygen -q -t ed25519 -f ~/.ssh/id_ed25519_${u} -C "${u}@${m}" -N "$SSH_KEY_PASSPHRASE"
done
