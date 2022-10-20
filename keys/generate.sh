machines=( lithium beryllium bore )
users=( bpaulin oneup )


rm -rf machines
mkdir -p machines

for m in "${machines[@]}"
do
   echo $m
   mkdir -p machines/$m/users
   ssh-keygen -q -t ed25519 -f machines/$m/id_ed25519_$m -C $m -N '""'
   for u in "${users[@]}"
   do
        echo "${u}_${m}"
        ssh-keygen -q -t ed25519 -f machines/$m/users/id_ed25519_${u}_${m} -C ${u}_${m} -N "$SSH_KEY_PASSPHRASE"
   done
done
