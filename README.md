# AWS Command Line Interface GitHub Action

## References

* https://github.com/jakejarvis/s3-sync-action
* https://github.com/keithweaver/aws-s3-github-action

## Creating new releases

```
git add -A;
git commit -m "<commit msg>"
git tag -a -m "<tag msg>" v1.3
git push --follow-tags
```

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
      uses: sahil87/aws-cli-action@v1.3
      #OR sahil87/aws-cli-action@main
      with:
        args: >
          s3 cp \
          --recursive \
          ${{ env.cp_source }} ${{ env.cp_destination }}
