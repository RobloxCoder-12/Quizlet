pipeline {
    agent any

    stages {
        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    bat 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('terraform') {
                    bat 'terraform validate'
                }
            }
        }

       stage('Terraform Plan') {
    steps {
        dir('terraform') {
            bat '''
                echo --- Running Terraform Plan ---
                terraform plan -no-color
                echo --- Terraform Plan Completed ---
            '''
        }
    }
}


        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    bat 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            echo 'Terraform Pipeline Finished.'
        }
    }
}
