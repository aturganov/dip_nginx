pipeline {
  agent {
    kubernetes {
      inheritFrom 'default'
    }
  }
  tools {
    dockerTool 'docker'
  }
  // options {
  //   buildDiscarder(logRotator(numToKeepStr: '5'))
  // }
  // environment {
  //   DOCKERHUB_CREDENTIALS = credentials('dockerhub_la')
  // }

  // def dockerTool = tool name: 'docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'
  // withEnv(["DOCKER=${dockerTool}/bin"]) 
  
  stages {
    // Build container image
    stage('Build') {
      steps {
        sh 'sudo sudo usermod -aG docker $USER'
        sh 'docker build . -t aturganov/nginx-stage2:0.0.3'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push aturganov/nginx-stage2:0.0.3'
      }
    }

    // stage('Build') {
    //   steps {
    //     sh "printenv"
    //     container('jnlp') {
    //       script {
    //         docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_la') {
    //           def pathTag = "aturganov/nginx-stage2:${JOB_BASE_NAME}"
    //           if(env.TAG_NAME == null || env.TAG_NAME.length() == 0) {
    //             pathTag = "${pathTag}-${BUILD_ID}"
    //           }
    //           //build the image
    //           def customImage = docker.build(pathTag)
    //           //upload it to the registry
    //           customImage.push()
    //         }
    //       }
    //     }
    //   }
    // }
    stage('Deploy') {
      // when {
      //     expression { env.TAG_NAME != null && env.TAG_NAME.length() > 0 }
      // }
      steps {
        container('jnlp') {
          // withKubeConfig([credentialsId: 'token-k8s-sa', namespace: "stage"]) {
          // withKubeConfig([credentialsId: 'k8s_au']) {
            // sh "helm upgrade --install app-nginx deploy --set image.tag=${TAG_NAME}"
            sh "echo hello"
            //sh "helm upgrade --install app-nginx deploy --set image.tag = aturganov/nginx-stage2:0.0.2"
          // }
        }
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}