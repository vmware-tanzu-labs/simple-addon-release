# Windows bosh add-on exe sample

Directions adapted from BOSH release creation [docs](http://bosh.io/docs/create-release.html#update-pkging-specs) 

```git clone https://github.com/pivotalservices/simple-addon-release.git```


```cd simple-addon-release```

create directory and put driver.exe in that folder

update spec & packaging

Update final_name in final.yml

```bosh add-blob odbc-blobs/whatever.exe ODBC```

```bosh create-release --force```
