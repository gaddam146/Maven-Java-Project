FROM centos

LABEL Maintainer=gaddam146 Email=gaddam.manikanta@outlook.com

RUN yum update -y
RUN yum -y install java
RUN java -version

#RUN mkdir /opt/tomcat/

WORKDIR /opt
RUN sudo wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.52/bin/apache-tomcat-9.0.52.tar.gz
RUN tar xzvf apache-tomcat-9.0.52.tar.gz -C /opt/
RUN cp -R /opt/apache-tomcat-9.0.52.tar.gz/ /opt/tomcat

WORKDIR /opt/tomcat/webapps
COPY target/*.war /opt/tomcat/webapps/webapp.war

EXPOSE 8080

ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]
