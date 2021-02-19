timestamps {

node () {

	stage ('terraform-jenkins - Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/DanyYanez/pipeline-terraform-jenkins']]]) 
	}
	stage ('terraform-jenkins - Build') {
 			// Shell build step
sh """ 
terraform init
terraform refresh
terraform apply -auto-approve
terraform destroy -auto-approve
 """ 
	}
}
}
