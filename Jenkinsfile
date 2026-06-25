pipeline {
    agent any

    environment {
        APP_HOST = "ec2-98-81-132-61.compute-1.amazonaws.com"
        APP_USER = "ubuntu"
        KEY = "/var/lib/jenkins/.ssh/app-key.pem"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/ValentinPejic/jenkins-ci-cd-app.git'
            }
        }

        stage('Build Docker Image') {
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

        stage('Deploy to App Server') {
            steps {
                sh """
                ssh -i ${KEY} -o StrictHostKeyChecking=no ${APP_USER}@${APP_HOST} '
                    rm -rf ~/app &&
                    mkdir -p ~/app
                '

                scp -i ${KEY} -o StrictHostKeyChecking=no -r . ${APP_USER}@${APP_HOST}:~/app

                ssh -i ${KEY} -o StrictHostKeyChecking=no ${APP_USER}@${APP_HOST} '
                    cd ~/app &&
                    docker compose down || true &&
                    docker compose up -d --build
                '
                """
            }
        }
    }
}
