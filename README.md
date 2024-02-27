# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [License](#license)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

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

## Delivery Date Feature: Addition and Reversion

### Changes Made
1. Addition of Delivery Date Feature<br>
   - **Files Modified:** 'app.py' and templates\template.html.

   - **Description:** The delivery date feature was added to enhance the functionality of the web app.
     The feature aimed to display the expected delivery date for orders placed through the app. 

   - **Implementation Details:**  In 'app.py' and template.html, delivery date was added.
  
2. Reversion of Delivery Date Feature<br>
   - **Files Modified:** 'app.py' and templates\template.html.

   - **Description:** Due to unforeseen complications or changes in project requirements, the delivery date feature was reverted.

   - **Reason for Reversion:** No longer necessary in the backend database.
   - **Action Taken:** In 'app.py', the code related to delivery date was removed. In template.html, any HTML elements or code related to displaying the delivery date were removed.

## Containerization Process Documentation
### Steps to Containerize the Application
1. Identify Application Dependencies:
   - List all the dependencies required for the application to run.
2. Create Dockerfile:
   - Define Dockerfile which specifies the environment and dependencies to run the application.
   - Dockerfile
     
3. Build Docker Image:
   - Use the Docker build command to create a Docker image based on the Dockerfile.
   - Example: docker build -t web-app-img .
4. Run Docker Container:
   - Start a Docker container using the built image.
   - Example: docker run -d -p 5000:5000 web-app-img

## Docker Commands Documentation
1. **Building Docker Image:**
  - 'docker build -t web-app-img .': Build a Docker image based on the Dockerfile in the current directory.
  - '-t': Tag the image with a name.
2. **Running Containers:**
  - 'docker run -d -p 5000:5000 web-app-img': Start a Docker container in detached mode, mapping a host port to a container port.
  - '-d': Run the container in detached mode.
  - '-p': Specify port mapping.

3. **Tagging Docker Images:**
  - 'docker tag web-app-img pat67/web-app-img:V1': Tag a Docker image to prepare it for pushing to a registry.
4. **Pushing Images to Docker Hub:**
  - 'docker push pat67/web-app-img:latest': Push a Docker image to Docker Hub.

## Image Information
  - **Image Name:** web-app-img
  - **Tags:** V1 (or latest)
  - **Instructions for Use:**
    - Run the container with docker run -d -p 5000:5000 web-app-img.
    - Access the application at http://localhost:5000.

## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
