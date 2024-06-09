pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps{
                script {
                    checkout([
                        $class: 'GitSCM',
                        branches: [[name: 'main']],
                        userRemoteConfigs: [[credentialsId: 'github_token', url: 'https://github.com/AdvancedCloud/static-site.git']]
                    ])
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build --no-cache -t ybhatia500/staticsite:latest -f Dockerfile .'
                }
            }
            
        }
        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        sh 'echo "Username: $DOCKERHUB_USERNAME"'
                        sh 'echo "Username: $DOCKERHUB_PASSWORD"'
                        sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
                    }
                    sh "docker image push ybhatia500/staticsite:latest"
                }
            }
        }
    }
    
}