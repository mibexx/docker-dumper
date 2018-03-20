#!/usr/bin/env bash

if [ ! -f ~/.aws/credentials ]; then
    if [[ -z "${AWS_ACCESS_KEY_ID}" ]]; then
        ACCESS_ID=${AWS_ACCESS_KEY_ID}
        ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
    else
        ACCESS_ID=""
        ACCESS_KEY=""
    fi

    if [[ "$ACCESS_ID" != "" ]]; then
        mkdir -p ~/.aws
        touch credentials
        echo "[default]" > ~/.aws/credentials
        echo "aws_access_key_id=$AWS_ACCESS_KEY_ID" >> ~/.aws/credentials
        echo "aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >> ~/.aws/credentials
    fi
fi

/usr/local/bin/$@