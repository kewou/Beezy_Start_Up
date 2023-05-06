pipeline {
    agent any
    tools {
        dockerTool 'docker'
    }
    environment {
        IMAGE_NAME = "beezy_start_up"
        APP_VERSION = "0.0.2"
        ARCHIVE = "${IMAGE_NAME}_${APP_VERSION}.tar"
        DOCKER_REGISTRY_URL = "http://172.17.0.3:8085"
        DOCKER_REPO = "${DOCKER_REGISTRY_URL}/$IMAGE_NAME:${APP_VERSION}"        
        NEXUS_PASSWORD = "sonarSbeezy"
        NEXUS_USERNAME = "admin"
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

        stage('Archive and Save') {
            steps {
                // Create a tar archive of the Docker image               
                sh "docker save -o $ARCHIVE $IMAGE_NAME"
                sh '''
                    if [ ! -d "VersionsArchives" ]; then
                        mkdir "VersionsArchives"
                    fi
                '''
                sh "mv $ARCHIVE VersionsArchives"             
            }
        }
        stage('Docker login') {
            steps{
                sh '''
                    docker login -u $NEXUS_USERNAME -p "$NEXUS_PASSWORD" $DOCKER_REGISTRY_URL
                '''
            }
        }
        stage('Push On Nexus')  {
            steps{
                sh " docker push ${DOCKER_REPO}"
            }
        }      
    }
}
