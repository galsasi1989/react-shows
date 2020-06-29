node {

  cleanWs()
  git url: 'https://github.com/galsasi1989/react-shows.git'

  docker.image("us.gcr.io/custom-resource-281709/jenkins-slave-node:13.8.2-alpine").withRun("-v /var/run/docker.sock:/var/run/docker.sock").inside {
    stage('build') {
      sh """
         yarn install
         yarn build
         """
    }
    stage('tests') {
      sh "yarn test"
    }
    stage('docker build and push') {
      def image = docker.build("us.gcr.io/custom-resource-281709/react-shows:1.0.${BUILD_NUMBER}")
      image.push()
    }
  }
  stage('upgrade service on k8s cluster') {
    sh "Not implmeneted"
  }
}
