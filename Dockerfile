FROM tomcat:10.1

# Clean default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR as ROOT
COPY InventorySystem.war /usr/local/tomcat/webapps/ROOT.war

# Fix Railway dynamic port issue
CMD ["sh", "-c", "sed -i \"s/port=\\\"8080\\\"/port=\\\"${PORT:-8080}\\\"/\" /usr/local/tomcat/conf/server.xml && catalina.sh run"]
