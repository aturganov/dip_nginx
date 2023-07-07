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
    stage('Prerequisites') {
      steps{
        sh "printenv"
        sh "docker version"
        sh "docker-compose version"
        sh "kubectl version"
        sh "helm version"
      }
    }
    stage('Building image app-nginx') {
      steps{
        sh "docker build . -t aturganov/app-nginx:0.0.4"
      }
    }
    stage('Dockerhub login') {
      steps{
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('push image') {
        steps {
            sh "docker push aturganov/app-nginx:0.0.4"
        }
    }
    // stage('Remove Unused docker image') {
    //   steps{
    //     sh "docker rmi $registry:$BUILD_NUMBER"
    //   }
    // }
  }
}