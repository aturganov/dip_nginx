pipeline {
    kubernetes {
      inheritFrom 'default'
      defaultContainer 'deploy'
    }
  }
  stages { 
      stage('sample'){
          steps{
              container('alpine'){
                echo "Hello world"
                sleep 600
              }
          }
      }
  }
}