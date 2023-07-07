pipeline {
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    DOCKERHUB_CREDENTIALS_USR = 'aturganov'
  }
  agent any
  stages {
    // Не требуется в опции pipline
    // stage('Cloning Git') {
    //   steps {
    //     git 'https://github.com/aturganov/dip_nginx.git'
    //   }
    // }
    stage('Prerequisites') {
      steps{
        sh "printenv"
        sh "docker version"
        sh "docker-compose version"
        // Если kubectl не имеет подключения к кластеру очередь остановится
        sh "kubectl cluster-info"
        sh "helm version"
      }
    }
    stage('Building image app-nginx') {
      steps{
        sh "docker build . -t aturganov/app-nginx:0.0.4"
      }
    }
    stage('push image') {
        steps {
          // docker login
          sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
          sh "docker push aturganov/app-nginx:0.0.4"
        }
    }

    /// Helm -> kube
    stage('helm deploy app to k8s') {
        steps {
            sh "helm template ./helm/charts/app-nginx"
            //Создаем при необходимости namespace
            sh "kubectl create ns stage --dry-run=client"
            sh "helm upgrade --install app-nginx ./helm/charts/app-nginx -n stage"
            sh "kubectl get all -n stage"
        }
    }


    // stage('Remove Unused docker image') {
    //   steps{
    //     sh "docker rmi $registry:$BUILD_NUMBER"
    //   }
    // }
  }
}