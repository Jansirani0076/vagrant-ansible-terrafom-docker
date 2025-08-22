---

# 🚀 Value Added Course – DevOps Lab

This project sets up a complete **DevOps lab environment** for students using **Vagrant, Docker, Terraform, Ansible, Flask, and GitHub Actions**.

The goal is to give students a **hands-on CI/CD experience** where pushing code automatically deploys an application inside a provisioned VM.

<img width="250" height="248" alt="image" src="https://github.com/user-attachments/assets/3baf3430-3c00-4d00-a66d-fe9c3c39b92c" /> <img width="250" height="173" alt="image" src="https://github.com/user-attachments/assets/020dfe67-b2c0-44e1-ba67-a9441a8c0a14" /> <img width="130" height="320" alt="image" src="https://github.com/user-attachments/assets/d978445f-3636-4a41-9db4-9429a8e01d79" /> <img width="140" height="166" alt="image" src="https://github.com/user-attachments/assets/da2269db-6b3c-415c-8eb2-17d3d6b257a6" />





---

## 🔹 What’s Inside

* **Vagrant VM** → provisioned with **Docker, Terraform, and Ansible**.
* **Flask App** → `k8s-quiz/` (simple quiz web app).
* **Terraform** → `terraform-docker/` (builds Docker image & runs container).
* **GitHub Actions** → `.github/workflows/deploy.yml` (pipeline triggered on push).
* **Self-hosted Runner** → runs inside the VM, listens for GitHub Actions jobs.
* ✅ **App comes online automatically after every commit** on port **5000**.

---

## 🔹 How to use It

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

---

## 🔹 **Practice Ansible**

1. **Switch to ansible directory & Check ansible version**

  ```bash
   cd ansible
  ```
  ```bash
   ansbile --version
  ```
   You should see similar output.
  
   <img width="1150" height="245" alt="image" src="https://github.com/user-attachments/assets/5f958dce-977d-477f-9aab-78ac2cd9be49" />

2. **Let's practice some ansible commands**

    ```bash
    ls
    ```
    <img width="979" height="99" alt="image" src="https://github.com/user-attachments/assets/d1121b81-9a39-4cc5-b9f5-567a97b4b1f6" />

   This make sure your github repo is copied the necessary files in /home/vagrant home directory.

6. **Install nginx**

     ```bash
    ansible-playbook install_nginx.yml
    ```

7. **copy index.html file**
   
   ```bash
   ansible-playbook copy_index.yml
   ```

8. **Stop nginx**
   
   ```bash
   ansible-playbook stop_nginx.yml
   ```
---

## 🔹 **Practice Terraform**

1. **Switch to Terraform directory and check terraform version**
   
  ```bash
   cd /home/vagrant/terraform-docker/
  ```
  ```bash
   terraform version
  ```
   
   <img width="884" height="220" alt="image" src="https://github.com/user-attachments/assets/33d8b378-935c-4949-bf47-70d0dc40f0f8" />

2. **Let's practice some Terraform commands**

    ```bash
    ls
    ```
    <img width="931" height="75" alt="image" src="https://github.com/user-attachments/assets/4daef2d5-22e5-48db-987e-5c857c4fcb85" />



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


