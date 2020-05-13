# Red Hat registry and the base image
FROM registry.access.redhat.com/ubi8/ubi-minimal

# Install OpenJDK
#install java-1.8.0-openjdk --nodocs ;\
RUN microdnf install java-11-openjdk --nodocs

# Dir for my app
RUN mkdir -p /app

# Expose port
EXPOSE 8080
EXPOSE 9990

# Copy the MicroProfile starter app
COPY target/mp-demo-wildfly.jar /app/

# Finally, run the script
CMD ["java","-jar","app/mp-demo-wildfly.jar"]
