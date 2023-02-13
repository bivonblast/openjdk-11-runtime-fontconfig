FROM registry.access.redhat.com/ubi8/openjdk-11-runtime:1.14-6.1666624577

USER root

RUN microdnf install yum
RUN yum install -y fontconfig

USER jboss

# Copy war file
COPY docker/fopengine-1.0.0-SNAPSHOT.jar /api.war

COPY src/main/resources/fop.xconf.xml /src/main/resources/fop.xconf.xml
COPY src/main/resources/templates/* /src/main/resources/templates/

# run the app
CMD ["java", "-jar", "/api.war"]
