resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = "proactive-quote-state-machine"
  role_arn = aws_iam_role.iam_for_sfn.arn

  definition = <<EOF
{
  "Comment": "A Hello World example of the Amazon States Language using an AWS Lambda Function",
  "StartAt": "MI Report Service Step",
  "States": {
    "MI Report Service Step": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.lambda_128_120.arn}",
      "Next": "Enrichment Service Step",
      "Catch": [ {
        "ErrorEquals": [ "States.ALL" ],
        "ResultPath": "$.error",
        "Next": "Send Step"
      } ]
    },
    "Enrichment Service Step": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.lambda_256_350.arn}",
      "Next": "Defaulter Service Step",
      "Catch": [ {
        "ErrorEquals": [ "States.ALL" ],
        "ResultPath": "$.error",
        "Next": "Send Step"
      } ]
    },
    "Defaulter Service Step": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.lambda_256_350.arn}",
      "Next": "Quotes Service Step",
      "Catch": [ {
        "ErrorEquals": [ "States.ALL" ],
        "ResultPath": "$.error",
        "Next": "Send Step"
      } ]
    },
    "Quotes Service Step": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.lambda_256_350.arn}",
      "Next": "Send Step",
      "Catch": [ {
        "ErrorEquals": [ "States.ALL" ],
        "ResultPath": "$.error",
        "Next": "Send Step"
      } ]
    },
     "Send Step": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.lambda_256_350.arn}",
      "End": true
    }
  }
}
EOF
}