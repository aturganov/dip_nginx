pipeline {
  agent {
    kubernetes {
      inheritFrom 'default'
    }
  }  
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    DOCKERHUB_CREDENTIALS_USR = 'aturganov'
  }
  
  stages {
    stage('Test docker') {
      steps{
        sh "printenv"
        sh "docker version"
      }
    }
    stage('Building image') {
      steps{
        sh "docker build"
      }
    }
    stage('Push image') {
        steps{
            sh 'Push image'
        }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "Deploy image"
      }
    }
  }
}