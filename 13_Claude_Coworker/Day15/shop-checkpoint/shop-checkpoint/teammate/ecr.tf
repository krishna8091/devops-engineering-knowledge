# A teammate's Terraform for the image registry (all names are made up)
resource "aws_ecr_repository" "shop" {
  name                 = "shop-status"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository_policy" "shop" {
  repository = aws_ecr_repository.shop.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "AllowPull"
      Effect    = "Allow"
      Principal = "*"
      Action    = ["ecr:GetDownloadUrlForLayer", "ecr:BatchGetImage", "ecr:PutImage"]
    }]
  })
}
