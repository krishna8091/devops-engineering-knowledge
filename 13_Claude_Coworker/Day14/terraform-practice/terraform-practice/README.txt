terraform-practice: practice Terraform with Claude (all data is made up)

You do NOT need Terraform, AWS or any account for this practice.
The files are saved copies of what "terraform plan" prints, plus the code.

WHAT IS IN THIS FOLDER
  monolith/main.tf     one big, repetitive file (Step 4: refactor into modules)
  plan_case/plan.txt   a saved plan with risky changes (Step 2: review)
  drift_case/          main.tf and plan.txt: changes made outside Terraform (Step 3)

HOW TO USE
  Ask Claude Code to read the files and answer. Read its answer, then check the
  evidence line in the file yourself before you trust it.

RULES
  1. Never paste AWS keys, secrets or a real terraform.tfstate file into Claude.
  2. Never run terraform apply or destroy on a real account while practising.
  3. The saved plans are written to look like real Terraform output. Names, IDs and
     the account number are made up.
