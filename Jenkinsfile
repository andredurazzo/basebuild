pipeline {
    
    agent any
    
    options {
        timestamps()
    }

    parameters {
        string(name: 'BUILD_BRANCH', defaultValue: 'master', description: 'Image to build')
    }
    
    stages {
        stage("git") {
            steps {
                checkout scm
            }
            post {
                failure {
                    echo "Error checkout branch ${params.BUILD_BRANCH}"
                }
            }
        }
        stage('Build image'){
             steps{
                 sh "docker build -t build-base:${params.BUILD_BRANCH} ."
             }  
            post {
                success {
                    echo "Image create  build-base:${params.BUILD_BRANCH}"
                }
            } 
        }  
    }
    
}
