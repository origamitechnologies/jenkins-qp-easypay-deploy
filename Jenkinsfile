
pipeline {
    agent any

    triggers {
        githubPush()
    }

    environment {
        DEPLOY_HOST = "3.111.88.31"
        DEPLOY_USER = "deployuser"
    }

    stages {

        stage('Deploy Sandbox') {
            steps {
                sshagent(credentials: ['qp-easypay-deploy-ssh']) {
                    sh '''
                    ssh -o StrictHostKeyChecking=no $DEPLOY_USER@$DEPLOY_HOST \
                    "cd ~/qp-easypay-deploy && ./deploy/sandbox.sh"
                    '''
                }
            }
        }

        stage('Deploy KSRTC') {
            steps {
                sshagent(credentials: ['qp-easypay-deploy-ssh']) {
                    sh '''
                    ssh -o StrictHostKeyChecking=no $DEPLOY_USER@$DEPLOY_HOST \
                    "cd ~/qp-easypay-deploy && ./deploy/ksrtc.sh"
                    '''
                }
            }
        }

        stage('Deploy TicketBuddy') {
            steps {
                sshagent(credentials: ['qp-easypay-deploy-ssh']) {
                    sh '''
                    ssh -o StrictHostKeyChecking=no $DEPLOY_USER@$DEPLOY_HOST \
                    "cd ~/qp-easypay-deploy && ./deploy/ticketbuddy.sh"
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deployment completed successfully"
        }
        failure {
            echo "❌ Deployment failed"
        }
    }
}
