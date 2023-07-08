pipeline {
  agent {
    kubernetes {
      inheritFrom 'default'
    }
  }  
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub_la')
  }
  
  tools {
        dockerTool 'docker'
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
        // sh "docker build"
        sh "echo docker build"
      }
    }
    stage('Push image') {
        steps{
            sh 'echo Push image'
        }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "echo Deploy image"
      }
    }
  }
}