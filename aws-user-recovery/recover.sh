#!/bin/bash

aws iam create-user --user-name admin2
aws iam create-login-profile --user-name admin2 --password Admin2018! --no-password-reset-required
aws iam list-groups
aws iam add-user-to-group --group-name Admins --user-name admin2