pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/ValentinPejic/jenkins-ci-cd-app.git'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t student-web .'
            }
        }

        stage('Test') {
            steps {
                sh 'chmod +x tests/test.sh'
                sh './tests/test.sh'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploy phase'
            }
        }
    }
}
