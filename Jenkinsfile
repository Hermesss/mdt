pipeline{
    
    agent any
    stages{
        stage('checkout'){
            steps{
                //cleanWs()
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
                        sh " rm terraform.tfvars -f && cp \$tfvars terraform.tfvars"
                        } 
            sh "terraform init"
            sh "terraform plan -input=false -out plan"
            sh "terraform apply -auto-approve"
            stash includes: 'terraform.tfstate, .terraform/**', name: 'tf'

            /*script {
                   def VM_IP = sh script: "#!/bin/bash \
                   /var/jenkins_home/tools/org.jenkinsci.plugins.terraform.TerraformInstallation/terraform/terraform output -state=/var/jenkins_home/workspace/Integration/terraform.tfstate -json ip | cut -c 3- | rev | cut -c 3- | rev", returnStdout: true
                   env.VM_IP = VM_IP
                   }       
             sh " echo ${env.VM_IP} " */       

                 }
            }
        stage("Inegration"){
            /*steps{
                sh ''' curl -s -o /dev/null -w "%{http_code}" 10.0.0.7 '''
                 } */
                steps {
                script {
                        httpRequest acceptType: 'TEXT_HTML', contentType: 'TEXT_HTML', responseHandle: 'NONE', url: 'http://10.0.0.7', validResponseCodes: '200', validResponseContent: 'Material UI One Page Theme', wrapAsMultipart: false            }
                        }
                    }
        stage("CleanUP"){
            tools {
            terraform 'terraform'
                } 
            steps{
                unstash 'tf'
                sh "terraform destroy -auto-approve"
            }
            
            }
        }
    }