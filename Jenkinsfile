node('gce') {

  cleanWs()
  git url: 'https://github.com/galsasi1989/react-shows.git'

  docker.image("us.gcr.io/custom-resource-281709/jenkins-slaves/jenkins-node:13.8.3").inside {
    stage('build') {
      sh """
         yarn install
         yarn build
         """
    }
    stage('tests') {
      env.CI = true
      sh "yarn test"
    }
  }
  stage('docker build and push') {
    sh "yes | gcloud auth configure-docker"
    def image = docker.build("us.gcr.io/custom-resource-281709/react-shows:1.0.${BUILD_NUMBER}")
    image.push()
  }
  stage('upgrade service on k8s cluster') {
    sh "Not implmeneted"
  }
}
