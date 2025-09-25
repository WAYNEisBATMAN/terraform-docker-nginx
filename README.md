# Terraform Docker Nginx Project

## 📌 Overview

This project demonstrates **Infrastructure as Code (IaC)** by provisioning an **Nginx web server** inside a Docker container using **Terraform**. It showcases how Terraform can efficiently manage containerized workloads using the [Docker Provider](https://registry.terraform.io/providers/kreuzwerker/docker).

---

## 🚀 Features

- Pulls the latest Nginx Docker image automatically
- Runs Nginx container with configurable port mapping and container settings
- Parameterized variables for flexibility (container/image name, port numbers)
- Clean resource management with proper lifecycle
- Organized project structure following best practices
- Easy cleanup with terraform destroy


---

## 🛠️ Prerequisites

Make sure you have the following installed:

- Infrastructure Provisioning: [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.12
- Container Runtime: [Docker](https://docs.docker.com/get-docker/) installed and running  

Verify installation:

   ```bash
   terraform --version
   docker --version

   ```
---



## 📂 Project Structure

This Terraform project is organized to separate concerns and improve readability:

```
terraform-docker-nginx/
├── main.tf             # Docker resources (image & container)
├── nginx-browser.png   # output of nginx container running on browser
├── outputs.tf          # Terraform outputs (URLs, etc.)
├── providers.tf        # Docker provider configuration
├── README.md           # Project documentation
├── terraform.tfvars    # Input values for the variables
└── variables.tf        # Input variables for the project
```

**Explanation:**
- `providers.tf` → Configures Terraform to use the Docker provider.
- `variables.tf` → Declares input variables like container name and ports.
- `main.tf`      → Defines Docker resources (image and container).
- `outputs.tf`   → Displays URLs or other useful outputs after `terraform apply`.
- `README.md`    → Documentation and usage instructions.

---

## ▶️ Quick Start

1. **Clone the repository**

   ```bash
   git clone https://github.com/WAYNEisBATMAN/terraform-docker-nginx.git
   cd terraform-docker-nginx

   ```

2. **Initialize Terraform**
   ```bash
   terraform init

   ```

3. **Review the plan**
   ```bash
   terraform plan

   ```

4. **Deploy the infrastructure**
   ```bash
   terraform apply -auto-approve

   ```

5. **Access your Nginx server**

   **a) Local access (inside the VM/EC2 instance)**

   ```bash
   http://localhost:8080

   ```

   **b) External access (from your laptop/browser)**

   ```bash
   http://<vm/ec2-public-ip>:8080

   ```
   
6. **Clean up resources**
   ```bash
   terraform destroy -auto-approve

   ```

---

### 🖼️ Nginx Welcome Page

Here’s how Nginx looks when accessed externally via the EC2 public IP:

![Nginx in Browser](nginx-browser.png)

---

## 🐛 Troubleshooting

NSG inbound rule for NGINX (Azure)
Field	Value
Source	Any (or your IP)
Source port	*
Destination	Any
Destination port	8080 (or 80)
Protocol	TCP
Action	Allow
Priority	350

Common issues and their solutions:


| Issue                          | Solution                                                  |
|------------------------------- |-----------------------------------------------------------|
| Docker daemon not running      | Start Docker: `sudo systemctl start docker`               |
| Container name already exists  | Run `terraform destroy` first                             |
| Port already in use            | Change `external_port` in `variables.tf`                  |
| Permission denied              | Add user to Docker group: `sudo usermod -aG docker $USER` |
| Port not accessible externally | **AWS:** Update SG inbound rule to allow the external port<br>**Azure:** Update NSG inbound rule to allow the external port |

---