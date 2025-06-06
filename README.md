# Jenkins Java Maven App

This repository contains a simple Java application built with Maven, designed to demonstrate continuous integration (CI) and continuous deployment (CD) workflows using Jenkins. It serves as a practical example for setting up a CI/CD pipeline for Java projects.

## Features

- Sample Java application with Maven build system
- Example unit tests
- Jenkins pipeline configuration for automated build and test
- Demonstrates best practices for CI/CD with Java and Jenkins

## Getting Started

### Prerequisites

- Java JDK 8 or higher
- Maven 3.x
- (Optional) Docker (for Jenkins setup)
- Git

### Cloning the Repository

```bash
git clone https://github.com/glenleach/jenkins-java-maven-app.git
cd jenkins-java-maven-app
```

### Building the Application

To build the application and run tests locally:

```bash
mvn clean install
```

### Running the Application

You can run the application using:

```bash
mvn exec:java -Dexec.mainClass="com.mycompany.app.App"
```

*(Replace `com.mycompany.app.App` with the actual main class if different.)*

## Jenkins Integration

This project is intended to be used with Jenkins for CI/CD. The repository includes a sample `Jenkinsfile` that defines the pipeline steps:

- Checkout code
- Build with Maven
- Run unit tests
- Archive build artifacts

### Setting Up Jenkins

1. Install Jenkins (locally or using Docker).
2. Install the required plugins (e.g., Maven Integration, Git).
3. Create a new Pipeline job and point it to this repository.
4. Jenkins will automatically detect the `Jenkinsfile` and execute the pipeline.

#### Example: Running Jenkins with Docker

```bash
docker run -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
```

## Project Structure

```
jenkins-java-maven-app/
├── src/
│   ├── main/
│   │   └── java/
│   │       └── com/
│   │           └── mycompany/
│   │               └── app/
│   │                   └── App.java
│   └── test/
│       └── java/
│           └── com/
│               └── mycompany/
│                   └── app/
│                       └── AppTest.java
├── pom.xml
├── Jenkinsfile
└── README.md
```

## References

- [Jenkins Documentation](https://www.jenkins.io/doc/)
- [Maven Documentation](https://maven.apache.org/guides/)
- [Sample Repo on GitHub](https://github.com/glenleach/jenkins-java-maven-app)

```

