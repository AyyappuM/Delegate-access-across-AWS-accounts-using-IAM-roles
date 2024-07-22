# Delegate-access-across-AWS-accounts-using-IAM-roles
This repo is for [this](https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html) tutorial.

* Add the following in the `~/.aws/credentials` file:
```
[a1]
region=...
AWS_ACCESS_KEY_ID="..."
AWS_SECRET_ACCESS_KEY="..."
AWS_SESSION_TOKEN="..."

[a2]
region=...
AWS_ACCESS_KEY_ID="..."
AWS_SECRET_ACCESS_KEY="..."
AWS_SESSION_TOKEN="..."
```

* Navigate to `../terraform/originating-account` direcotry and run `terraform init`

* Run the following command from the directory `../terraform/originating-account` to deploy resources in the originating account:

```
terraform apply \
-var="originating_account_number=<ORIGINATING-ACCOUNT-NUMBER>" \
-var="destination_account_number=<DESTINATION-ACCOUNT-NUMBER>" \
-var="role_name_in_destination_account=UpdateData" \
--auto-approve
```

* Run the following command from the directory `../terraform/originating-account` to destory resources from the originating account:

```
terraform destroy \
-var="originating_account_number=<ORIGINATING-ACCOUNT-NUMBER>" \
-var="destination_account_number=<DESTINATION-ACCOUNT-NUMBER>" \
-var="role_name_in_destination_account=UpdateData" \
--auto-approve
```

* Navigate to `../terraform/destination-account` direcotry and run `terraform init`

* Run the following command from the directory `../terraform/destination-account` to deploy resources in the destination account:

```
terraform apply \
-var="originating_account_number=<ORIGINATING-ACCOUNT-NUMBER>" \
-var="destination_account_number=<DESTINATION-ACCOUNT-NUMBER>" \
-var="role_name_in_destination_account=UpdateData" \
--auto-approve
```

* Run the following command from the directory `../terraform/destination-account` to destory resources from the destination account:

```
terraform destroy \
-var="originating_account_number=<ORIGINATING-ACCOUNT-NUMBER>" \
-var="destination_account_number=<DESTINATION-ACCOUNT-NUMBER>" \
-var="role_name_in_destination_account=UpdateData" \
--auto-approve
```

* Switch role through the navigation bar on top-right

![image](https://github.com/user-attachments/assets/150287e5-c5c9-41d3-88ad-e3e657bcb638)

* It will look like this. Now, you have switched your profile

![image](https://github.com/user-attachments/assets/c4b2f81f-3ff2-4683-9aff-ebd382117259)

* You will be able to view the destination account's S3 bucket from originating account without logging-off from the originating account. Based on the permissions you have, you will be able to update/delete the resources (S3 bucket in this case):

![image](https://github.com/user-attachments/assets/a41760a2-0f8c-4383-bd6c-2ccc601c06ef)
