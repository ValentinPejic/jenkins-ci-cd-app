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
                sh 'python3 app.py'
            }
        }
    }
}
