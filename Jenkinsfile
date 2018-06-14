pipeline {
  agent any
  stages {
    stage('Check docker ') {
      steps {
        sh '''ls -la
tree -R'''
        sh 'docker info'
      }
    }
    stage('build image ') {
      steps {
        sh 'sudo docker build  --tag boodman/jeke:${BUILD_NUMBER} .'
        sh 'docker images | grep "jeke"'
      }
    }
    stage('run image') {
      steps {
        sh 'docker run --name korobka -tid -p 80:80 boodman/jeke:${BUILD_NUMBER}'
      }
    }
    stage('clean up ') {
      steps {
        sh 'docker rm -f korobka'
      }
    }
  }
  environment {
    Docker = 'yes'
    Custom = 'nginx '
  }
}