// Добавим отслеживание TAG events
// https://www.jenkins.io/blog/2018/05/16/pipelines-with-git-tags/
// https://stackoverflow.com/questions/48363217/execute-jenkins-pipeline-step-only-when-building-a-tag

pipeline {
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    DOCKERHUB_USER = 'aturganov'
  }
  agent any
  
  stages {
    stage('Prerequisites') {
      steps{
        sh "printenv"
    //     sh "docker version"
    //     sh "docker-compose version"
    //     // Если kubectl не имеет подключения к кластеру очередь остановится
        sh "kubectl cluster-info"
    //     sh "helm version"
      }
    }    
    
    stage('Prepare image') {
      // Выбераем JOB_TAG (с jenkins), если сборка прилетела с ветки и TAG_NAME (c гита), если прилетел TAG 
      steps {
        script {
          // sh "$env.TAG_NAME"
          if (env.TAG_NAME != null) {
            sh './gen_index.sh "${TAG_NAME}"'
          } else {
            sh './gen_index.sh "${BUILD_TAG}"'
          }
        }
      }  
    }

    stage('Building image app-nginx') {
      steps{
        sh "docker build . -t aturganov/app-nginx:$BUILD_TAG"
      }
    }
    
    stage('Push building image app-nginx') {
        steps {
          // docker login
          sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_USER --password-stdin'
          sh "docker push aturganov/app-nginx:$BUILD_TAG"
        }
    }

    /// Helm -> kube
    stage('Helm deploy app to k8s') {
      expression { env.TAG_NAME != null }
      steps {
          sh "helm template ./helm/charts/app-nginx"
          //Создаем при необходимости namespace
          sh "kubectl create ns stage --dry-run=client"
          sh "helm upgrade --install app-nginx ./helm/charts/app-nginx --set=app_nginx_deployment.image.tag=$TAG_NAME"
          sh "kubectl get all -n stage"
      }
    }
  }
}