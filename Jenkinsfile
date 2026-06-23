pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ValentinPejic/jenkins-ci-cd-app.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building app..."
            }
        }

        stage('Test') {
            steps {
                echo "No tests for Node app"
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                ssh ubuntu@54.221.66.255 "
                    pkill node || true
                    nohup node app.js > app.log 2>&1 &
                "
                '''
            }
        }
    }
}
