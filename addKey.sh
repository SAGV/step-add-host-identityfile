#!/bin/bash

home=$1
user=$2

host=$3
host_alias=$4
pempath=$5

# Make sure ~/.ssh exists.
if [ ! -d "$home/.ssh" ]; then
   mkdir -p "$home/.ssh"
   chown $user "$home/.ssh"
fi

# Make sure ~/.ssh/config exists.
if [ ! -f $home/.ssh/config ]; then
  touch $home/.ssh/config
  chown $user $home/.ssh/config
  chmod 0600 $home/.ssh/config
  echo "$home/.ssh/config created"
fi

# Use "Hostname" if the alias is not specified
if [ -z "$host_alias" ]; then
	host_alias=$host
fi

echo "Host $host_alias" >> $home/.ssh/config
echo "  Hostname $host" >> $home/.ssh/config
echo "  IdentityFile $pempath" >> $home/.ssh/config
echo "$home/.ssh/config updated"
