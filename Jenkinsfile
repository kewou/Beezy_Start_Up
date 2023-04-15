pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Update') {
            steps {
                sh 'composer update'
            }
        }        
        stage('Install dependencies') {
            steps {
                sh 'composer install'
            }
        }        
    }
}
