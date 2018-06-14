pipeline {
  agent any
  stages {
    stage('Build docker container') {
      parallel {
        stage('Build docker container') {
          agent {
            dockerfile {
              filename 'Dockerfile'
            }

          }
          environment {
            docker = 'yes'
            Image = 'nginx'
          }
          steps {
            sh '''ls -la
tree -R
'''
            echo 'Here is a directory'
          }
        }
        stage('Check docker') {
          steps {
            sh 'docker info'
          }
        }
        stage('Build image ') {
          steps {
            sh '''sudo docker build  --tag boodman/jeke:${BUILD_NUMBER} .
'''
            echo 'Build  image with tag ${BUILD_NUMBER}'
            sh 'docker images | grep "jeke"'
          }
        }
      }
    }
    stage('run container ') {
      parallel {
        stage('run container ') {
          steps {
            sh 'docker run --name korobka -tid -p 80:80 boodman/jeke:${BUILD_NUMBER}'
          }
        }
        stage('run container') {
          steps {
            sh 'docker rm -f korobka'
          }
        }
      }
    }
  }
  environment {
    Docker = 'yes'
    Custom = 'nginx '
  }
}