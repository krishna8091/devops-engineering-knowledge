#!/bin/bash
# Creates a small practice Git repo called shop-infra-practice.
# All data is made up. Safe to run: it only creates one new folder here.
# Run it from the folder where you want the practice repo:  bash setup_repo.sh

set -e
if [ -e shop-infra-practice ]; then
  echo "The folder shop-infra-practice already exists. Delete it or go to another folder, then run again."
  exit 1
fi

mkdir shop-infra-practice
cd shop-infra-practice
git init -q
git checkout -q -b main 2>/dev/null || true
git config user.name "Practice Student"
git config user.email "student@example.com"

mkdir terraform k8s scripts

# Writes terraform/main.tf. Argument 1 = instance type, argument 2 = "ssh" to add an SSH rule
write_tf() {
cat > terraform/main.tf <<TF
resource "aws_security_group" "web" {
  name = "shopeasy-web"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami           = "ami-00000000"
  instance_type = "$1"
}
TF
if [ "$2" = "ssh" ]; then
cat >> terraform/main.tf <<'TF'

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web.id
}
TF
fi
}

# Writes k8s/deployment.yaml. Args: replicas, image tag, memory, "env" to add a password
write_k8s() {
cat > k8s/deployment.yaml <<YML
apiVersion: apps/v1
kind: Deployment
metadata:
  name: shop-api
spec:
  replicas: $1
  template:
    spec:
      containers:
        - name: shop-api
          image: shopeasy/shop-api:$2
YML
if [ "$4" = "env" ]; then
cat >> k8s/deployment.yaml <<'YML'
          env:
            - name: DB_PASSWORD
              value: "FAKE-changeme-123"
YML
fi
cat >> k8s/deployment.yaml <<YML
          resources:
            limits:
              memory: "$3"
YML
}

write_readme() {
cat > README.md <<MD
# shop-infra-practice
Made-up infrastructure files for a Git practice session$1.
MD
}

# ---- Commit 1: the first version
write_tf t3.small no
write_k8s 2 1.4.2 256Mi no
cat > scripts/backup.sh <<'SH'
#!/bin/bash
set -e
tar czf "/backups/shop-$(date +%F).tar.gz" /var/lib/shop
echo "backup done"
SH
write_readme ""
git add .
git commit -q -m "Add first version of shop infrastructure"

# ---- A teammate's branch: made from the first commit, changes the same line
git checkout -q -b feature/high-traffic
write_k8s 5 1.4.2 512Mi no
git commit -q -am "Scale shop-api to 5 replicas for the sale"

# ---- Back on main: someone else changed the same line differently
git checkout -q main
write_k8s 3 1.4.2 256Mi no
git commit -q -am "Set shop-api replicas to 3"

# ---- Your own uncommitted, messy work on main
write_tf t3.large ssh
write_k8s 3 latest 256Mi env
cat > scripts/backup.sh <<'SH'
#!/bin/bash
tar czf "/backups/shop-$(date +%F).tar.gz" /var/lib/shop
echo "backup done"
rm -rf /backups/$1
SH
write_readme " (draft)"

echo
echo "Done. Practice repo created in: $(pwd)"
echo "Next:"
echo "  cd shop-infra-practice"
echo "  git status"
echo "  git log --oneline --all"
echo "  git diff"
