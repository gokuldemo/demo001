 demo001   
To showcase devops fluency  
To record the start time of the project - The TIME is 18:34 GMT!!  

**Scope**:  

The scope of this project is to demonstrate the automation of deploying an infrastructure that can host a two tier web application. The setup will comprise of two application servers that will be hosting a Go application which are compiled using gccgo-go. The application servers will be behind a web server which will have Nginx installed and configured to balance the load between the two application servers and to act as a proxy.

**Assumptions**:  

This exercise has been done with the following assumptions:  
1. The code will be used in a Ubuntu virtual server environment.  
2. It is assumed that the system used to test / evaluate this code will have Ruby and other associated tools defined in Pre-Requisites section installed in it.   

**Pre-Requisites**:  
1. git  
2. [VirtualBox](https://www.virtualbox.org/)  
3. [Vagrant](https://www.vagrantup.com/)  
4. [ChefDk](https://downloads.chef.io/chef-dk/)   
5. [Vagrant-Berkshelf](https://github.com/berkshelf/vagrant-berkshelf)  
6. [Test Kitchen - Vagrant](https://github.com/test-kitchen/kitchen-vagrant)

**Installation Instructions:**   

1. Clone the repository using the command:
        git clone https://github.com/gokuldemo/demo001.git

2. Execute the wrapper by parsing the options to "deploy", "destroy" and "test" options to perform the corresponding actions:   
         **./wrapper.sh deploy** - Will deploy the infrastructure required and configure the environment to compile the source code and deploy the binary to the application server.   
       **./wrapper.sh destroy** - Will destroy the infrastructure and configuration that were created to execute this project.  
       **./wrapper.sh test** - Will deploy and run the test cases defined in the test framework.   

Notes:
