FROM jenkins/jenkins:2.331-jdk17-preview
USER root
RUN apt-get update && apt-get install -y apt-transport-https \
       ca-certificates curl gnupg2 \
       software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli
RUN apt-get install -y openjdk-17-jdk openjdk-17-jre
RUN apt-get install -y wget
RUN wget https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
RUN tar xf apache-maven-*.tar.gz -C /opt
RUN apt remove --purge -y maven
RUN ln -s /opt/apache-maven-3.8.4 /opt/maven
COPY maven.sh /etc/profile.d/maven.sh
RUN chmod +x /etc/profile.d/maven.sh
RUN chmod +x /opt/maven
RUN . /etc/profile.d/maven.sh
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64
ENV M2_HOME=/opt/maven
ENV MAVEN_HOME=/opt/maven
ENV PATH "${M2_HOME}/bin":"${PATH}"
RUN mvn --version
RUN java -version
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.2 docker-workflow:1.27 maven-plugin:3.16"

