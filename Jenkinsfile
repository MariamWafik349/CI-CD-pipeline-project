pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/MariamWafik349/CI-CD-pipeline-project.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('mariamwafik333/fullstackspringbootangular_2')
                }
            }
        }
        stage('Push to DockerHub') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub-credentials', url: '']) {
                    script {
                        docker.image('mariamwafik333/fullstackspringbootangular_2').push('latest')
                    }
                }
            }
        }
        stage('Deploy to EC2') {
            steps {
                sshagent(['ec2-ssh-credentials']) {
                    sh '''
                    docker pull mariamwafik333/fullstackspringbootangular_2:latest
                    docker stop $(docker ps -q) || true
                    docker run -d -p 80:3000 mariamwafik333/fullstackspringbootangular_2:latest
                    '''
                }
            }
        }
    }
}
