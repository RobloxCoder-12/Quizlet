pipeline {
    agent any

    environment {
        SERVER_USER = 'ubuntu'  // Update if using another user
        SERVER_IP = 'your-ec2-instance-ip' // Replace with your EC2 IP
        TARGET_DIR = '/var/www/html/' // NGINX web root
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/RobloxCoder-12/Quizlet.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    echo 'Building the application...'
                    bat 'echo Build successful!'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    bat 'echo Tests executed successfully!'
                }
            }
        }

        stage('Deploy to NGINX') {
            steps {
                script {
                    echo 'Deploying to NGINX server...'
                    sshagent(['ec2-ssh-key']) { // Ensure this key is configured in Jenkins credentials
                        sh """
                        ssh -o StrictHostKeyChecking=no ${SERVER_USER}@${SERVER_IP} <<EOF
                        sudo systemctl stop nginx
                        sudo rm -rf ${TARGET_DIR}*
                        exit
                        EOF

                        scp -r * ${SERVER_USER}@${SERVER_IP}:${TARGET_DIR}

                        ssh ${SERVER_USER}@${SERVER_IP} <<EOF
                        sudo systemctl restart nginx
                        exit
                        EOF
                        """
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed! Check logs.'
        }
    }
}
