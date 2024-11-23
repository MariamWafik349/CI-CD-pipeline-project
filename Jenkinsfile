pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'mariamwafik333/fullstackspringbootangular_2'
        DOCKER_TAG = 'latest'
        AWS_EC2_IP = 'your-ec2-ip'
        EC2_SSH_USER = 'your-ec2-ssh-user'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Pull the Docker image and build it
                    sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    sh 'docker push $DOCKER_IMAGE:$DOCKER_TAG'
                }
            }
        }
        stage('Deploy to AWS EC2') {
            steps {
                script {
                    // SSH into EC2 instance and deploy the image
                    sh """
                        ssh -o StrictHostKeyChecking=no $EC2_SSH_USER@$AWS_EC2_IP <<EOF
                        docker pull $DOCKER_IMAGE:$DOCKER_TAG
                        docker run -d -p 3000:3000 $DOCKER_IMAGE:$DOCKER_TAG
                        EOF
                    """
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
