# AWS Command Line Interface GitHub Action

## Description

This GitHub Action uses the latest version of the AWS CLI in a Docker container to provide an environment to execute AWS CLI commands. It's designed to enable seamless interaction with AWS services, making it easier to manage AWS resources, deploy applications, and automate workflows directly from your GitHub workflows.

## Usage

You can use this action in your GitHub workflows by including it as a step in your workflow file. Below is an example of how to use this action to run a simple AWS CLI command:

```yaml
name: Example S3 Copy Command
run-name: example-s3-copy-command

on:
  pull_request:
    branches: [ main ]

  push:
    branches: [ main ]

permissions:
  contents: read # This is required for actions/checkout
  id-token: write # This is required for aws-actions/configure-aws-credentials

env:
  # Configure AWS Credentials
  aws_iam_role: <your-iam-role>
  role_session_name: <your-role-session-name>
  aws_region: <your-aws-region>
  
  #AWS CLI Command
  cp_source: <your-source>
  cp_destination: <your-destination>

jobs:
  aws_cli_:
    runs-on: ubuntu-latest
    
    steps:
    - name: Checkout Repository
      uses: actions/checkout@v2
    
    - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          role-to-assume: ${{ env.aws_iam_role }}
          role-session-name: ${{ env.role_session_name }}
          aws-region: ${{ env.aws_region }}

    - name: AWS CLI Command
      uses: sahil87/aws-cli-commands@v1
      with:
        args: s3 cp ${{ env.cp_source }} ${{ env.cp_destination }} 
