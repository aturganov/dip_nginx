pipeline {
  environment {
    registry = "aturganov/nginx-stage2"
    registryCredential = 'dockerhub-pssw'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/gustavoapolinario/microservices-node-example-todo-frontend.git'
      }
    }
    stage('Test docker') {
      steps{
        sh "docker version"
      }
    }
    stage('Building image') {
      steps{
        script {
          // dockerImage = docker.build registry + ":$BUILD_NUMBER"
          dockerImage = docker.build registry + "0.0.3"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    // stage('Remove Unused docker image') {
    //   steps{
    //     sh "docker rmi $registry:$BUILD_NUMBER"
    //   }
    // }
  }
}