pipeline {
    agent any

    stages {
        // 1. Clone Repository with HTTPS and Credentials
        stage('Clone Repository') {
            steps {
                git(
                    branch: 'main',
                    url: 'https://github.com/RobloxCoder-12/Quizlet.git',
                    credentialsId: 'your-github-credentials-id' // Add credentials ID here
                )
            }
        }

        // 2. Install NodeJS through NVM (No Plugin Required)
        stage('Setup NodeJS') {
            steps {
                bat '''
                    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
                    nvm install 18
                    nvm use 18
                '''
            }
        }

        // 3. Build Stages
        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Build') {
            steps {
                bat 'npm run build'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed'
        }
    }
}
