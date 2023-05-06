pipeline {
    agent any
    tools {
        dockerTool 'docker'
    }
    environment {
        IMAGE_NAME = "beezy_start_up"
        APP_VERSION = "0.0.2"
        ARCHIVE = "${IMAGE_NAME}_${APP_VERSION}.tar"
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
                sh '''
                    HOST="ftp.beezyweb.net"
                    USER="beezyweb.net"
                    PASSWD="delphine12"
                    FILE="VersionsArchives/test.txt"
                    ftp -n $HOST <<END_SCRIPT
                    quote USER $USER
                    quote PASS $PASSWD
                    put $FILE
                    quit
                    END_SCRIPT
                '''            
            }
        }      
    }
}
