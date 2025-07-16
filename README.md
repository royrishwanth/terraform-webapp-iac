# Terraform AWS Modular Infrastructure: ALB + EC2 Setup

Welcome to a production-grade, fully modular Terraform configuration that provisions a basic AWS infrastructure. This project creates:

* ✅ A custom VPC with public and private subnets
* ✅ Internet Gateway and NAT Gateway for routing and connectivity
* ✅ Two EC2 instances in private subnets
* ✅ A public-facing Application Load Balancer (ALB)
* ✅ Security groups and key pairs
* ✅ Parameterized and modularized components for scalability and reuse

---

## 📁 Project Structure

```bash
.
├── main.tf                  # Root module: orchestrates all child modules
├── vars.tf                 # Variables used in the root module
├── terraform.tfvars        # Your actual values for variables
├── outputs.tf              # Root module outputs
├── userdata.sh             # User data for EC2 instance 1
├── userdata2.sh            # User data for EC2 instance 2
└── modules
    ├── network
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── compute
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── alb
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

## 🚚 Architecture Overview

* **VPC**: Custom VPC with four subnets across two Availability Zones (AZs).
* **Public Subnets**: For ALB and NAT Gateway.
* **Private Subnets**: For secure EC2 hosting.
* **EC2 Instances**: Two instances behind an ALB with custom user data.
* **ALB**: Public-facing Application Load Balancer forwarding traffic to EC2s.
* **Routing**: Public subnets use Internet Gateway, private subnets use NAT Gateway.

---

## 🔧 Prerequisites

* [Terraform >= 1.0](https://developer.hashicorp.com/terraform/downloads)
* AWS CLI configured with access credentials (`aws configure`)
* Valid SSH key pair locally available (public key path required)

---

## ⚖️ Input Variables

Defined in `vars.tf` and overridden in `terraform.tfvars`.

```hcl
vpc_cidr_block         = "192.168.0.0/16"
private_subnet1_cidr   = "192.168.1.0/24"
private_subnet2_cidr   = "192.168.2.0/24"
public_subnet1_cidr    = "192.168.3.0/24"
public_subnet2_cidr    = "192.168.4.0/24"
az1                    = "us-east-1a"
az2                    = "us-east-1b"

ami_id                 = "ami-020cba7c55df1f615"
instance_type          = "t2.micro"
project_name           = "demo-web-app"
key_name               = "demo-web-key"
key_path               = "~/.ssh/id_rsa.pub"

user_data = [
  "userdata.sh",
  "userdata2.sh"
]
```

---

## ⚡ Usage

### 1. Clone and Navigate

```bash
git clone https://github.com/<your-username>/terraform-aws-alb-ec2-demo.git
cd terraform-aws-alb-ec2-demo
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Review Execution Plan

```bash
terraform plan
```

### 4. Apply Infrastructure

```bash
terraform apply -auto-approve
```

### 5. Get ALB DNS

Output after apply:

```bash
alb_dns_name = "demo-web-lb-1234567890.us-east-1.elb.amazonaws.com"
```

Visit it in your browser: `http://<alb_dns_name>`

---

## 🌐 Outputs

* `alb_dns_name` - DNS of the Application Load Balancer
* `vpc_id`, `public_subnet_ids`, `private_subnet_ids`
* `aws_instance_web_server_1_id`, `aws_instance_web_server_2_id`
* `aws_security_group_web_sg_id`

---

## 🚮 Destroy Infrastructure

```bash
terraform destroy -auto-approve
```

---

## 🔒 Security & Best Practices

* SSH allowed from 0.0.0.0/0 only for demo purposes
* Use Secrets Manager or SSM Parameter Store for production secrets
* Instances in private subnets
* ALB health checks for high availability

---

## 📅 Enhancements (Future Scope)

* TLS support on ALB using ACM
* Bastion host for secure SSH access
* Autoscaling EC2 instances
* CloudWatch logs and monitoring
* S3 backend for Terraform state

---


---

## 👤 Author

**Rishwanth Kothapalli**
Cloud enthusiast | SDE turned DevOps Engineer

[LinkedIn]  www.linkedin.com/in/rishwanth-roy



