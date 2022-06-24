# Virtual-ELK-Stack-Deployment-
ELK Stack Automated Deployment for Virtual Monitoring via Ansible Playbooks with FILEBEAT and METRICBEAT. 

ELK STACK AUTOMATED DEPLOYMENT

The contents within describe the Automation of the ELK Stack Deployment to Virtual Machine(s) for Monitoring.

The files in this repository were used to configure the network depicted in the VM Network Diagram.

       
       Images/VM_Network_Diagram.png


These Ansible Playbook files have been tested and used to generate a live ELK deployment on Azure. These Ansible playbooks can be used to either recreate the entire deployment and internal infrastructure as illustrated above or pick and choose applications and tools to remove or implement systemwide. Alternatively, select portions of the Ansible Playbook file may be used to install and/or remove only certain tools or applications such as the Beats’ Filebeat and Metricbeat as described within.

- Playbook files:
Located in the directory /etc/ansible 
  - install-elk.yml
  - filebeat-playbook.yml
  - metricbeat-playbook.yml

Located in the directory /etc/ansible/files
  - filebeat-config.yml
  - metricbeat-config.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application. The Topology of Virtual Servers (VMs) and Network is shown above. A Jump-Box is used as a provisioner (Gateway) to securely access other VMs using a Public Key to verify the authentication for access. The Virtual Network consists of two Subnets; Subnet2 is used for the ELK and Subnet is used for the Jump-Box and Web Servers. The Web Servers will utilize the Load Balancer to ensure applications are highly accessible and Web Servers are highly available. In addition to restricting traffic to the network, the load balancer ensures application and system logs are collected for analysis and monitoring via ELK Stack.

Integrating an ELK server into the Virtual environment allows users to easily monitor the vulnerable VMs for changes to the application and system files. Filebeat is used to organize log files through the Logstash and Elasticsearch, which will log information about the application and system files as well as files that changed and when. Kibana is an interface used to research events that have occurred over the network as visual representations to allow for in-depth insight. Metricbeat is used to collect metric information on VMs in the network such as CPU usage and uptime.  

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web 1    | Server   | 10.0.0.5   | Linux            |
| Web 2    | Server   | 10.0.0.6   | Linux            |
| ELK      | Sys Logs | 10.1.0.4   | Linux            |
|----------|----------|------------|------------------|


### Access Policies

The machines on the internal network are not exposed to the public Internet. Only the Jump-Box machine can accept connections from the Internet. Access to the Jump-Box machine is allowed only from the following IP addresses:

- 10.0.2.15
- 73.106.98.65

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses    |
|----------|---------------------|-------------------------|
| Jump Box | Yes/No              | 10.0.0.4 | 73.106.98.65 |
|          |                     | 10.0.0.4 | 10.0.2.15    |
| ELK      | Yes/No              | 10.1.0.4 | 10.0.0.4     |
| WEB1     | Yes/No              | 10.0.0.5 | 20.28.147.167|
| WEB2     | Yes/No              | 10.0.0.6 | 20.28.147.167|
|----------------------------------------------------------|
Developing and implementing the Virtual Network required the entry knowledge of systems administration, virtualization, cloud, and automation skills.

A threat/risk will leave a trace that can be followed and investigated using log files as a source. Kibana is an effective interface for visual representations of all log files received from multiple systems allowing detailed analysis of system-wide logged events or logged events for a specific machine or set of machines.


### Elk Configuration

Ansible allows the automation of the ELK machine’s configuration; no configuration was performed manually, which is advantageous because the Ansible playbook allows for system wide deployment of applications and tools. 

The install-elk.yml playbook implements the following tasks:
- Installs docker, python and Java Runtime.
- Downloads the Image to be used by Docker.
- Downloads, Installs, Updates, Configures and Starts the Elastic and Kibana Deb Package.
- Downloads, Installs, Creates, Adds Pipeline and Starts the Logstash Deb Package.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

       
       Images/docker_ps_output.png


### Target Machines & Beats

This ELK server is configured to monitor the following machines:

       - 10.0.0.5 – Labeled as WEB 1
       - 10.0.0.6 – Labeled as WEB 2


The following Beats were successfully installed: 
- filebeat
- metricbeat

The installation of the Beats’ tools, filebeat and metricbeat, allow the collection of the following information from each machine: log files on events collected on application and system files and metric information on VMs in the network such as CPU usage and uptime. Kibana is used an interface to visual represent the data collected from filebeat and metricbeat as part of the ELK Stack.


### Using the Playbook

To use an Ansible Playbook to configure server(s) an Ansible control node needs to be already configured. Assuming there is such a control node provisioned: 

SSH into the control node and follow the steps below:
- The Ansible configuration files are in the Ansible File directory.
- Update the HOSTS file with server name(s) and IP(s).
- Update ANSIBLE.CFG file with the remote username. 
- Run the install-elk.yml playbook to build server infrastructure.
- Navigate to KIBANA via ELK VM’s Private IP as shown here to verify 
  installation works: http://[your.ELK-VM.External.IP]:5601/app/kibana.

The Ansible’s HOSTS file contains groups, which represent the servers’ names and list of IPs for that group. The group name, “elk”, directs the ELK’s Installation to be executed on specified machines’ via IPs listed. The “elk” group also used during the installation of filebeat and metricbeat via Ansible Playbooks; other Beats tools may be added as needed.

Some specific commands the user will need to run to access the playbook, update the files, etc. are provided below:

Update the HOSTS and ANSIBLE.CFG files in the ansible directory.
       :/etc/ansible# sudo nano -c hosts.yml 
       :/etc/ansible# sudo nano -c ansible.cfg
       
Commands used to install ELK:
       :/etc/ansible# sudo nano install-elk.yml 
       :/etc/ansible# ansible-playbook install-elk.yml 
       :/etc/ansible# ansible webserver -m ping      

Commands to manually start the ELK container:
# sudo docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -it --name elk sebp/elk:761

Command to verify the container is up and running successfully:
# docker run hello-world

Command to start the docker container:
$ sudo docker start <container name>

Command to attach to the docker container:
$ sudo docker attach <container name>

