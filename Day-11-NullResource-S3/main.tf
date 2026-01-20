resource "aws_s3_bucket" "name" {
    bucket = "qwertyuioplkjmnb"
  
}

resource "null_resource" "upload" {
    depends_on = [ aws_s3_bucket.name ]

    provisioner "local-exec" {
        command = "aws s3 cp file.txt s3://${aws_s3_bucket.name.bucket}/file.txt"
      
    }

    triggers = {
    always_run = "${timestamp()}" # Forces rerun every time
  } 
  
}