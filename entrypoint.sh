function get_configuration_settings {
  if [ -z "$INPUT_AWS_ACCESS_KEY_ID" ]
  then
    echo "AWS Access Key Id was not found. Using configuration from previous step."
  else
    aws configure set aws_access_key_id "$INPUT_AWS_ACCESS_KEY_ID"
  fi

  if [ -z "$INPUT_AWS_SECRET_ACCESS_KEY" ]
  then
    echo "AWS Secret Access Key was not found. Using configuration from previous step."
  else
    aws configure set aws_secret_access_key "$INPUT_AWS_SECRET_ACCESS_KEY"
  fi

  if [ -z "$INPUT_AWS_REGION" ]
  then
    echo "AWS region not found. Using configuration from previous step."
  else
    aws configure set region "$INPUT_AWS_REGION"
  fi
}

function main {
  echo "v1.1"
  get_configuration_settings
  aws --version

  echo "aws $*"
  sh -c "aws $*"

#   echo 
#   if [ "$COMMAND" == "cp" ] || [ "$COMMAND" == "mv" ] || [ "$COMMAND" == "sync" ]
#   then
#     echo aws s3 $COMMAND "$INPUT_SOURCE" "$INPUT_DESTINATION" $INPUT_FLAGS
#     aws s3 "$COMMAND" "$INPUT_SOURCE" "$INPUT_DESTINATION" $INPUT_FLAGS
#   else
#     echo aws s3 $COMMAND "$INPUT_SOURCE" $INPUT_FLAGS
#     aws s3 "$COMMAND" "$INPUT_SOURCE" $INPUT_FLAGS
#   fi
}

main
