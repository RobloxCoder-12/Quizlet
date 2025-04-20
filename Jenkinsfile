pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = "true"
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo "🔄 Checking out code..."
                checkout scm
            }
        }

        stage('Verify Terraform Files') {
            steps {
                echo "🔍 Listing current directory contents:"
                bat 'dir'
            }
        }

        stage('Terraform Init') {
            steps {
                echo "🚀 Running terraform init..."
                bat 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                echo "✅ Validating configuration..."
                bat 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                echo "🧠 Planning infrastructure changes..."
                bat 'terraform plan -input=false'
            }
        }

        stage('Terraform Apply') {
            steps {
                echo "⚙️ Applying infrastructure changes..."
                bat 'terraform apply -auto-approve -input=false'
            }
        }
    }

    post {
        success {
            echo "🎉 Pipeline completed successfully!"
        }
        failure {
            echo "❌ Pipeline failed. Check logs above."
        }
        always {
            echo "📦 Terraform pipeline finished."
        }
    }
}
