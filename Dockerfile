FROM maven:3.6.3-jdk-11-openj9

WORKDIR /src

# to benefit from docker build cache
COPY pom.xml /src/pom.xml
RUN mvn dependency:go-offline

COPY . /src
RUN mvn package -DskipTests

CMD ["sh", "-c" ,"java -jar target/*.jar"]