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

jobs:
  aws_cli_:
    runs-on: ubuntu-latest
    
    steps:
    - name: Checkout Repository
      uses: actions/checkout@v4

    - name: AWS CLI Command
      uses: sahil87/aws-cli-action@v1.1
      with:
        args: s3 cp ${{ env.cp_source }} ${{ env.cp_destination }}
