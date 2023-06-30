resource "aws_instance" "my_instance" {
  #count         = "${var.ec2_count}"
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${var.subnet_id}"

  tags = {
    Name = "My EC2 Instance"
  }
}

resource "aws_ebs_volume" "my_volume" {
    availability_zone = aws_instance.my_instance.availability_zone
    size = 10
    tags = {

        Name = "${var.project_name}-ebs"

    }    
}

resource "aws_volume_attachment" "ebsAttach" {
    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.my_volume.id
    instance_id = aws_instance.my_instance.id
}
