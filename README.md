---

# 🚀 Value Added Course – DevOps Lab

This project sets up a complete **DevOps lab environment** for students using **Vagrant, Docker, Terraform, Ansible, Flask, and GitHub Actions**.

The goal is to give students a **hands-on CI/CD experience** where pushing code automatically deploys an application inside a provisioned VM.

<img width="250" height="248" alt="image" src="https://github.com/user-attachments/assets/3baf3430-3c00-4d00-a66d-fe9c3c39b92c" /> <img width="250" height="173" alt="image" src="https://github.com/user-attachments/assets/020dfe67-b2c0-44e1-ba67-a9441a8c0a14" /> <img width="130" height="320" alt="image" src="https://github.com/user-attachments/assets/d978445f-3636-4a41-9db4-9429a8e01d79" /> <img width="140" height="166" alt="image" src="https://github.com/user-attachments/assets/da2269db-6b3c-415c-8eb2-17d3d6b257a6" /> <img width="200" height="226" alt="image" src="https://github.com/user-attachments/assets/b9a0605e-497f-4691-bed9-757fdc3dea50" />






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

4. **login to the VM**

   ```bash
   vagrant ssh
---

<img width="557" height="361" alt="image" src="https://github.com/user-attachments/assets/9147fd00-8e29-44ee-a04c-26381b73fbec" />


## 🔹 **Practice Ansible**

1. **Switch to ansible directory & Check ansible version**

  ```bash
   cd ansible
  ```
  ```bash
  ansible --version
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

2. **List terraform directory**

    ```bash
    ls
    ```
    <img width="931" height="75" alt="image" src="https://github.com/user-attachments/assets/4daef2d5-22e5-48db-987e-5c857c4fcb85" />

3. **Initialization in Terraform**

    ```bash
    terraform init
    ```
   <img width="1042" height="472" alt="image" src="https://github.com/user-attachments/assets/e0bad5cc-0f52-4013-9a81-1d915a50efb2" />
   
4. **Terraform Plan**

    ```bash
    terraform plan
    ```
    <img width="1308" height="686" alt="image" src="https://github.com/user-attachments/assets/f6d42e4b-811e-4223-af70-97b30642b3f6" />
    <img width="1320" height="741" alt="image" src="https://github.com/user-attachments/assets/40faf425-cc6d-4a81-b92f-e734702780d0" />

5. **Terraform apply**

    ```bash
    terraform apply --auto-approve
    ```
    <img width="1395" height="370" alt="image" src="https://github.com/user-attachments/assets/c3797dcd-9174-454d-b9a5-30f2568802e2" />

6. **Terraform destroy**

    ```bash
    terraform destroy --auto-approve
    ```
   <img width="1273" height="280" alt="image" src="https://github.com/user-attachments/assets/c895a070-9d11-4634-bc83-8b8e112e93dc" />


---

## 🔹 **Lets practice github Actions / CICD**

1. **Create token**
   Click on the top right corner and click setting 

   <img width="1860" height="390" alt="image" src="https://github.com/user-attachments/assets/ebba8127-aba4-48eb-9c73-3f78c48ffc87" />

   <img width="1777" height="803" alt="image" src="https://github.com/user-attachments/assets/4c62a84e-939e-4257-9ee5-29aa48ec5521" />

   click on Developer menu

   <img width="1369" height="727" alt="image" src="https://github.com/user-attachments/assets/3dc84b2d-e262-464e-b9d6-5cb346c1a083" />



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
## 🔹 **Troubleshooting Steps**


### Why?

* When you ran into this earlier:

  ```
  Error: container name "/quiz_app" is already in use
  ```

  Terraform failed to create a new container because an **old container** was already running.
* At that point, Terraform state and Docker diverged:

  * Terraform **lost track of the container** (wasn’t written to state, or was removed manually from `.tfstate`).
  * But Docker still has the container (`docker ps -a` will show it).

So when you run `terraform destroy`, it only destroys what’s in the state (`docker_image`) — not the “orphaned” container.

---

### ✅ How to fix

1. **Check if the container still exists**

   ```bash
   docker ps -a | grep quiz_app
   ```

2. **Remove it manually**

   ```bash
   docker rm -f quiz_app
   ```

3. **(Optional) Sync Terraform state with reality**
   If Terraform state has gotten dirty, you can clean it:

   ```bash
   terraform state list              # see tracked resources
   terraform state rm docker_container.quiz_app
   terraform state rm docker_image.quiz_app
   ```

4. **Re-run**

   ```bash
   terraform apply   # will recreate properly
   terraform destroy # will now clean up both image & container
   ```

---




