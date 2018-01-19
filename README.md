# Windows bosh add-on exe sample

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

Create your release

```bosh create-release --force```

To create an archivable release

```bosh create-release --force --tarball=releases/odbc-dev1.tgz```

Upload releases

```bosh upload-release odbc-dev1.tgz```

Update runtime config

```bosh update-runtime-config runtime.yml```

_Apply changes_ from OpsMgr


More information about addons can be found [here](https://bosh.io/docs/runtime-config.html#addons).

A sample runtime config snippet is [here](./runtime.yml.example).
