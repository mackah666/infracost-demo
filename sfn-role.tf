
resource "aws_iam_role" "iam_for_sfn" {
  name = "tf-${terraform.workspace}-iam_for_sfn"

  assume_role_policy = data.aws_iam_policy_document.sfn_assume_role_policy_document.json
}