pipeline {
    agent any
    environment{
        registry = 'kth844/alpine'
        dockerHubCreds = 'alpine'
        dockerImage =''
    }
    stages {
        // stage('Sonar Quality Analysis'){
        //     steps{
        //         withSonarQubeEnv(credentialsId: 'sonar-cloud', installationName: 'sonarcloud') { 
        //             sh 'mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar'
        //         }
        //     }
        // } 
        //  stage('clean/package ') {
        //     steps {
        //         sh 'mvn clean package'
        //     }
        // }
        // stage('docker build'){
        //     steps{
        //         script {
        //             echo "$registry:$currentBuild.number"
        //             dockerImage = docker.build "$registry"
        //         }
        //     }
        // }
        // stage('docker push'){
        //     steps{
        //         script{
        //         docker.withRegistry('', dockerHubCreds){
        //             dockerImage.push("$currentBuild.number")
        //             dockerImage.push("latest")
        //         }
        //         }
        //     }
        // }
        // stage('Wait for approval') {
        //     steps {
        //         script {
        //             try {
        //                 timeout(time: 1, unit: 'MINUTES') {
        //                     approved = input message: 'Deploy to production?', ok: 'Continue',
        //                                        parameters: [choice(name: 'approved', choices: 'Yes\nNo', description: 'Deploy build to production')]
        //                     if(approved != 'Yes') {
        //                         error('Build did not pass approval')
        //                     }
        //                 }
        //             } catch(error) {
        //                 error('Build failed because timeout was exceeded')
        //             }
        //         }
        //     }
        // }
        stage('kubectl'){
            steps{
                script{
                    withKubeConfig([credentialsId: 'kubeconfig']) {
                        //   sh "aws eks update-kubeconfig --name kevin-sre-1285 --region us-east-1"
                          sh 'kubectl get pods'
                    }
                }
            }
        }
    }
}