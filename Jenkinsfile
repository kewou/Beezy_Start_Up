pipeline {
    agent any
    tools {
        dockerTool 'docker'
    }
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
        stage('Build Version') {
            steps {
                sh 'docker --version'
            }
        }
    }
}
