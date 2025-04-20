pipeline {
    agent any

    tools {
        // 1. Use Jenkins NodeJS plugin (configure in Global Tools)
        nodejs "NodeJS-18" 
    }

    stages {
        stage('Clone Repository') {
            steps {
                git(
                    branch: 'main',
                    url: 'https://github.com/RobloxCoder-12/Quizlet.git',
                    credentialsId: 'your-github-credentials' // Required for private repos
                )
            }
        }

        stage('Install Dependencies') {
            steps {
                // 2. Directly use npm (plugin adds it to PATH)
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
