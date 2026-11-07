k8s-practice: practice Kubernetes problems (all data is made up)

You do NOT need a cluster for this practice. The files are saved copies of what
kubectl prints, plus the manifests that caused each problem.

WHAT IS IN THIS FOLDER
  manifests/risky-deployment.yaml   a deployment with several risky settings (Step 2)
  case1_crashloop/                  a pod that keeps crashing
  case2_pending/                    a pod that never starts
  case3_imagepull/                  a pod that cannot get its image
  Each case has: deployment.yaml, get_pods.txt, describe.txt (case 1 also logs.txt)

HOW TO USE
  Ask Claude Code to read the files in one case folder and diagnose the problem.
  Then ask it for a fixed deployment.yaml. Read the fix before you use it.

IF YOU HAVE A CLUSTER (optional: Docker Desktop Kubernetes, minikube, kind)
  kubectl apply -f case1_crashloop/deployment.yaml
  kubectl get pods
  Use a throwaway cluster only. Never practise on a real company cluster.

RULES
  1. Nothing here is real. Never paste real secrets or company logs into Claude.
  2. The saved outputs are modelled on real kubectl output. Names and times are made up.
