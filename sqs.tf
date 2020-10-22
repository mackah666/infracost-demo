resource "aws_sqs_queue" "standard" {
  name       = "standard_queue"
  fifo_queue = false
}

# Use the infracost provider to get cost estimates for SQS requests.
data "infracost_aws_sqs_queue" "queue" {
  resources = [aws_sqs_queue.standard.id]

  monthly_requests {
    value = 10000000
  }

  request_size {
    value = 64
  }
}