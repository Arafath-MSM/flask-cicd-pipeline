pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Install Dependencies') {
            steps {
                sh '''
                python -m venv venv
                source venv/bin/activate
                pip install -r requirements.txt
                '''
            }
        }
        stage('Run Tests') {
            steps {
                sh '''
                source venv/bin/activate
                pytest
                '''
            }
        }
        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t flask-app .
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                docker run -d -p 5000:5000 flask-app
                '''
            }
        }
    }
}
