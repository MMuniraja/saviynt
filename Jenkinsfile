node {  
	def ImageName=""
	def Pod=""
	def Container=""
	def Service=""
	def Namespace=""
	def Ingress=""
	    stage('Git Checkout'){
	        git 'https://github.com/MMuniraja/saviynt.git'
	    }
	    stage('Ansible Playbook'){
	        
	        sh 'CommonTemplate.yml'
	    }
	    stage('Deployment to k8s'){ 
		environment {
    registry = "docker_hub_account/repository_name"
    registryCredential = 'dockerhub'
			}
		steps { 
		kubernetesDeploy(kubeconfigId: 'kubeconfig-credentials-id',

                 configs: '<ant-glob-pattern-for-resource-config-paths>',
                 enableConfigSubstitution: false,
        
                 secretNamespace: '<secret-namespace>',
                 secretName: '<secret-name>',
                 dockerCredentials: [
                        [credentialsId: '<credentials-id-for-docker-hub>'],
                        [credentialsId: '<credentials-id-for-other-private-registry>', url: '<registry-url>'],
                 ]
)
		sh "ansible-playbook common.yml --extra-vars ImageName=${ImageName} --extra-vars imageTag=${imageTag} --extra-vars Namespace=${Namespace} \
		 --extra-vars=${Pod} --extra-vars Deployment=${Deployment} --extra-vars Service=${Service} --extra-vars Ingress=${Ingress}"
		}

	    }
	    stage('Get Pod Details'){
		
		sh 'Pods_Details.sh'
	      
	    }
	    
	}
