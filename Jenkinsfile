pipeline {
  agent {
    kubernetes {
      containerTemplate { name 'alpine' image 'alpine' command 'tail -f /dev/null'}
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