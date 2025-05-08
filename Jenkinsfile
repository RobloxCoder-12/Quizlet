pipeline {
    agent any

    environment {
        REGISTRY = "docker.io"  // Docker registry
        IMAGE_NAME = "your-dockerhub-username/quizlet"  // Replace with your image name
        K8S_DEPLOYMENT_NAME = "quizlet-deployment"
        K8S_NAMESPACE = "default"
    }

    stages {
        stage('Checkout SCM') {
            steps {
                // Checkout code from Git repository
                git branch: 'main', url: 'https://github.com/RobloxCoder-12/Quizlet.git'
            }
        }

        stage('Build App') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t ${REGISTRY}/${IMAGE_NAME}:latest .'
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    }

                    // Push Docker image to registry
                    sh 'docker push ${REGISTRY}/${IMAGE_NAME}:latest'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Deploy the app to Kubernetes
                    kubernetesDeploy(
                        kubeconfigId: 'k8s-config',  // Jenkins credentials for Kubernetes cluster
                        configs: 'k8s/deployment.yaml,k8s/service.yaml,k8s/ingress.yaml',  // Paths to your Kubernetes YAML files
                        enableConfigSubstitution: true
                    )
                }
            }
        }

        stage('Test App') {
            steps {
                script {
                    // You can add test commands or scripts here if needed
                    echo 'Running tests...'
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    // Cleanup or post-deployment tasks
                    echo 'Cleaning up after deployment...'
                }
            }
        }
    }

    post {
        always {
            // Actions that will run after every pipeline run, regardless of success or failure
            echo 'Pipeline execution completed.'
        }
        success {
            // Actions to take if the pipeline was successful
            echo 'Deployment Successful!'
        }
        failure {
            // Actions to take if the pipeline failed
            echo 'Deployment Failed.'
        }
    }
}

