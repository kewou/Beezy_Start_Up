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
        stage('Build Image') {
            steps {
                sh 'docker build -t beezy_start_up:0.0.1 .'
            }
        }
    }
}
