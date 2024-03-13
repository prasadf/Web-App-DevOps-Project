<a id="readme-top"></a>

# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Architecture](#architecture)
- [Creating an Azure End-to-End DevOps Pipeline](#creating-an-azure-end-to-End-devOps-pipeline)
  - [Containerisation Process using Docker](#containerisation-process-using-docker)
  - [Defining Networking- ervices with Terraform](#defining-networking-services-with-terraform)
  - [Defining an AKS Cluster with IaC](#defining-an-aks-cluster-with-iac)
  - [Creating an AKS Cluster with IaC](#creating-an-aks-cluster-with-iac)
  - [Kubernettes Deployment to AKS](#kubernettes-deployment-to-aks)
  - [CI/CD Pipeline with Azure DevOps](#ci/cd-pipeline-with-azure-devops)
  - [AKS Cluster Monitorings](#aks-cluster-monitoring)
  - [AKS Integration with Azure Key Vault for Secrets Management](#aks-integration-with-azure-key-vault-for-secrets-management)
- [Contributors](#contributors)
- [License](#licence)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

### Enhancements

- **Adding a Delivery Date Column to Order List:**

   <table style="border-style:solid;border-width:thin;border-left-width:thick;">
   <tr><th>📝 NOTE</th></tr>
   <tr><td>This feature was requested and then reverted. See <a href="https://github.com/prasadf/Web-App-DevOps-Project/issues/1">issue #1</a></td></tr> 
   </table>

- <details>
  <summary>If requested again, follow these instructions:</summary>
  
   - **Files Modified:** `app.py` and `templates\template.html`.

   - **Description:** The delivery date feature was added to enhance the functionality of the web app.
     The feature aimed to display the expected delivery date for orders placed through the app. 

   - **Implementation Details:**  In `app.py` and `template.html`, delivery date was added.

  1.  In `app.py` modify the following:

      a. `Order` class to include `delivery_date = Column('Delivery Date', DateTime)`

      b. `@app.route` `add_order` function to include `delivery_date = request.form['delivery_date']`

      c. `new_order` object to include `delivery_date=delivery_date`

  2.  In `order.html` modify the following:

      a. `<th>` elements to include `<th>Delivery Date</th>`

      b. `<td>` elements to include `<td>{{ order.delivery_date }}</td>`

      c. `<form>` element to include `<label for="delivery_date">Delivery Date:</label>` and `<input type="date" id="delivery_date" name="delivery_date"><br><br>`

  </details>

## Getting Started

### Prerequisites

For the application to succesfully run, you need to install the following packages:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.

- **Deployment:**
  - **Containerisation:** This application uses Docker for containerisation to offer a flexible and consistent deployment solution.
  - **Distribution:** This application uses Docker Hub for distribution.
  - **Infrastructure as Code (IaC):** This application uses Terraform for IaC.
  - **Deployment automation, scaling, and management of containerised application:** This application uses Kubernetes (K8s) for deployment automation, scaling, and management of containerisation.

## Architecture

![DevOps Pipeline Architecture](images/DevOps-Pipeline-Architecture.png)

## Creating an Azure End-to-End DevOps Pipeline
> [!IMPORTANT]
>
> - You'll need to install: [Docker](https://docs.docker.com/get-docker/), [Terraform](https://developer.hashicorp.com/terraform/install), [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli), [Kubernetes](https://kubernetes.io/releases/download/).
> - You'll also need accounts for: [Docker Hub](https://hub.docker.com/), [Azure](https://portal.azure.com/#home), [Azure DevOps](https://learn.microsoft.com/en-us/azure/devops/?view=azure-devops), [GitHub](https://github.com/).

## Containerisation Process using Docker

### Steps to Containerize the Application

1. **Identify Application Dependencies:**
   - List all the dependencies required for the application to run.
  
2. **Create Dockerfile:**
   - Define Dockerfile which specifies the environment and dependencies to run the application.
   - Example Dockerfile:
     ```
      FROM python:3.9
      WORKDIR /app
      COPY requirements.txt .
      RUN pip install -r requirements.txt
      COPY . .
      CMD ["python", "app.py"]
     ```
     
3. **Build Docker Image:**
   - Use the Docker build command to create a Docker image based on the Dockerfile.
   - Example: 
     ```
      docker build -t myapp .
     ```
 
4. **Run Docker Container:**
   - Start a Docker container using the built image.
   - Example: 
     ```
      docker run -d -p 8080:80 myapp
     ```

### Docker Commands Usage

1. **Building Docker Image:**
   - Build a Docker image based on the Dockerfile in the current directory:
     ```
      docker build -t <image_name> .
     ```
   - `-t`: Tag the image with a name.
 
2. **Running Containers:**
    - Start a Docker container in detached mode, mapping a host port to a container port:
      ```
       docker run -d -p <host_port>:<container_port> <image_name> 
      ```
    - `-d`: Run the container in detached mode.
    - `-p`: Specify port mapping.

3. **Tagging Docker Images:**
    - Tag a Docker image to prepare it for pushing to a registry:
      ```
       docker tag <image_id> <username>/<repository>:<tag>
      ```
    - ID of the Docker image: `<image_id>`
    - New tag format: `<username>/<repository>:<tag>`

4. **Pushing Images to Docker Hub:**
    - Push a Docker image to Docker Hub:
      ```
       docker push <username>/<repository>:<tag>
      ```
    - Image reference with tag: `<username>/<repository>:<tag>`

## Defining Networking Services with Terraform
This documentation outlines the process of defining networking services using Infrastructure as Code (IaC) with Terraform. 
### Steps to provision the necessary networking services on Azure.
1. **Create Terraform Project and Modules:**
   - Create a project folder with a descriptive name for your Terraform project, such as **aks-terraform**.
   - The project should be organized into two Terraform modules:
       - **networking-module**: for provisioning the necessary Azure Networking Services for an AKS cluster
       - **aks-cluster-module**: for provisioning the Kubernetes cluster itself.
 
2. **Define the Network Module Input Variables:**
   - Inside the networking module directory create a **variables.tf** file. 
   - Define the following variables:
       - **resource_group_name** - The name of the Azure Resource Group where the networking resources will be deployed in. The variable should be of type string and have a default value.
       - **location** - Specifies The Azure region where the networking resources will be deployed to. The variable should be of type string and have a default value.
       - **vnet_address_space** - Specifies the address space for the Virtual Network (VNet). The variable should be of type list(string) and have a default value.
     
3. **Define Networking Resources and NSG Rules:**
   - Inside the networking module directory create a **main.tf** file and define the essential networking resources for an AKS cluster as follows. 
     - Azure Resource Group: Name this resource by referencing the **resource_group_name** variable created earlier
     - Virtual Network (VNet): **aks-vnet**
     - Control Plane Subnet: **control-plane-subnet**
     - Worker Node Subnet: **worker-node-subnet**
     - Network Security Group (NSG): **aks-nsg**
   - Within the NSG, define two inbound rules:
       - one to allow traffic to the kube-apiserver (named kube-apiserver-rule) and
       - one to allow inbound SSH traffic (named ssh-rule).
       - Both rules should only allow inbound traffic from your public IP address.
 
4. **Define the Networking Module Output Variables:**
   - Inside the networking module directory create a **outputs.tf** file 
   - Define the following output variables:
     - **vnet_id** - variable that will store the ID of the previously created VNet.
     - **control_plane_subnet_id** - variable that will hold the ID of the control plane subnet within the VNet.
     - **worker_node_subnet_id** - variable that will store the ID of the worker node subnet within the VNet.
     - **networking_resource_group_name** - variable that will provide the name of the Azure Resource Group where the networking resources were provisioned in.
     - **aks_nsg_id** - variable that will store the ID of the Network Security Group (NSG).
       
4. **Initialise the Newtworking Module:**
   - Initialise the networking module to ensure it is ready to use within your main project. 
   - 'terraform init'

## Defining an AKS Cluster with IaC using Terraform

To provision an AKS (Azure Kubernetes Service) cluster using Infrastructure as Code (IaC), we've followed these steps:
1. **Define Input Variables:**
    - Create a **variables.tf** file inside the cluster module directory to define input variables.
    - Define input variables of type `string` with a `default` value:
      - aks_cluster_name: the name of the AKS Cluster to create.
      - cluster_location: the Azure region where the AKS cluster will be deployed to.
      - dns_prefix: defines the DNS prefix of the AKS cluster.
      - kubernetes_version: specifies which Kubernetes version the AKS cluster will use.
      - service_principal_client_id: provides the Client ID for the service principal associated with the AKS cluster.
      - service_principal_secret: supplies the Client Secret for the service principal.
    - Add the Output variables from `networking-module`:
      - resource_group_name
      - vnet_id
      - control_plane_subnet_id
      - worker_node_subnet_id
        
2. **Define the Cluster Resources:**
    - In the **main.tf** file within the cluster module directory, define Azure resources for provisioning the AKS cluster. Use the input variables to specify the necessary arguments.
      - Create the AKS cluster
      - Specify the node pool
      - Specify the service principle

3. **Define Cluster Module Output Variables:**
    - Create the **outputs.tf** file inside the cluster module to define output variables capturing essential information about the provisioned AKS cluster.
    - Define output variables:
      - aks_cluster_name: The provisioned cluster.
      - aks_cluster_id: Cluster ID.
      - aks_kubeconfig: Captures the Kubernetes configuration file of the cluster. This file is essential for interacting with and managing the AKS cluster using kubectl.

4. **Initialise the Cluster:**
    - Initialise the cluster module to ensure it is ready to use within the main project.
    - Use the `terraform init` command in the cluster module directory to initialise the cluster.
      ```
       terraform init
      ```
      
## Creating an AKS Cluster with IaC using Terraform

1. **Define Project Main Configuration:**
    - Create a **main.tf** file in the aks-terraform directory.
    - Define Azure provider block for authentication using service principal credentials.
    - Ensure sensitive information like client_id and client_secret are stored securely using input variables and environment variables.
      - To get your service principal credentials:
        - Open your terminal and sign in to [Azure](https://azure.microsoft.com/) using the [Azure CLI command](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) : az login.
        - Follow the prompts to authenticate with your Azure account.
        - Once you are logged in, list your Azure subscriptions and their details using the following command: `az account list --output table`. This command will display a table with information about your Azure subscriptions. Look for the `SubscriptionId` column to find your subscription ID.
     - To create a Service Principal use the command:
       ```
       az ad sp create-for-rbac --name <your-app-name> --role contributor --scopes /subscriptions/<your-subscription-id>/resourceGroups/<your-resource-group-name>
       ```

2. **Integrate the Networking Module**
    - Integrate networking module to include networking resources like virtual networks and subnets.
    - Specify input variables:
      - **resource_group_name**: Set descriptive name for the networking resource group, such as `networking-resource-group`
      - **location**: Azure region for deployment that is geographically close to you to improve latency (e.g. "UK South").
      - **vnet_address_space**: Address space for the virtual network. (e.g. `["10.0.0.0/16"]`)

3. **Integrate the Cluster Module**
    - Integrate the cluster module in the main project configuration file.This step connects the AKS cluster specifications to the main project, as well as allowing you to provision the cluster within the previously defined networking infrastructure.
    - Set `cluster_name` to `terraform-aks-cluster`
    - Set `location` to an Azure region that is geographically close to you to improve latency (e.g. "`UK South`")
    - Set `dns_prefix` to `myaks-project`
    - Set `service_principal_client_id` and `service_principal_secret` to your service principal credentials
    - Use variables referencing the output variables from the networking module for the other input variables required by the cluster module such as: resource_group_name, vnet_id, control_plane_subnet_id, worker_node_subnet_id and aks_nsg_id
      
    - Use variables referencing the output variables from the networking module for the other input variables required by the cluster module such as: `resource_group_name`, `vnet_id`, `control_plane_subnet_id`, `worker_node_subnet_id` and `aks_nsg_id`
     
4. **Apply the Main Configuration**
    - Initialise Terraform in the main project directory. `cd` into `aks-terraform` and run the initialisiation command `terraform init`.
    - Review configuration & plan deployment: terraform plan.
    - 
      <table style="border-style:solid;border-width:thin;border-left-width:thick;">
       <tr><th>❗ IMPORTANT</th></tr>
       <tr><td>If you have sensitive or secret input variables stored in a <code>*.tfvars</code> file, use the command:</td></tr> 
       </table>
       ```
        terraform plan -var-file="<your-secret-file-name>.tfvars"
       ```
       
    - Apply the Terraform configuration to create the infrastructure.

      <table style="border-style:solid;border-width:thin;border-left-width:thick;">
       <tr><th>❗ IMPORTANT</th></tr>
       <tr><td>If you have sensitive or secret input variables stored in a <code>*.tfvars</code> file, use the command:</td></tr> 
       </table>
       ```
        terraform apply -var-file="<your-secret-file-name>.tfvars"
       ```
    - Ensure secrets are ignored by adding resultant state file to .gitignore.
   
5. **Access the AKS Cluster**
    - Once provisioned, retrieve the kubeconfig file.
    - Use the **Azure CLI** to get the AKS cluster credentials.
    ```
     az aks get-credentials --resource-group <your-resource-group> --name <your-aks-cluster-name>
    ```
    - Connect securely to the AKS cluster to verify successful provisioning and operational status.
    - Check the status of your nodes you can run kubectl get nodes.

      <table style="border-style:solid;border-width:thin;border-left-width:thick;">
      <tr><th>❗ IMPORTANT</th></tr>
      <tr><td>If you use <code>wsl</code> on Windows and you’ve set up the kubectl tool as part of your Docker installation, Docker needs to be running for <code>kubectl</code> commands to work.</td></tr> 
      </table>

## Kubernettes Deployment to AKS

**1. Kubernetes Manifest Definition - Deployment**
- Create a Kubernetes manifest file named `application-manifest.yaml` that acts as a central reference for managing the containerized application.
- Define a Deployment named `flask-app-deployment` to deploy the containerized web application.
- Specify two replicas for scalability and high availability.
- Within the selector field, use the `matchLabels` section to define a label that uniquely identifies your application. For example, you could use the label `app: flask-app`. This label will allow Kubernetes to identify which pods the Deployment should manage.
- Configure the manifest to use the container image hosted on Docker Hub.
- Expose port 5000 for communication within the AKS cluster. This port servers as the gateway for accessing the application's user interface, as defined in the application code.
- Implement Rolling Updates deployment strategy for seamless updates. Ensure that, during updates, a maximum of one pod deploys while one pod becomes temporarily unavailable, maintaining application availability.

**2. Kubernetes Manifest Definition - Service**
- Add a Kubernetes Service manifest to the existing file application-manifest.yaml to facilitate internal communication within the AKS cluster.
- Add a service named `flask-app-service` for routing internal communication within the AKS cluster.
- Ensure that the selector matches the labels (`app: flask-app`) of the previously defined pods in the Deployment manifest. This alignment guarantees that the traffic is efficiently directed to the appropriate pods, maintaining seamless internal communication within the AKS cluster.
- Configure the service to use TCP protocol on `port 80`, with targetPort set to `5000`.
- Set the service type to `ClusterIP` for internal service within the AKS cluster.

**3. Deploying Kubernetes Manifest to AKS**
- Before deploying the Kubernetes manifests to your AKS cluster, make ensure you are in the correct context, which in this case is the Terraform-provisioned AKS cluster. The context specifies the cluster and user details for your AKS cluster, ensuring the deployment occurs in the intended environment.

  - Use the command `kubectl config get-contexts`
    
- Once you have ensured that the correct context is set, proceed with the deployment of the Kubernetes manifests. Apply the manifest and monitor the command-line interface for feedback on the deployment process.

  - `cd` to the root directory of your project and use the command:
  ```
  kubectl apply -f application-manifest.yaml
  ```
- After the deployment has successfully completed, take a moment to verify the status and details of the deployed pods and services. This step ensures that they are running as expected and confirm the reliability of the deployment.

  - Run the following commands:
    - `kubectl get deployments`
    - `kubectl get pods`
    - `kubectl get services`

**4. Testing and Validating Deployments on AKS**
The application we've been developing is an internal tool designed for the company's employees and is not intended for external users. Given its internal nature, you can efficiently assess the deployment by performing port forwarding to a local machine. 

  **Testing Process**:
  - Verify the status and details of pods and services within the AKS cluster. Ensure that the pods are running, and the services are correctly exposed within the cluster.
    - Run the following commands:
      - `kubectl get deployments`
      - `kubectl get pods`
      - `kubectl get services`
      - `kubectl cluster-info`
  - Once you've confirmed the health of your pods and services, initiate port forwarding to a local machine using `kubectl port-forward <pod-name> 5000:5000`.
  - Accessed the web application locally at http://127.0.0.1:5000.
  - Thoroughly test the functionality, particularly focusing on the orders table and Add Order functionality.

  **Distribution Plan**
    
  **To distribute the application to other internal users:**
  - Implement an Ingress controller to expose the application securely to internal users without relying on port forwarding.
  - Utilise Kubernetes RBAC (Role-Based Access Control) to manage access permissions within the cluster.
  - Provide documentation and training sessions for internal users on accessing the application via the established Ingress endpoint.
  
  **For external users:**
  - Utilise a secure Azure Application gateway or load balancer to expose the application securely.
  - Implement HTTPS with SSL certificates for encrypted communication.
  - Implement authentication and authorisation mechanisms, such as Azure Entra ID and RBAC, to ensure secure access based on roles.
  - Regularly update security configurations and monitor access logs for potential vulnerabilities.

## CI/CD Pipeline with Azure DevOps

1. **Create an Azure DevOps Project**
  - Create a new Azure DevOps project within the Azure DevOps account. 
  - Log into [Azure DevOps](https://dev.azure.com) with the same email account that's associated with the Azure account.

2. **Initiate Azure DevOps Setup**
  - The first essential step involves configuring the source repository for the pipeline. Choose GitHub as the source control system where your application code is hosted, ensuring you select the repository you've been working on so far.
  - As an initial configuration, create the pipeline using a **Starter Pipeline** template, which will serve as the foundation for further customisation in upcoming tasks.

3. **Establish an Azure DevOps-Docker Hub Connection**
  - Set up a service connection between Azure DevOps and the Docker Hub account, facilitating the seamless integration of the CI/CD pipeline with the Docker Hub container registry as follows:
  - Create a personal access token on Docker Hub.
  - Configure an Azure DevOps service connection utilising the Docker Hub token.
  - Successfully establish the connection between Azure DevOps and Docker Hub.

4. **Pipeline Configuration for Docker Image Build and Push**
Modify the configuration of your pipeline to enable it to build and push a Docker image to Docker Hub. Follow these steps:
    - Add Docker task with the `buildandPush` command to the pipeline. Use the same Docker image name as previously when you were pushing to Docker Hub from your local development environment.
    - Configure the pipeline to trigger on each push to the main branch.
    - Run the pipeline and test the Docker image functionality locally. You can do so by pulling the latest version from Docker Hub on your local environment. Run the container and test its functionality to ensure the application works as expected.

5. **Azure DevOps-AKS Connection Establishment**
Create and configure an AKS service connection within Azure DevOps.This service connection will help establish a secure link between the CI/CD pipeline and the AKS cluster, enabling seamless deployments and effective management.

6. **Pipeline Configuration for Kubernetes Deployment**
  - Modify the CI/CD pipeline to incorporate the **Deploy to Kubernetes** task with the deploy `kubectl` command.
  - Leverage the deployment manifest available in the application repository.
  - Utilise the established AKS connection for automatic deployment to the AKS cluster.

7. **Testing and Validation of CI/CD Pipeline**
After configuring the CI/CD pipeline, which includes both the build and release components, it's crucial to test and validate its functionality. This step ensures the seamless execution of the deployment process and verifies that the application performs as expected on the AKS cluster.

  - Monitor the status of pods within the AKS cluster to confirm correct creation of pods.
  - Initiate **port forwarding** using `kubectl` to securely access the application running on AKS.
  - Test the functionality of the application to ensure correct operation, validating the CI/CD pipeline effectiveness.

## AKS Cluster Monitoring

1. **Enable Container Insights for AKS**
   - Navigate to AKS cluster resource.
   - Select **Monitoring** from the left-hand menu.
   - Click Enable **Container Insights**.
   - Follow the prompts to enable Container Insights, ensuring Managed Identity is enabled on the cluster and necessary permissions are set for the Service Principal.
   - Use following command to enable managed identity on the AKS cluster. 
    ```
     az aks update -g {resource-group-name} -n {aks-cluster-name} --enable-managed-identity
     ```
2. **Create Metrics Explorer Charts**
   - Navigate to AKS cluster resource.
   - Select **Monitoring** from the left-hand menu.
   - Click **Metrics Explorer**.
   - Add charts for:
     - Average Node CPU Usage
     ![Average Node CPU Usage](images/average-node-cpu-usage.png)
     - Average Pod Count
     ![Average Pod Count](images/average-pod-count.png)
     - Used Disk Percentage
     ![Used Disk Percentage](images/bytes-read-and-written-per-second.png)
     - Bytes Read and Written per Second
     ![Bytes Read and Written per Second](images/bytes-read-and-written-per-second.png)
3. **Log Analytics Configuration**
Configure Log Analytics to execute and save the following logs:

   - **Average Node CPU Usage Percentage per Minute**: This configuration captures data on node-level usage at a granular level, with logs recorded per minute

   - **Average Node Memory Usage Percentage per Minute**: Similar to CPU usage, tracking memory usage at node level allows you to detect memory-related performance concerns and efficiently allocate resources

   - **Pods Counts with Phase**: This log configuration provides information on the count of pods with different phases, such as Pending, Running, or Terminating. It offers insights into pod lifecycle management and helps ensure the cluster's workload is appropriately distributed.

   - **Find Warning Value in Container Logs**: By configuring Log Analytics to search for `warning` values in container logs, you proactively detect issues or errors within your containers, allowing for prompt troubleshooting and issues resolution


   - **Monitoring Kubernetes Events**: Monitoring Kubernetes events, such as pod scheduling, scaling activities, and errors, is essential for tracking the overall health and stability of the cluster

4. **Set Up Disk Used Percentages Alarm**
  - Navigate to AKS cluster resource.
  - Select **Monitoring** from the left-hand menu.
  - Click **Alerts**.
  - Configure an alert rule to trigger when used disk percentage exceeds 90%, with check interval of 5 minutes and loopback period of 15 minutes. Set email notifications for alarm triggers.
    
5. **Modify CPU and Memory Alert Rules**
  - Navigate to AKS cluster resource.
  - Select **Monitoring** from the left-hand menu.
  - Click **Alerts**.
  - Adjust existing alert rules for CPU and memory to trigger when they exceed 80%.

## AKS Integration with Azure Key Vault for Secrets Management
This Section outlines the steps required to integrate Azure Kubernetes Service (AKS) with Azure Key Vault for secure secrets management within your application. By leveraging Azure Key Vault, sensitive information such as database credentials can be securely stored and accessed by your application running on AKS.

1. **Creating an Azure Key Vault**

  Begin by creating an Azure Key Vault where sensitive information will be securely stored.

  ```
    az keyvault create --name <key-vault-name> --resource-group <resource-group-name> --location <location>
  ```

2. **Assign Key Vault Administrator Role**

  Assign the Key Vault Administrator role to your Microsoft Entra ID user to grant necessary permissions for managing secrets within the Key Vault.

  ```
    az keyvault set-policy --name <key-vault-name> --upn <user-email> --secret-permissions get list set delete --resource-group <resource-group-name>
  ```

3. **Create Secrets in Key Vault**

  Create secrets in the Key Vault for storing sensitive credentials used within the application, including server name, username, password, and database name.

4. **Enable Managed Identity for AKS**

  - Enable managed identity for the AKS cluster to allow it to authenticate and interact securely with the Key Vault.

  - Launch a command-line interface on your local machine. Sign in to your Azure account using the Azure CLI.
     
  ```
    az aks update --resource-group <resource-group> --name <aks-cluster-name> --enable-managed-identity
  ```
  
  - Execute the following command to get information about the managed identity created for the AKS cluster:

  ```
    az aks show --resource-group <resource-group> --name <aks-cluster-name> --query identityProfile
  ```

  Make a note of the **clientId** under **identityProfile** for later use.   

5. **Assign Permissions to Managed Identity**

  Assign the Key Vault Secrets Officer role to the managed identity associated with AKS to enable it to retrieve and manage secrets.

  - Assign "Key Vault Secrets Officer" role to Managed Identity
    
  ```
  az role assignment create --role "Key Vault Secrets Officer" \
     --assignee <managed-identity-client-id> \
     --scope /subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.KeyVault/vaults/{key-vault-name}
  ```

6. **Update the Application Code**

  - Integrate Azure Identity and Azure Key Vault libraries into the Python application code to enable communication with Azure Key Vault.
  - Modify the code to use managed identity credentials, ensuring secure retrieval of database connection details from the Key Vault.
  - Ensure you have the following libraries installed:

  ``` 
  pip install azure-identity
      pip install azure-keyvault-secrets   
  ```
  - By incorporating the Azure Identity and Azure Key Vault libraries, coupled with the Azure Key Vault - AKS integration set up above, your AKS-hosted Python applications gain the capability of accessing secrets stored in Azure Key Vault. 
  - This approach replaces the need for hard-coding sensitive information within your application, introducing a more secure and dynamic credential management strategy.

7. **End-to-End Testing AKS**

  - Deploy the modified application to the AKS cluster using Azure DevOps CI/CD pipeline. 
  - Conduct end-to-end testing within the AKS environment to validate the functionality, including secure access to Key Vault secrets  directly from the Azure DevOps CI/CD pipeline.
  - Test the functionality of the application to ensure correct operation, validating the CI/CD pipeline effectiveness.


<p>
  <a href="#readme-top">back to top</a>
</p>

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))
- [Prasad Fernando]([https://github.com/yourusername](https://github.com/prasadf))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.

<p>
  <a href="#readme-top">back to top</a>
</p>
