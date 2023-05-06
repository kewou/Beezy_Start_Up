pipeline {
    agent any
    tools {
        dockerTool 'docker'
    }
    environment {
        IMAGE_NAME = "beezy_start_up"
        APP_VERSION = "0.0.2"
        ARCHIVE = "${IMAGE_NAME}_${APP_VERSION}.tar"
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

        stage('Archive') {
            steps {
                // Create a tar archive of the Docker image               
                sh "docker save -o $ARCHIVE $IMAGE_NAME"
                sh "mv $ARCHIVE /VersionsArchives"              
            }
        }
              
    }
}
