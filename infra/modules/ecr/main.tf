resource "aws_ecr_repository" "repo" {
name = "${var.name}-app"
image_scanning_configuration { scan_on_push = true }
force_delete = true
}


output "repository_url" { value = aws_ecr_repository.repo.repository_url }
