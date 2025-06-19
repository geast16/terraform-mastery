# Values in comments no longer valid, but they show the order of precendence from lowest to highest.
# TF_VAR instance type = "t3.micro"
# terraform.tfvars = "t3.small"
# prod.auto.tfvars = "t3.large"
# -var cli argument = "t3.xlarge"
# -var and -var-file cli arguments, latest with highest precedence = "t3.xlarge" and "t3.2xlarge" respectively

ec2_instance_type = "t2.micro"

ec2_volume_config = {
  size = 10
  type = "gp2"
}

additional_tags = {
  ValuesFrom = "terraform.tfvars"
}
