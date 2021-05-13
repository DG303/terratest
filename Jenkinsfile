// pipeline relies on arn:aws:iam::255462327229:role/non_prod_jenkins2_master_ec2_ecs_role
@Library('jenkins-shared-library@1.0.0') _

pipeline {
  agent {
    label 'jenkins2-ec2-slave'
  }

  options {
    disableConcurrentBuilds()
  }

  environment {
    AWS_DEFAULT_REGION = 'us-east-1'
  }

  stages {
    stage('Inspec Test') {
      when {
       branch 'PR-*'
      }
      steps {
        script {
          tmInspecTest()
        }
      }
    }
  }

  post {
    always {
      script {
        tmInspecTestDestroy()
      }
      slackNotifier()
      cleanWs()
    }
  }
}
