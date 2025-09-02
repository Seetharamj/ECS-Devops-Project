vpc_id = "vpc-0123456789abcdef0"
public_subnet_ids = ["subnet-0123456789abcdef0", "subnet-0abcdef1234567890"]
sg_id = "sg-0123456789abcdef0"
app_image = "433349222941.dkr.ecr.us-east-1.amazonaws.com/flask-app:26"
ecr_repo_url = "433349222941.dkr.ecr.us-east-1.amazonaws.com/flask-app"
listener_arn = "arn:aws:elasticloadbalancing:ap-south-1:123456789012:listener/app/my-alb/50dc6c495c0c9188/6f3e1b4a6d3f1f0d"
codedeploy_role_arn = "arn:aws:iam::123456789012:role/CodeDeployECSRole"
