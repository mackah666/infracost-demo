resource "aws_lambda_function" "proactive-quote-defaulter" {
  function_name    = "proactive-quote-defaulter"
  filename         = data.archive_file.lambda_zip_inline.output_path
  source_code_hash = data.archive_file.lambda_zip_inline.output_base64sha256
  runtime          = "nodejs10.x"
  handler          = "main.handler"
  role             = aws_iam_role.iam_for_lambda.arn
  memory_size      = 128
  timeout          = 120

}
data "infracost_aws_lambda_function" "lambda" {
  resources = [aws_lambda_function.proactive-quote-defaulter.id]

  monthly_requests {
    value = 1000000
  }

  average_request_duration {
    value = 120
  }
}