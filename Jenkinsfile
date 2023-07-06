pipeline {
  environment {
    DOCKER_CERT_PATH = credentials('id-for-a-docker-cred')
    registry = "aturganov/nginx-stage2"
    registryCredential = 'dockerhub_la'
  }
  agent { 
    label 'agent1'
    // docker { image 'node:18.16.0-alpine' }
  }
  
  tools {
        dockerTool 'docker'
  }
  
  stages {
    // Build container image
    stage('Build') {
      steps{
        sh "docker version"
        script {
          docker.build registry + ":0.0.3"
        }
      }
      // steps {
      //   sh 'docker build . -t aturganov/nginx-stage2:0.0.3'
      // }
    }
    // stage('Login') {
    //   steps {
    //     sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
    //   }
    // }
    // stage('Push') {
    //   steps {
    //     sh 'docker push aturganov/nginx-stage2:0.0.3'
    //   }
    // }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}