pipeline {
  agent any
  stages {
    stage('check') {
      steps {
      	sh "chmod +x -R ${env.WORKSPACE}"
        sh './build.sh'
        //sh './scripts/test.sh'
        echo "Check Stage of branch ${env.BRANCH_NAME} running..."
      }
    }

    stage('release') {
    environment {
    	RELEASE_VERSION = 'none'
    	ENVIRONMENT_TAG = getEnvName(env.BRANCH_NAME)
    	DOCKERHUB_CREDENTIALS = credentials('DockerHub_account')
    }
      when {
        expression {
          env.BRANCH_NAME == 'develop' || env.BRANCH_NAME == 'master'
        }
      }
      // steps pro develop branch
      steps {
	echo "ENV_tag value :  ${ENVIRONMENT_TAG}"
	sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
	sh "./release.sh ${ENVIRONMENT_TAG} ${env.BUILD_NUMBER}"
      }
    }
  }
}

def getEnvName(branchName) {
    if("master".equals(branchName)) {
        return "production";
    } else if("develop".equals(branchName)) {
        return "latest";
    }
}
