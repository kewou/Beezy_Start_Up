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

        stage('Deploy on Production')  {
            steps{
                ftpPublisher(
                    credentialsId: '06c30e65-ea15-46e0-a17e-9137b812844b',
                    serverName: 'ftp.beezyweb.net',
                    transfers: [
                        ftp {
                            remoteFile: 'Beezy_Start_Up',
                            localFile: 'VersionsArchives/test.txt',
                            direction: 'put'
                        }
                    ]
                )
            }
        }      
    }
}
