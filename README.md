# Step add-host-identityfile

Populate `.ssh/config` with a new Host and IdentityFile entry.

# Options

- `hostname` The actual url responsible for the alias.
- `alias` (optional) The name of the host to access via the IdentityFile. Will use `hostname` if not specified.
- `keyname` The name of the key variable to export, this is without the dollar sign prefix and without the `_PUBLIC` or `_PRIVATE` suffix.

# Example

``` yaml
build:
    steps:
        - siminm/step-add-host-identityfile:
            hostname: mycustomwebsite.com
            alias: production
            keyname: MYPACKAGE_KEY
```

This will add the following entry to the .ssh/config file for your user and root.

```
Host production
  Hostname mycustomwebsite.com
  IdentityFile /some/wercker/tmp/path/file
```

# siminm/add-host-identityfile

## 1.0.1

- Insert IdentityFile under a specific Host entry.
 
# wercker/step-add-ssh-key Changelog

## 1.0.0

- Add validation of key

## 0.0.3

- Fix: broken identity file

## 0.0.2

- Add ssh-key for root

## 0.0.1

- Initial version

# License

The MIT License (MIT)

Copyright (c) 2013 wercker
Copyright (c) 2014 Mikhail Simin
