pipeline {
  agent {
    kubernetes {
        yaml """
        apiVersion: v1
        kind: Pod
        spec:
            containers:
            - name: jnlp
              image: jenkins/inbound-agent:4.10-3-alpine-jdk8
              volumeMounts:
              - name: home-volume
                mountPath: /home/jenkins
              env:
              - name: HOME
                value: /home/jenkins
            volumes:
            - name: home-volume
              emptyDir: {}
        """
    }
  }
  stages {
    //Build container image
    // stage('Build') {
    //   steps {
    //     sh "printenv"
    //     container('deploy') {
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
        container('deploy') {
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
}