timestamps {

node () {

	stage ('terraform-jenkins - Checkout') {
 	 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/DanyYanez/pipeline-terraform-jenkins']]]) 
	}
	stage ('terraform-jenkins - Build') {
 			// Shell build step
sh """

echo "hello"
#kubectl exec --stdin --tty flaskapp-76889cc8b7-4mm4g -- /bin/bash
#python3 web.py
# cd in the cloned repo and pulling changes

#cd ~/documents/github/pipeline-terraform-jenkins/
#git pull https://github.com/DanyYanez/pipeline-terraform-jenkins

# Starting terraform

#terraform init
#terraform refresh
#terraform apply -auto-approve

 """ 
	}
}
}
