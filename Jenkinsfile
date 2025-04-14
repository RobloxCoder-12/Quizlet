pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {
        stage('Clone Repo') {
            steps {
                // Clone the specific branch of the repository
                git branch: 'main', url: 'https://github.com/RobloxCoder-12/Quizlet'
            }
        }

        stage('Debug') {
            steps {
                // Debugging output: Print the current branch and Terraform version
                echo "Current branch: ${env.BRANCH_NAME}"
                sh 'terraform --version'  // Use 'bat' for Windows agents
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    // Run terraform init in the terraform directory
                    sh 'terraform init'  // Use 'bat' for Windows agents
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    // Run terraform plan in the terraform directory
                    sh 'terraform plan'  // Use 'bat' for Windows agents
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                // Ask for manual input before applying the changes
                input "Apply the changes?"
                dir('terraform') {
                    // Run terraform apply in the terraform directory
                    sh 'terraform apply -auto-approve'  // Use 'bat' for Windows agents
                }
            }
        }
    }
}
