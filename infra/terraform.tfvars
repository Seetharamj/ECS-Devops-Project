vpc_id            = "vpc-09aada87941ea18aa"
public_subnet_ids = ["subnet-02016a31039f34970", "subnet-056e145a3c29a35ab"]

execution_role_arn = "arn:aws:iam::433349222941:role/ecsExecutionRole"

app_image    = "433349222941.dkr.ecr.ap-south-1.amazonaws.com/flask-app:26"
listener_arn = "arn:aws:elasticloadbalancing:ap-south-1:433349222941:listener/app/my-alb/50dc6c495c0c9188/6f3e1b4a6d3f1f0d"

codedeploy_role_arn = "arn:aws:iam::433349222941:role/CodeDeployECSRole"
