#!/bin/bash
if [ $# -eq 4 ]; then
    if [ $4 = "F" ]; then
       docker run --name $1 -i -t -p $2:8080 -v $3:/usr/local/tomcat/webapps/birt/reports cdorde/mybirt:4.5.0
    else
       if [ $4 = "D" ]; then
          docker run --name $1 -d --restart=always -i -t -p $2:8080 -v $3:/usr/local/tomcat/webapps/birt/reports cdorde/mybirt:4.5.0
       else
          echo "wrong syntax. You must provide four parameters"
          echo "sh start.sh <Name of container> <Port where tomcat will server Birt> <Path to reports directory> <(F)oreground or (D)aemon mode"
          echo "sh start.sh BIRT001 9090 /root/birt_reports D"
       fi 
    fi
else
    echo "wrong syntax. You must provide four parameters"
    echo "sh start.sh <Name of container> <Port where tomcat will server Birt> <Path to reports directory> <(F)oreground or (D)aemon mode"
    echo "sh start.sh BIRT001 9090 /root/birt_reports D"
fi

