FROM tomcat:8.5.71-jre11-temurin
MAINTAINER "Dorde Cvijanovic <cdorde@gmail.com>"

RUN apt-get update && apt-get install wget unzip zip -y

#COPY birt-runtime-4.5.0-20150609.zip /tmp/birt.zip
#RUN wget -nv "http://download.eclipse.org/birt/downloads/drops/R-R1-4_5_0-201506092134/birt-runtime-4.5.0-20150609.zip" -P /tmp -O /tmp/birt.zip
#RUN wget -nv "http://download.eclipse.org/birt/downloads/drops/R-R1-4.6.0-201606072112/birt-runtime-4.6.0-20160607.zip" -P /tmp -O /tmp/birt.zip
#RUN wget -nv "https://download.eclipse.org/birt/downloads/drops/R-R1-4.7.0-201706222054/birt-runtime-4.7.0-20170622.zip" -P /tmp -O /tmp/birt.zip
#RUN wget -nv "https://download.eclipse.org/birt/downloads/drops/I-R1-4.8.0-201905212138/birt-runtime-4.8.0-20190521.zip" -P /tmp -O /tmp/birt.zip
#RUN wget -nv "https://download.eclipse.org/birt/downloads/drops/I-R1-4.9.0-201905231911/birt-runtime-4.9.0-20190523.zip" -P /tmp -O /tmp/birt.zip
RUN wget -nv "https://www.eclipse.org/downloads/download.php?file=/birt/updates/release/4.18.0/BIRT-Updates-4.18.0.zip&mirror_id=1285" -P /tmp -O /tmp/birt.zip
RUN unzip "/tmp/birt.zip" -d /tmp/birt
RUN mv "/tmp/birt/birt.war" "/usr/local/tomcat/webapps/birt.war"
RUN rm /tmp/birt.zip
RUN rm -f -r "/tmp/birt"
RUN unzip /usr/local/tomcat/webapps/birt.war -d /usr/local/tomcat/webapps/birt
RUN cd /usr/local/tomcat && ln -s /etc/tomcat conf

#Add JDBC
#COPY ojdbc6.jar /usr/local/tomcat/webapps/birt/WEB-INF/lib
RUN wget "http://www.java2s.com/Code/JarDownload/ojdbc6/ojdbc6.jar.zip" -P /tmp -O /tmp/ojdbc6.jar.zip
RUN unzip /tmp/ojdbc6.jar.zip -d /tmp
RUN cp /tmp/ojdbc6.jar /usr/local/tomcat/webapps/birt/WEB-INF/lib
RUN rm /tmp/ojdbc6.jar.zip
RUN rm /tmp/ojdbc6.jar

# Map Reports folder
VOLUME /usr/local/tomcat/webapps/birt/reports
VOLUME /usr/local/tomcat/webapps/birt
VOLUME /usr/share/fonts/truetype

#Start
CMD ["catalina.sh", "run"]

#Port
EXPOSE 8080
