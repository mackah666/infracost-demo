resource "aws_dynamodb_table" "someTable666" {
  name             = "someTable"
  read_capacity    = 20
  write_capacity   = 20
  hash_key         = "id"
  range_key        = "version"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

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
  resources = [aws_dynamodb_table.someTable666.id]

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