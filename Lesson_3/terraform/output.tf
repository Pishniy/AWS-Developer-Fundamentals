output "My_web_server_expernal_ip" {
  value = aws_instance.my_web_server.public_ip
}