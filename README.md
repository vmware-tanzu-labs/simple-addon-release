# Windows bosh add-on exe sample
## Why use Addons?
An addon uses a BOSH feature called the runtime config.  This feature allows you to apply, and update, software for all deployments (PCF Operations Manager tiles) which the BOSH director manages.  Common types of add-ons include file integrity monitoring software, syslog forwarders and login banners.  Addons are created as BOSH releases.  
## Addon Composition
Addon releases are composed of jobs, packages and blobs.  A sample release for windows can be found [here](https://github.com/pivotalservices/simple-addon-release); linux example [here]().

Directions adapted from BOSH release creation [docs](http://bosh.io/docs/create-release.html#update-pkging-specs).

```git clone https://github.com/pivotalservices/simple-addon-release.git```


```cd simple-addon-release```

Add driver installer to blobstore

```bosh add-blob ~/Downloads/installer.exe odbc/installer.exe```

update spec & packaging

```$ErrorActionPreference = "Stop";
trap { $host.SetShouldExit(1) }

Start-Process "C://var/vcap/packages/<yourpackagename>/<yourpackage>.exe" -ArgumentList /s /l c:\var\vcap\sys\log\<yourjob>\ <anyotherarguments> -Wait
```

Update final_name in final.yml

## Create your release

To create a local release:

```bosh create-release --force```

To create an archivable release:

```bosh create-release --force --tarball=releases/odbc-dev1.tgz```

## Addon Use
After we create our release, we’ll need to do the following steps:

- Log into our BOSH director
```bosh login```
- Update the runtime-config with our addon manifest
```bosh update-runtime-config runtime.yml```
- Upload our release to the director
```bosh upload-release odbc-dev1.tgz```
- Apply the runtime-config to our existing deployments.  You have to run the BOSH `deploy` command on any deployments that need updating.  This command is the only way to apply a new or updated runtime configuration.  In our case, we will use the PCF Operations manager “Apply Changes” button to update all our existing deployments at once.


A sample runtime config snippet is [here](./runtime.yml.example).

## Resources:
[BOSH Docs](http://bosh.io/)

[BOSH Releases](http://bosh.io/docs/release.html)

[Creating a BOSH Release](http://bosh.io/docs/create-release.html)

[BOSH Runtime-Config](http://bosh.io/docs/runtime-config.html)

[BOSH Deployment](http://bosh.io/docs/basic-workflow.html)

[Building Your First BOSH Release Video](https://youtu.be/l91q00Vu2h8)

[BOSH Addons](https://bosh.io/docs/runtime-config.html#addons).

[Using Bosh Add-Ons to Customize your CF Experience Video](https://www.youtube.com/watch?v=dmUSqX0ELGc)

[How to Use Concourse to Deliver BOSH Releases Video](https://youtu.be/tyJPSJ5k0ek)
