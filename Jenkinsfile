pipeline {
    agent any

    environment {
        // Optionally set NODE_ENV or other env variables
        NODE_ENV = 'production'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/RobloxCoder-12/Quizlet.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install Node.js dependencies
                bat 'npm install'
            }
        }

        stage('Build') {
            steps {
                // Build the project (adjust command if your build script is different)
                bat 'npm run build'
            }
        }

        stage('Archive Build Artifacts') {
            steps {
                // Archive the build/ directory so you can download it from Jenkins if needed
                archiveArtifacts artifacts: 'build/**', allowEmptyArchive: false
            }
        }

        // Uncomment and configure this stage if you want to deploy
        // stage('Deploy') {
        //     steps {
        //         // Replace 'your-ssh-credential-id' and 'user@yourserver:/var/www/html/' appropriately
        //         sshagent(credentials: ['your-ssh-credential-id']) {
        //             bat 'scp -r build/* user@yourserver:/var/www/html/'
        //         }
        //     }
        // }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed! Check logs for errors.'
        }
    }
}
