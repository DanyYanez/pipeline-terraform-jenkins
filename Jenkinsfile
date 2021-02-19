timestamps {

node () {

	stage ('terraform-jenkins - Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/DanyYanez/sba.jenkins-github-pipeline']]]) 
	}
	stage ('terraform-jenkins - Build') {
 			// Shell build step
sh """ 
terraform init
terraform refresh
terraform apply -auto-approve 
 """ 
	}
}
}
