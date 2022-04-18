pipeline {
    agent any
    stages {
        stage('Sonar Quality Analysis'){
            withSonarQubeEnv(credentialsId: 'sonar-cloud', installationName: 'sonarcloud') { 
                sh 'mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar'
            }
        } 
         stage('clean') {
            steps {
                sh 'mvn clean'
            }
      }
        stage('package') {
            steps {
                sh 'mvn package'
            }
      }
 
    }
}