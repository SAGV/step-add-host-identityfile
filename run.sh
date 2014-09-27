#!/bin/bash

validate_key() {
  local private_key=$1;

  if [ -z "$private_key" ]; then
    fail "Private key not found. Do not prepend the keyname with a dollar sign and do not use _PRIVATE at the end.";
  fi
}

main() {
  # Get private key from wercker and validate it.
  local private_key=$(eval echo "\$${WERCKER_ADD_ADD_HOST_IDENTITYFILE_KEYNAME}_PRIVATE");
  validate_key "$private_key";

  # Put the key into a file that can be used by .ssh/config file.
  local ssh_key_path=$(mktemp);
  echo -e "$private_key" > $ssh_key_path

  # Add for current user
  $WERCKER_STEP_ROOT/addKey.sh "$HOME" "$USER" "$WERCKER_ADD_ADD_HOST_IDENTITYFILE_HOSTNAME" "$WERCKER_ADD_ADD_HOST_IDENTITYFILE_ALIAS" "$ssh_key_path"
  $WERCKER_STEP_ROOT/addKey.sh \
    "$HOME" \
    "$USER" \
    "$WERCKER_ADD_ADD_HOST_IDENTITYFILE_HOSTNAME" \
    "$WERCKER_ADD_ADD_HOST_IDENTITYFILE_ALIAS" \
    "$ssh_key_path"

  # Also add it for root
  $WERCKER_STEP_ROOT/addKey.sh \
    /root \
    root \
    "$WERCKER_ADD_ADD_HOST_IDENTITYFILE_HOSTNAME" \
    "$WERCKER_ADD_ADD_HOST_IDENTITYFILE_ALIAS" \
    "$ssh_key_path"
}

main;
