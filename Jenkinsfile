pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Version') {
            steps {
                sh 'php -v'
            }
        }
        stage('Build') {
            steps {
                sh 'phing'
            }
        }        
    }
}
