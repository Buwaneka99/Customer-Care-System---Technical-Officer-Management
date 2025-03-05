# Customer Care System - Technical Officer Management

A **Technical Officer Management System** for a customer care platform, designed to handle technical officer operations such as profile management, responding to customer and agent issues, and maintaining daily summaries. Built using **Java**, **JSP**, **Servlets**, **MySQL**, and follows the **MVC (Model-View-Controller)** architecture.

## Features

- **Authentication**: Secure login system for technical officers.
- **Profile Management**:
  - View and update personal details (name, address, and contact number).
  - Change password.
- **Technical Problem Management**:
  - View customer and agent-reported technical problems.
  - Provide responses and solutions to problems.
- **Daily Summary Management**:
  - Add a summary of daily technical issues handled.
  - Edit and delete summaries if necessary.
  - View a complete history of summaries.

## Technologies Used

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: Java (Servlets, JSP)
- **Database**: MySQL
- **Server**: Apache Tomcat v9
- **Architecture**: MVC (Model-View-Controller)
- **IDE**: Eclipse

## Screenshots

- **Login Page**
![Image](https://github.com/user-attachments/assets/5e3943ec-7187-410d-983c-d41aacfa48d3)


- **Profile Page**
![Image](https://github.com/user-attachments/assets/901c5fcd-cc98-4b86-b386-08f80d4afbc8)


- **Password change model**
![Image](https://github.com/user-attachments/assets/900e5906-3aed-4d70-b13b-c01fed884df3)


- **Daily Summary Page**
![Image](https://github.com/user-attachments/assets/e2228714-7afa-44e2-b89b-869cf6b4237c)


## Installation and Setup

### 1. Clone the Repository

```bash
https://github.com/Buwaneka99/Customer-Care-Systems---Technical-officer.git
```

### 2. Import the Project into Eclipse

- Open **Eclipse** and go to `File > Import`.
- Select **Existing Projects into Workspace**.
- Browse to the cloned folder and import the project.

### 3. Configure Apache Tomcat 9

- In Eclipse, go to `Window > Preferences`.
- Expand **Server** and select **Runtime Environments**.
- Click **Add**, choose **Apache Tomcat v9.0**, and browse to the Tomcat installation directory.

### 4. Set Up the Database

Run the following SQL command to create the database:

```sql
CREATE DATABASE customer_care_system;
```

Import the provided **database file (**customer_care_system.sql**)** into MySQL:

```bash
mysql -u your-username -p customer_care_system < customer_care_system.sql
```

Update **DBConnection.java** with your database credentials:

```java
private static final String URL = "jdbc:mysql://localhost:3306/customer_care_system";
private static final String USERNAME = "your-username";
private static final String PASSWORD = "your-password";
```

### 5. Deploy the Application on Tomcat

- Right-click the project in Eclipse.
- Select `Run As > Run on Server`.
- Choose **Apache Tomcat 9** and click **Finish**.
- The application will be deployed.

### 6. Access the Application

Once deployed, open your browser and go to:

```
http://localhost:8080/CustomerCareSystem/Login.jsp
```

## Usage Guide

1. **Login** with technical officer credentials.
2. **Navigate the Profile Page** using the navigation bar.
3. **Edit Personal Details** such as name, address, and contact number.
4. **View and Respond to Technical Problems** submitted by agents and customers.
5. **Manage Daily Summaries**:
   - Add new summaries.
   - Edit or delete existing summaries.
   - View previous summaries.

## Building and Running

If the project doesn't auto-build:

- In Eclipse, go to `Project > Build Project`
- Deploy the application on Tomcat again


