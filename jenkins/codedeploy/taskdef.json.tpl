{
 "family": "flask-app-task",
 "executionRoleArn": "${execution_role_arn}",
 "networkMode": "awsvpc",
 "containerDefinitions": [
 {
 "name": "flask-app",
 "image": "${image_url}",
 "memory": 512,
 "cpu": 256,
 "essential": true,
 "portMappings": [
 {
 "containerPort": 5000,
 "hostPort": 5000
 }
 ]
 }
 ],
 "requiresCompatibilities": ["FARGATE"],
 "cpu": "256",
 "memory": "512"
}
