pipeline {
    agent any
<<<<<<< HEAD
=======
    tools {
        dockerTool 'docker'
    }
    environment {
        IMAGE_NAME = "beezy_start_up"
        APP_VERSION = "0.0.2"
        ARCHIVE = "${IMAGE_NAME}_${APP_VERSION}.zip"
    }
>>>>>>> branchForDelete
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

        stage('Archive and Save') {
            steps {
                // Create a tar archive of the Docker image               
                //sh "docker save -o $ARCHIVE $IMAGE_NAME"
                sh '''
                    if [ ! -d "VersionsArchives" ]; then
                        mkdir "VersionsArchives"
                    fi
                '''
                sh "zip -r $ARCHIVE ."
                sh "mv $ARCHIVE VersionsArchives"             
            }
        }      
    }
}
