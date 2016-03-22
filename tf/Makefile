# Sync Terraform remote state
state:
	rm -f .terraform/*.tfstate && terraform remote config -backend=consul -backend-config="address=consul0:8500" -backend-config="path=tf"

show: state
	terraform show

destroy: state
	terraform destroy
