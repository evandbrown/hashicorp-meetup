node('docker') {
  checkout scm

  stage 'Initialize Terraform'
  sh  'gcloud docker -a'
  sh 'terraform remote config -backend=etcd -backend-config="path=app1/prod/terraform.tfstate" -backend-config="endpoints=http://etcd0:2379"'
  
  stage 'terraform plan'
  sh 'echo 0 > .tfexit'
  sh 'terraform plan -detailed-exitcode || echo $? > .tfexit'

  if(changes()) {
    stage 'terraform apply'
    input message: "Terraform changes detected.", ok: "Approve changes." 
    sh 'terraform apply'
  }
}

def changes() {
  def matcher = readFile('.tfexit') =~ '^2$'
  matcher ? matcher[0] : null
}
