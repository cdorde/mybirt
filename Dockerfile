FROM tomcat:8.0
AINTAINER "Dorde Cvijanovic <cdorde@gmail.com>"

RUN apt-get -y --force-yes install wget
RUN apt-get -y --force-yes install unzip

COPY birt-runtime-4.5.0-20150609.zip /tmp/birt.zip
RUN unzip "/tmp/birt.zip" -d /tmp/birt
RUN mv "/tmp/birt/birt-runtime-4_5_0/birt.war" "/usr/local/tomcat/webapps/birt.war"
RUN rm /tmp/birt.zip
RUN rm -f -r "/tmp/birt"
RUN unzip /usr/local/tomcat/webapps/birt.war -d /usr/local/tomcat/webapps/birt
RUN cd /usr/local/tomcat && ln -s /etc/tomcat conf

#Add JDBC
COPY ojdbc6.jar /usr/local/tomcat/webapps/birt/WEB-INF/lib

# Map Reports folder
VOLUME /usr/local/tomcat/webapps/birt/reports
VOLUME /usr/local/tomcat/webapps/birt

#Start
CMD ["catalina.sh", "run"]

#Port
EXPOSE 8080
