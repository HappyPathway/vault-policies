data "aws_instances" "consul" {
  instance_state_names = ["running"]

  filter {
    name   = "tag:Owner"
    values = ["${var.cluster_owner}"]
  }

  filter {
    name   = "tag:Role"
    values = ["consul"]
  }
}
