pipeline {
    kubernetes {
      inheritFrom 'default'
      defaultContainer 'deploy'
    }
  }
  stages { 
      stage('sample'){
          steps{
              container('deploy'){
                echo "Hello world"
                sleep 600
              }
          }
      }
  }
}