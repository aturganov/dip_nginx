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
    stage('Prepare image') {
      steps{
        sh './gen_index.sh "0.0.$BUILD_NUMBER"'
      }
    }
    stage('Building image app-nginx') {
      steps{
        sh "docker build . -t aturganov/app-nginx:0.0.$BUILD_NUMBER"
      }
    }
    stage('Push building image app-nginx') {
        steps {
          // docker login
          sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
          sh "docker push aturganov/app-nginx:0.0.$BUILD_NUMBER"
        }
    }

    /// Helm -> kube
    stage('Helm deploy app to k8s') {
        steps {
            sh "helm template ./helm/charts/app-nginx"
            //Создаем при необходимости namespace
            sh "kubectl create ns stage --dry-run=client"
            sh "helm upgrade --install app-nginx ./helm/charts/app-nginx --set=app_nginx_deployment.image.tag=0.0.$BUILD_NUMBER"
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