module "data_warehousing" {
  source = "../modules/data_warehousing"
  name   = "demo"

  # put your secret manager arn ids here
  master_username_secret_manager_arn = "arn:aws:secretsmanager:us-east-2:612455316784:secret:demo/redshift/masteraccount-f6QYnO"
  master_password_secret_manager_arn = "arn:aws:secretsmanager:us-east-2:612455316784:secret:demo/redshift/masterpassword-FmvYuc"
}
