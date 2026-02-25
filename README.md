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

        ( we have created demo-user to easy the copying file because have differenet servers of os ubuntu,amazonlinx which have different home user so sigle demo user will be on all servers)

                      1.Create new user ex: demo-user (useradd > for AmazonLinux, adduser > for ubuntu)
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

**Now will move to Jenkins for creating  master-slave architecture**

  1. create a new node in jenkins
  2. Label the node as "ansible-node"
  3. Take below path from Ansible Workloads
     
      Home Directory: /home/demo-user/workloads
     
  4. Only Build jobs with Label Expressions matching this node
  5. Launch method: Launch agents via SSH
     
     Host IP: Ansible Public IP
     
     Credentials:
     
            username: admin-user
     
            passwd: admin

            Host Key Verification Strategy: Manually Trusted key verification Strategy

            Availability: keep this agent online as much as possible

            Save & Refresh

  6. Install Maven plugin on Jenkins
  7. Create a Pipeline Job  Ex: Amazon-site
     
 ===============================================================   

**DOCKER server requirements**

  After adding user in docker (demo-user) add that user docker group 
      
    usermod -aG docker demo-user
      
===============================================================

**EKS Server requirements**

    install EKS setup in demo user
    
    


