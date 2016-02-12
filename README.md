# mybirt
##Docker automated build for Birt 4.5.0

If you want to start container in foreground mode using 

```
sh start.sh 
```

>or

```dockerfile
docker run --name <Your container name> -i -t 
       -p <Port whereyou want BIRT to work>:8080 
       -v <Your path to reports designer on host>:/usr/local/tomcat/webapps/birt/reports 
       cdorde/mybirt:4.5.0
```

If you want to start container as daemon use

```dockerfile
docker run --name <Your container name> -i -t 
       -p <Port whereyou want BIRT to work>:8080 
       -v <Your path to reports designer on host>:/usr/local/tomcat/webapps/birt/reports 
       -d 
       --restart=always
       cdorde/mybirt:4.5.0
```

After container is started, open browser and try to access tomcat on address

```
http://localhost:<Port you use in run command>/
```
If it is ok then open birt start page opening

```
http://localhost:<Port you use in run command>/birt
```

To check that engine is ok click "view example" link on bottom of page.
