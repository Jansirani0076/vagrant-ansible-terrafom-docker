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
  
4. **Practice Ansible**

  ```bash
   cd ansible
  ```
  ```bash
   ansbile --version
  ```
  You should see similar output.
  
  <img width="1150" height="245" alt="image" src="https://github.com/user-attachments/assets/5f958dce-977d-477f-9aab-78ac2cd9be49" />

5. **Let's practice some ansible commands**

    ```bash
    ls
    ```
    <img width="979" height="99" alt="image" src="https://github.com/user-attachments/assets/d1121b81-9a39-4cc5-b9f5-567a97b4b1f6" />



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


