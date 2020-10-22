resource "aws_lambda_function" "lambda_256_350" {
  function_name    = "lambda_256_350"
  filename         = data.archive_file.lambda_zip_inline.output_path
  source_code_hash = data.archive_file.lambda_zip_inline.output_base64sha256
  runtime          = "nodejs10.x"
  handler          = "main.handler"
  role             = aws_iam_role.iam_for_lambda.arn
  memory_size      = 256

}
data "infracost_aws_lambda_function" "lambda1" {
  resources = [aws_lambda_function.lambda_256_350.id]

  monthly_requests {
    value = 1000000
  }

  average_request_duration {
    value = 350
  }
}