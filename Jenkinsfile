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
                echo "No tests"
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                ssh -i /tmp/EC2-Ubuntu-Key.pem ubuntu@100.58.114.50 "
                    pkill node || true
                    cd ~/app
                    nohup node app.js > app.log 2>&1 &
                "
                '''
            }
        }
    }
}
