# First-project
Deploying amazon site using tools terraform, Jenkins, Maven, Ansible, Docker, Kubernetes

**Terraform ( infrastructure creation)
---------------------
  1. Created a ec2 instance
  2. install terrafrom and create infrastructure modules
  3. Check the terraform-script for the code
  4. And completion of create go to /environment/dev to run terraform
  5. terraform init > terraform fmt (if required) > terraform plan > terraform apply

Totall infrastructure we want will be created by terraform 

=======================================================================

**Jenkins (Master - Slave Architecture)**
  1. After infrastructure creation login into Jenkins Server
  2. Install java and jenkins
  3. Allow 8080 port security to the instance
  4. Login into Jenkins by www.<ip_address>:8080

=======================================================================

**Ansible (slave Node for jenkins)**
  1. install ansible
  2. Create new user ex: demo-user (useradd)
  3. create password ex: demo (paswwd demo-user)
  4. switch user to demo-user
  5. Create workloads folder inside
  6. install Java in ansible server
  7. Add root privilages for the user 'demo-user' inside 'visudo' file:
     
     root    ALL=(ALL:ALL) ALL
     
     demo-user    ALL=(ALL:ALL) ALL
  9. Do below changes on Ansible server only (As we need to connect from Jenkins to Ansible Server with Credentials)

     vi /etc/ssh/sshd_config
     
     Change: PasswordAuthentication yes
  10. sudo systemctl reload sshd
  11. Create a folder: '.ssh'
  12. Execute: ssh-keygen
  13. Copy id_rsa.pub content and paste on both Docker and Eks-host servers at location:
      'demo-user>.ssh/authorized_keys
      
           ** Adding Docker and EKS servers under Ansible for configuration Management**

                Steps to add docker and EKS server under Ansible

                      1.Create new user ex: demo-user (useradd)
                      2.create password ex: demo (paswwd demo-user)
                      3.switch user to demo-user
                      4.Create a folder: '.ssh'
                      5.Create a file inside '.ssh': 'authorized_keys'

   14. vi /etc/ansible/hosts
   15. Add Docker and EKS private address
       
         [docker]
       
          Private IP
       
        [eks]
       
          Private IP
  16. Check pings for servers
        ansible docker -m ping
        ansible EKS -m ping
        
     
=======================================================================
