resource "aws_dynamodb_table" "proactive-quote-dev-templates" {
  name             = "proactive-quote-dev-templates"
  read_capacity    = 10
  write_capacity   = 10
  hash_key         = "id"
  range_key        = "version"
  billing_mode     = "PAY_PER_REQUEST"
  # stream_enabled   = true
  # stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "version"
    type = "N"
  }
}

data "infracost_aws_dynamodb_table" "dynamodb" {
  resources = [aws_dynamodb_table.proactive-quote-dev-templates.id]

  monthly_write_request_units {
    value = 10000
  }
  monthly_read_request_units {
    value = 1000000
  }
  monthly_gb_data_storage {
    value = 5
  }
}