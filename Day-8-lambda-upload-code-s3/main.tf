resource "aws_s3_bucket" "name" {
    bucket = "qwertyuioplkjhgfda"
  
}

resource "aws_s3_bucket_versioning" "enableversion" {
    bucket = aws_s3_bucket.name.id
    versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "lambdas3" {
  bucket = aws_s3_bucket.name.id
  key    = "files/test_function.zip"
  source = "test_function.zip"
  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("test_function.zip")
}



resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lambda_functionnew"
  role          =  aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  timeout       = 900
  memory_size   = 128

  s3_bucket = aws_s3_bucket.name.id
  s3_key    = aws_s3_object.lambdas3.key

  depends_on = [
    aws_iam_role_policy_attachment.lambda_policy
  ]

  #Without source_code_hash, Terraform might not detect when the code in the ZIP file has changed — meaning your Lambda might not update even after uploading a new ZIP.

#This hash is a checksum that triggers a deployment.
}