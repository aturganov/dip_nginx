pipeline {
    kubernetes {
      inheritFrom 'default'
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