import {
  to = aws_iam_role.lambda_execution_role
  id = "manually-created-lambda-role-qiju0no2"
}

import {
  to = aws_iam_policy.lambda_execution
  id = "arn:aws:iam::051826693906:policy/service-role/AWSLambdaBasicExecutionRole-df23c811-61fe-4844-8e45-27f81e3c10db"
}

data "aws_iam_policy_document" "assume_lambda_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {

}

data "aws_iam_policy_document" "lambda_role_policy" {
  statement {
    effect = "Allow"

    resources = ["arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:*"]
    actions   = ["logs:CreateLogGroup"]
  }

  statement {
    effect = "Allow"

    resources = ["${aws_cloudwatch_log_group.lambda.arn}:*"]
    actions   = ["logs:CreateLogStream", "logs:PutLogEvents"]
  }
}

resource "aws_iam_policy" "lambda_execution" {
  name   = "AWSLambdaBasicExecutionRole-df23c811-61fe-4844-8e45-27f81e3c10db"
  path   = "/service-role/"
  policy = data.aws_iam_policy_document.lambda_role_policy.json
}

resource "aws_iam_role" "lambda_execution_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_lambda_role_policy.json
  name               = "manually-created-lambda-role-qiju0no2"
  path               = "/service-role/"
}
