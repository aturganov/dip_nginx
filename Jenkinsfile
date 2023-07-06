pipeline {
  agent {
    kubernetes {
      inheritFrom 'default'
      defaultContainer 'deploy'
    }
  }
  stages {
    //Build container image
    stage('Build') {
      steps {
        sh "printenv"
        container('deploy') {
          script {
            sh "echo 'test'"
            }
          }
        }
      }
    }
  }
}