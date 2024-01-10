FROM amazoncorretto

RUN yum update -y && yum install -y \
    curl \
    wget \
    tar \
    gzip

WORKDIR /tmp

# Download and install JDK
RUN wget https://download.oracle.com/java/18/archive/jdk-18.0.2.1_linux-x64_bin.tar.gz && \
    tar -xzf jdk-18.0.2.1_linux-x64_bin.tar.gz -C /usr/lib/jvm/ && \
    rm jdk-18.0.2.1_linux-x64_bin.tar.gz

# Download and install Maven
RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz && \
    tar -xzf apache-maven-3.9.6-bin.tar.gz -C /usr/local/ && \
    rm apache-maven-3.9.6-bin.tar.gz

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/jdk-18.0.2.1
ENV MAVEN_HOME=/usr/local/apache-maven-3.9.6
ENV PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin

# Cleanup temporary directory
WORKDIR /
RUN rm -rf /tmp

# Source the environment variables
RUN echo "export JAVA_HOME=$JAVA_HOME" >> /etc/profile && \
    echo "export MAVEN_HOME=$MAVEN_HOME" >> /etc/profile && \
    echo "export PATH=$PATH" >> /etc/profile && \
    echo "source /etc/profile" >> /etc/bash.bashrc

# Change java
RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-18.0.2.1/bin/java 101 && \
    update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-18.0.2.1/bin/javac 101 && \
    update-alternatives --set java /usr/lib/jvm/jdk-18.0.2.1/bin/java && \
    update-alternatives --set javac /usr/lib/jvm/jdk-18.0.2.1/bin/javac

WORKDIR /app
COPY . .
RUN mvn clean package

CMD ["java", "-jar", "target/words.jar"]
