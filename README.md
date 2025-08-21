---

# 🚀 Value Added Course – DevOps Lab

This project sets up a complete **DevOps lab environment** for students using **Vagrant, Docker, Terraform, Ansible, Flask, and GitHub Actions**.

The goal is to give students a **hands-on CI/CD experience** where pushing code automatically deploys an application inside a provisioned VM.

---

## 🔹 What’s Inside

* **Vagrant VM** → provisioned with **Docker, Terraform, and Ansible**.
* **Flask App** → `k8s-quiz/` (simple quiz web app).
* **Terraform** → `terraform-docker/` (builds Docker image & runs container).
* **GitHub Actions** → `.github/workflows/deploy.yml` (pipeline triggered on push).
* **Self-hosted Runner** → runs inside the VM, listens for GitHub Actions jobs.
* ✅ **App comes online automatically after every commit** on port **5000**.

---

## 🔹 How Students Use It

1. **Fork the repository**
   Fork this repo:
   👉 [https://github.com/deenamanick/vagrant-ansible-terrafom-docker.git](https://github.com/deenamanick/vagrant-ansible-terrafom-docker.git)

2. **Clone your fork**

   ```bash
   git clone https://github.com/<your-username>/vagrant-ansible-terrafom-docker.git
   cd vagrant-ansible-terrafom-docker
   ```

3. **Start the VM**

   ```bash
   vagrant up
   ```

   * VM provisions with Docker, Terraform, and Ansible.
   * GitHub self-hosted runner is automatically registered.

4. **Push code changes**

   * Edit Flask app in `k8s-quiz/`.
   * Commit & push:

     ```bash
     git add .
     git commit -m "Update quiz app"
     git push origin main
     ```

5. **GitHub Actions runs automatically**

   * Workflow builds Docker image.
   * Terraform deploys container inside VM.
   * App is available at:
     👉 [http://localhost:5000](http://localhost:5000)

---

## 🔹 Project Structure

```
.
├── k8s-quiz/                # Flask app (Dockerized)
├── terraform-docker/        # Terraform configs for Docker container
├── provision/               # Provision scripts (install Docker/Terraform/Ansible)
├── .github/workflows/       # GitHub Actions workflows
├── Vagrantfile              # VM definition
└── README.md
```

---

## 🔹 Learning Outcomes

* Understand **Vagrant-based lab automation**.
* Use **Ansible for provisioning**.
* Build & run Docker containers with **Terraform**.
* Experience a **real GitHub Actions CI/CD pipeline**.
* Deploy apps automatically with a **self-hosted runner**.

---

✅ After setup, every **push → auto build → auto deploy → running app**.

---

Would you like me to also include a **diagram** (ASCII or markdown image) showing the flow: `Student → GitHub → Actions → VM (Runner) → Terraform → Docker → Flask App`?
