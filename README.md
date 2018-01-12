# Windows bosh add-on exe sample

```git clone https://github.com/pivotalservices/simple-addon-release.git```


```cd simple-addon-release```

create directory and put driver.exe in that folder

update spec & packaging

Update final_name in final.yml

```bosh add-blob odbc-blobs/whatever.exe ODBC```

```bosh create-release --force```
