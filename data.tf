data "archive_file" "lambda_zip_inline" {
  type        = "zip"
  output_path = "/tmp/lambda_zip_inline.zip"
  source {
    content  = <<EOF
module.exports.handler = async (event, context, callback) => {
	const what = "world";
	const response = `Hello $${what}!`;
	callback(null, response);
};
EOF
    filename = "main.js"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

// Assume role policy document
data "aws_iam_policy_document" "sfn_assume_role_policy_document" {

  statement {
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "Service"
      identifiers = [
        "states.eu-west-1.amazonaws.com",
        "events.amazonaws.com"
      ]
    }
  }
}