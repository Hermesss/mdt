pipeline{
    
    agent any
    stages{
        stage('checkout'){
            steps{
                cleanWs()
                git branch: 'denys.lapenkov_terraform',
                url: 'https://github.com/Hermesss/mdt.git' 
            }
        }
        stage (' Infrastucture ') {
            
        tools {
            terraform 'terraform'
                }  
    
            steps {
            withCredentials([file(credentialsId: 'terraform.tfvars', variable: 'tfvars')]) {
                        sh "cp \$tfvars terraform.tfvars"
                        } 
            sh "terraform init"
            sh "terraform plan -input=false"
            sh "terraform apply -auto-approve"
            script {
         env.VM_IP = sh script: "terraform output -json ip | cut -c 2- | rev | cut -c 2- | rev", returnStdout: true

                    }       

                 }
            }
        stage("Inegration"){
            steps{
                sh ''' curl -I "${env.VM_IP}" '''
                 }
        }
        }
}