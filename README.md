---

## 🌍 Environment Variables

| Variable | Value | Description |
|----------|-------|-------------|
| `dockerimagename` | `neeraj91/react-app` | Docker image name |
| `AWS_DEFAULT_REGION` | `ap-southeast-1` | AWS region for S3 |

---

## 📦 Terraform Resources

| Resource | Name | Region |
|----------|------|--------|
| S3 Bucket | `neeraj-react-artifacts-1234` | ap-southeast-1 |

---

## ☸️ Kubernetes Resources

| Resource | Name |
|----------|------|
| Deployment | `deployment` |
| Service | `service` |

---

## 🔒 Security

- Docker credentials stored securely in Jenkins credentials store
- AWS credentials managed via Jenkins AWS Credentials plugin
- Kubeconfig stored as Jenkins secret file
- Sensitive files excluded via `.gitignore` and `.dockerignore`:
  - `*.pem` — SSH keys
  - `*.tfstate` — Terraform state files
  - `.terraform/` — Provider plugins

---

## 📝 Notes

- Minikube API port changes on every restart — always start with fixed port:
```bash
minikube start --apiserver-port=8443
```
- S3 artifacts are organized by `BUILD_ID` for easy versioning
- SonarQube and Quality Gate stages are disabled by default — enable when SonarQube server is configured

---

## 👤 Author

**Neeraj Bijalwan**
- GitHub: [@neerajddun](https://github.com/neerajddun)
- Docker Hub: [neeraj91](https://hub.docker.com/u/neeraj91)
