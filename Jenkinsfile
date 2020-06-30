node('gce') {

  serviceName = "react-shows"
  projectId = "custom-resource-281709"

  cleanWs()
  git url: "https://github.com/galsasi1989/${serviceName}.git"

  docker.image("us.gcr.io/${projectId}/jenkins-slaves/jenkins-node:13.8").inside {
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
    def image = docker.build("us.gcr.io/${projectId}/${serviceName}:1.0.${BUILD_NUMBER}")
    image.push()
  }
  stage('upgrade service on k8s cluster') {
    dir("./chart/react-show") {
      sh """
         gcloud container clusters get-credentials k8s --zone us-west1-b
         helm upgrade --install react-show --set image.tag=1.0.${BUILD_NUMBER} .
         """
    }
  }
}
