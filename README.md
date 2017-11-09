WMA NFS
---

[![Build Status](https://travis-ci.org/USGS-CIDA/cookbook-wma-clamav.svg?branch=master)](https://travis-ci.org/USGS-CIDA/cookbook-wma-clamav)

Description
-----------

Configures the whitelist for a ClamAV installation

Requirements
------------

None

### Attributes (See attributes/default.rb for examples)

- `default['wma']['clamav']['config']['whitelist']['signatures']['definitions']`
(Default: []) - An array of strings that define the names of the virus signatures
to add to the whitelist - See http://www.clamav.net/documents/how-do-i-ignore-whitelist-a-clamav-signature
- `default['wma']['clamav']['config']['whitelist']['signatures']['config_file']`
(Default: '/var/lib/clamav/whitelist.ign2') - The location of the configuration file
which clamAV picks up to use as a signature whitelist
- `default['wma']['clamav']['config']['whitelist']['files']['definitions']`
(Default: []) - An array of strings that define the names of files to add to the
whitelist. This assumes that the scan process knows about this file and uses it
to add to the list of excludes.
- `default['wma']['clamav']['config']['whitelist']['files']['config_file']`
(Default: '/etc/sysconfig/clamav') - The location of the configuration file
which clamAV picks up to use as a file whitelist
- `default['wma']['clamav']['config']['dir']`
(Default: '/var/lib/clamav') - The directory where the signature whitelist should
be placed
- `default['wma']['clamav']['config']['user']`
(Default: 'clamav') - The name of the user that runs ClamAV
- `default['wma']['clamav']['config']['group']`
(Default: 'clamav') - The name of the group that runs ClamAV

## Usage

To add a file or signature whitelist, simply run the `wma-clamav::whitelist` recipe

An example attribute set that will write both signatures and file exclusions will
look like:

```json
{
  "wma" : {
    "clamav" : {
      "config" : {
        "whitelist" : {
          "signatures" : { "definitions"  : ["SecuriteInfo.com.Adware.Skodna.Generic.JA.25338.10539.25885"]},
          "files" : { "definitions"  : ["/some/random/file.txt"] }
        }
      }
    }
  }
}
```

## License and Author

Author: Ivan Suftin (isuftin@usgs.gov)

See CPL1.0 LICENSE file for licensing details
