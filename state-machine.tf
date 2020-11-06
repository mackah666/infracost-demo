resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = "proactive-quote-state-machine"
  role_arn = aws_iam_role.iam_for_sfn.arn

  definition = <<EOF
{
    "Comment": "Proactive Quote Service",
    "StartAt": "proactive-defaulter",
    "States": {
       "proactive-defaulter": {
        "Type": "Task",
        "Resource": "${aws_lambda_function.proactive-quote-defaulter.arn}",
        "Catch": [ {
              "ErrorEquals": ["States.TaskFailed"],
              "Next": "error-handler"
           } ],
        "Next": "proactive-quoter"
       },
       "proactive-quoter": {
        "Type": "Task",
        "Resource": "${aws_lambda_function.proactive-quote-quoter.arn}",
        "Catch": [ {
              "ErrorEquals": ["States.TaskFailed"],
              "Next": "error-handler"
           } ],
        "Next": "proactive-s3"
       },
       "proactive-s3": {
        "Type": "Task",
        "Resource": "${aws_lambda_function.proactive-s3.arn}",
        "Catch": [ {
              "ErrorEquals": ["States.TaskFailed"],
              "Next": "error-handler"
           } ],
        "End": true
      },
  
      "error-handler": {
           "Type": "Task",
           "Resource": "${aws_lambda_function.error-handler.arn}",
           "End": true
        }
    }
  }
  
EOF
}