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
        stage (' Azure VM provision with TF ') {
            
        tools {
            terraform 'terraform'
                }  
    
            steps {
            withCredentials([file(credentialsId: 'terraform.tfvars', variable: 'tfvars')]) {
                        sh "cp \$tfvars terraform.tfvars"
                        } 
            sh  "terraform init"
            sh "terraform plan -input=false"
            sh "terraform apply -auto-approve"
                   

                 }
            }
