pipeline {
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    DOCKERHUB_CREDENTIALS_USR = 'aturganov'
  }
  agent any
  stages {
    // stage('Cloning Git') {
    //   steps {
    //     git 'https://github.com/aturganov/nginx-stage2.git'
    //   }
    // }
    stage('Test docker') {
      steps{
        sh "printenv"
        sh "docker version"
      }
    }
    stage('Building image') {
      steps{
        sh "docker build . -t aturganov/nginx-stage2:0.0.3"
      }
    }
    stage('Dockerhub login') {
      steps{
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('push image') {
        steps{
            sh 'docker push aturganov/nginx-stage2:0.0.3'
        }
    }
    // stage('Remove Unused docker image') {
    //   steps{
    //     sh "docker rmi $registry:$BUILD_NUMBER"
    //   }
    // }
  }
}