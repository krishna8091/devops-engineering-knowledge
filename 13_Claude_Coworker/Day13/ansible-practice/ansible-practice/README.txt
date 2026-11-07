ansible-practice: practice Ansible with Claude (all data is made up)

WHAT IS IN THIS FOLDER
  bad-playbook.yml     a deliberately bad playbook (Step 1)
  inventory.ini        the list of servers: here just "localhost" (the practice machine itself)
  ansible.cfg          tells Ansible to use inventory.ini
  case1_typo/          a failed run: playbook.yml and error.txt (the saved real error)
  case2_undefined/     a failed run
  case3_yaml/          a failed run

WHERE TO RUN IT (Ansible needs Linux; it does not run on plain Windows)
  Use a throwaway Ubuntu container. Docker Desktop is enough (you used it on Day 11).
  In this folder, run:
    docker run -it --rm -v "$PWD":/work -w /work ubuntu:24.04 bash
  Inside the container:
    apt-get update && apt-get install -y ansible
    ansible --version
  Nothing on your laptop is changed. Type exit to leave, and the container is deleted.
  Windows PowerShell: use ${PWD} instead of $PWD.

THE FAILED-RUN CASES NEED NO ANSIBLE
  Just ask Claude to read the case folder.

RULES
  1. Run playbooks only in the practice container. Never against a real company server.
  2. Everything here is made up. Never paste real passwords or server details into Claude.
