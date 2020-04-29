output "vpc_id" {
    value = "${aws_vpc.customvpc.id}"
}

output "public_instance_ip" {
    value = "${aws_instance.web1.public_ip}"
}

output "private_instance_ip" {
    value = "${aws_instance.db1.private_ip}"    
}
