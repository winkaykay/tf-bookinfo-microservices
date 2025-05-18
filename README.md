
# Bookinfo Microservices on Kubernetes (Terraform Managed)

This Terraform project deploys the [Istio Bookinfo sample application](https://istio.io/latest/docs/examples/bookinfo/) to a Kubernetes cluster, using **one Terraform Cloud workspace per microservice**.

---

## 🧩 Architecture Overview

- Each microservice (`details`, `ratings`, `reviews`, `productpage`) has:
  - Its own Terraform state (TFC workspace)
  - Configurable image, port, deployment name, and service name
- Shared Kubernetes namespace `bookinfo` is managed centrally via a `namespace` workspace
- Services use `terraform_remote_state` to read the namespace output

---

## 📁 Directory Structure
```text
terraform-bookinfo/
├── namespace/
├── details/
├── ratings/
├── reviews/
├── productpage/
├── deploy-all.sh
├── destroy-all.sh 
````

---

## ⚙️ Prerequisites

- Terraform CLI
- Terraform Cloud account (with workspaces configured)
- Access to a Kubernetes cluster (`~/.kube/config` must be present)
- Remote backend set up in each `backend.tf`

---

## 🚀 Usage

### 1. Apply Namespace

```bash
cd namespace
terraform init
terraform apply -auto-approve
````

This creates the `bookinfo` namespace and outputs its name.

---

### 2. Deploy Microservices

You can apply them individually or use the helper script:

```bash
./deploy-all.sh
```

Each folder includes a `terraform.tfvars` file defining the following variables:

* `service_account_name`
* `service_name`
* `deployment_name`
* `container_name`
* `image`
* `port`

---

### 3. Destroy Everything

```bash
./destroy-all.sh
```

This tears down all resources, starting from microservices and ending with the namespace.

---

## 🔧 Configuration Example (`details/terraform.tfvars`)

```hcl
service_account_name = "bookinfo-details"
service_name         = "details"
deployment_name      = "details-v1"
container_name       = "details"
image                = "docker.io/istio/examples-bookinfo-details-v1:1.20.3"
port                 = 9080
```

---

## 📌 Notes

* The `reviews` service includes `v1`, `v2`, and `v3` deployments
* Prometheus scrape annotations are injected in `productpage` with dynamic port support
* All Kubernetes resources are deployed into the `bookinfo` namespace

---


