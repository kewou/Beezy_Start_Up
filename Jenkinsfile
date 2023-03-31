pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Install dependencies') {
            steps {
                sh 'composer install'
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker.build("NOUMIA/beezyImage:${BUILD_NUMBER}")'
            }
        }
    }
}
