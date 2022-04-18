pipeline {
    agent any
    environment{
        registry = 'kth844/alpine'
        dockerHubCreds = 'alpine'
        dockerImage =''
    }
    stages {
        stage('Sonar Quality Analysis'){
            steps{
                withSonarQubeEnv(credentialsId: 'sonar-cloud', installationName: 'sonarcloud') { 
                    sh 'mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar'
                }
            }
        } 
         stage('clean/package ') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('docker build'){
            steps{
                script {
                    echo "$registry:$currentBuild.number"
                    dockerImage = docker.build "$registry"
                }
            }
        }
        stage('docker push'){
            steps{
                script{
                docker.withRegistry('', dockerHubCreds){
                    dockerImage.push("$currentBuild.number")
                    dockerImage.push("latest")
                }
                }
            }
        }
    }
}