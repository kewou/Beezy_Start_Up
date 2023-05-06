pipeline {
    agent any
    tools {
        dockerTool 'docker'
    }
    environment {
        APP_VERSION = "0.0.1-SNAPSHOT"
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
                sh 'docker build -t beezy_start_up:$APP_VERSION .'
            }
        }
        stage('Run Image') {
            steps{
                sh 'docker run -p 8082:80 --name Beezy_START_UP -v /home/noumia/.docker/www/Beezy_Start_Up:/var/www/html beezy_start_up:$APP_VERSION'
            }
        }
    }
}
