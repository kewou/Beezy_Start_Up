pipeline {
    agent any
    tools {
        dockerTool 'docker'
    }
    environment {
        IMAGE_NAME = "beezy_start_up"
        APP_VERSION = "0.0.2"
        NEXUS_URL = "http://localhost:8085/repository/docker-private"
        NEXUS_REPO = "BeezyStartUpRepo"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Update') {
            steps {
                sh "composer update"
            }
        }        
        stage('Install dependencies') {
            steps {
                sh "composer install"
            }
        }
        stage('Build Image') {
            steps {
                sh "docker build -t $IMAGE_NAME:$APP_VERSION ."
            }
        }
        stage('Archive') {
            steps {
                // Create a tar archive of the Docker image
                sh "docker save $IMAGE_NAME:$APP_VERSION -o $IMAGE_NAME-$APP_VERSION.tar"              
            }
        }      
    }
}
