pipeline {
    agent any
    environment {
        AWS_REGION = "us-east-1"
        ECR_REPO   = "433349222941.dkr.ecr.us-east-1.amazonaws.com/flask-app"
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Seetharamj/ECS-Devops-Project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $ECR_REPO:$BUILD_NUMBER .'
            }
        }

        stage('Push to ECR') {
            steps {
               
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-creds']]) {
                    sh '''
                        aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPO
                        docker push $ECR_REPO:$BUILD_NUMBER
                    '''
                }
            }
        }

        stage('Terraform Deploy') {
            steps {
               
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-creds']]) {
                    sh '''
                        cd infra
                        terraform init
                        terraform apply -auto-approve -var="app_image=$ECR_REPO:$BUILD_NUMBER"
                    '''
                }
            }
        }

        stage('CodeDeploy ECS Blue-Green') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-creds']]) {
                    sh '''
                        aws deploy create-deployment \
                          --application-name flask-app-codedeploy \
                          --deployment-group-name flask-app-deploy-group \
                          --revision revisionType=AppSpecContent,appSpecContent={content="file://jenkins/codedeploy/appspec.yaml"}
                    '''
                }
            }
        }
    }
}
