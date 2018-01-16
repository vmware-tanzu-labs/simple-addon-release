# Windows bosh add-on exe sample

Directions adapted from BOSH release creation [docs](http://bosh.io/docs/create-release.html#update-pkging-specs).

```git clone https://github.com/pivotalservices/simple-addon-release.git```


```cd simple-addon-release```

create directory and put driver.exe in that folder

update spec & packaging

Update final_name in final.yml

```bosh add-blob odbc-blobs/whatever.exe ODBC```

```bosh create-release --force```

More information about addons can be found [here](https://bosh.io/docs/runtime-config.html#addons).

A sample runtime config snippet is [here](./runtime.yml.example).
