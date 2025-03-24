Scalable and Automated Deployment of a Web Application (Supper Mario)  on Amazon EKS

    • Project Overview
This project showcases the deployment of a containerized web application( supper mario game) on Amazon EKS (Elastic Kubernetes Service) using best practices in networking, security, and automation. With just a few clicks, developers can deploy a new version of the application to a scalable and secure Kubernetes cluster.

    • Key Technologies Used:

Infrastructure as Code (IaC): Terraform (using the EKS module) for provisioning infrastructure.

Kubernetes: Amazon EKS for container orchestration.

Networking & Security: Private EKS cluster, bastion host, IAM roles, and Github action variables  secrets .  

Ingress & Traffic Routing: NGINX Ingress Controller for handling HTTP requests.

CI/CD Automation: GitHub Actions for infrastructure and application deployment.

    • Infrastructure Provisioning
The project follows best practices in networking and security to create a highly available and secure Kubernetes environment:

EKS Module Usage: The infrastructure was deployed using the Terraform EKS module (from terraform registry) for efficiency and best practices.

Private EKS Cluster: The cluster endpoint is private for enhanced security.

VPC Architecture: A custom VPC with public and private subnets in different AZs for controlled access and availability. 

Bastion Host: Used to communicate with the private EKS cluster securely.

Security Groups & IAM Roles: Least privilege IAM roles for EKS, worker nodes, and CI/CD pipelines.


    • Deployment Strategy
NGINX Ingress Controller manages HTTP traffic to the application.

Dynamic hostname injection ensures flexibility without hardcoding ELB endpoints.

Ingress is updated dynamically based on the assigned ELB endpoint.

CI/CD Automation
A GitHub Actions pipeline is implemented to enable push-button deployment:

Infrastructure Provisioning: Terraform (EKS module) automates cluster creation.

    • Application Deployment: 
Once EKS is provisioned, and the deployment workflow triggered manually, the pipeline pulls the latest Docker image and deploys it. 
It also deploys the services which exposes the application pod internally using cluster Ip 
NGINX Ingress Controller manages which managers incoming traffic using ELB
Once the EBL is created and endpoint assigned,  the endpoint is dynamically updated on the ingress.yaml file before it is applied.   The Ingress manifest when applied maps external traffic to the Service inside the cluster.

Lessons Learned & Future Improvements
This project demonstrates an efficient and scalable way to deploy containerized applications in AWS. However, future improvements could include:(watchout) as 

ArgoCD for GitOps-based deployments.
Automated Cost Optimization monitoring.
Monitoring using Grafana and prometons  

Conclusion
This project exemplifies a scalable, secure, and automated Kubernetes deployment on AWS. With just a few clicks, teams can deploy a new version, This is an ideal solution for enterprises looking to modernize application deployment with Kubernetes and AWS.

# eks-terraform-mario-deployment
Step 1: Create your infrastructure codes with Terraform (Eks modules used is in this case)  and your .yaml manifest files for the app deployment, service and ingress, then push into your github accounts. Note the terraform code used here created about aws 45 resources  
![alt text](image-1.png)

STEP 2: Login to your github account and open the remote repo where just pushed the code in step 1, click on action to create the .gitHub uworkflow for  1. provision -infra.yaml, 2. marip-deployment.yaml and 3. desttroy.yaml for cleanup
   ![alt text](image-2.png)

STEP 3: Copy and paste the automation codes which includes the steps for execution, ensure u set you creditentals and varibales by clicking on actions, settings the by left side of ur screen click on secrets and varibles. 
    ![alt text](image-3.png)

  SEPT 4: Commit any changes to the remote repo to trigger the provisioning of the infrastructure 
  
  Note you  credential should set as repo varibales under secrets, also set your region here. 
All varibles should be set, enviromental sorted out and set. ....
