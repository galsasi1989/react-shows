node {

  cleanWs()
  git url: 'https://github.com/galsasi1989/react-shows.git'

  docker.image('us.gcr.io/custom-resource-281709/jenkins-slave-node:13.8.0-alpine').withRun("-v /var/run/docker.sock:/var/run/docker.sock").inside {
    stage('build') {
      dir("${WORKSPACE}/react-shows") {
        sh """
           yarn install
           yarn build
           """
      }
    }
    stage('tests') {
      dir("${WORKSPACE}/react-shows") {
        sh "yarn test"
      }
    }
    stage('docker-build') {
 
    }
    stage('docker-push') {

    }
    stage('upgrade service on k8s cluster') {

    }
  }
    



}
