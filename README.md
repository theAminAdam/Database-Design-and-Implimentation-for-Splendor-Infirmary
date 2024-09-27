# DATABASE DESIGN AND IMPLEMENTATION FOR PATIENT AND MEDICAL MANAGEMENT SYSTEM
## Project Overview
This repository contains the **Database Design and Implementation Project** for **Splendor Infirmary** patient and medical management system completed by **Splendor Analytics** in september 2024.
The system is design to efficiently manage hospital data including Patient Information, Doctor Details, Medical Records, Appointments and Departments Data.

## Table of Contents

1.	[Introduction](#introduction)

2.	[Database Design Process](#database-design-process)
     - 2.1 [Requirements Gathering](#requirements-gathering)
     - 2.2 [Conceptual Design](#conceptual-design)
     - 2.3 [Logical Design](#logical-design)
     - 2.4 [Physical Design](#physical-design)

3.	[Database Schema and Implementation](#database-schema-and-implementation)
     - 3.1 [Database and Table Structure](#database-and-table-structure)
     - 3.2 [Constraints and Data Integrity](#constraints-and-data-integrity)
     - 3.3 [Triggers and Business Logic](#triggers-and-business-logic)

4.	[Normalization](#normalization)
     - 4.1 [First Normal Form (1NF)](#first-normal-form (1NF))
     - 4.2 [Second Normal Form (2NF)](#second-normal-form (2NF))
     - 4.3 [Third Normal Form (3NF)](#third-normal-form (3NF))

5.	[Justification of Design Choices and Conclusion](#Justification-of-Design-Choices-and-Conclusion)

---
## Introduction

  Splendor Analytics has been engaged to design and implement a comprehensive database system for Splendor Infirmary. The goal is to create a robust, scalable, and efficient solution to manage the hospital's critical data, including patient information, doctor details, medical records, appointments, and departmental data. 

This system is essential for improving operational efficiency, ensuring data integrity, and providing easy access to vital information for medical staff and administrators. 
  In an era where healthcare data management is crucial for both patient care and administrative operations, the need for an efficient database solution cannot be overstated. The Splendor Infirmary Database Management System aims to provide a seamless experience for patients while ensuring that healthcare providers have immediate access to the information they need. To this end, the database system will facilitate patient registration, appointment scheduling, and the management of medical records.
  When a patient wishes to register with a general practitioner (GP) at Splendor Infirmary, they must provide essential personal information, including their full name, address, date of birth, and insurance details. Additionally, patients will create a username and password for secure access to their patient portal, allowing them to manage their healthcare journey effectively. The system is designed to store this data securely, ensuring compliance with privacy regulations while also providing optional fields for email addresses and telephone numbers, which enhance communication between the hospital and its patients.
  
  Once registered, patients will have the capability to book appointments through the patient portal. The database system will facilitate real-time checks of doctor availability, ensuring that patients can schedule their visits without unnecessary delays. Appointment details will be meticulously stored, encompassing critical information such as the date and time of the appointment, the relevant department, the status of the appointment (pending, canceled, or completed), and the assigned doctor.
  Upon a patient's arrival for their scheduled appointment, doctors will have immediate access to the patient's medical records. This includes past appointments, diagnoses, medications, and known allergies, allowing for a comprehensive review of the patient’s health history. Healthcare providers can update these records with new diagnoses and medications during the consultation, ensuring that the patient's medical history remains current and accurate. Following the appointment, the status will be updated to reflect its completion, and patients will have the opportunity to provide feedback or reviews for the doctor, contributing to continuous improvement in care quality.
  
  In cases where patients need to cancel their appointments, the system will allow them to rebook at a later time, maintaining flexibility within the scheduling process. Importantly, if a patient decides to leave the hospital system, the hospital intends to retain their information within the database for historical reference, while also recording the date they departed. This approach ensures that valuable data is preserved for future analysis and reporting, contributing to the overall understanding of patient care and service delivery at **Splendor Infirmary**.
  
---
## Database Design Process

 **2.1 Requirements Gathering**
 
  In the initial phase of our project, we collaborated closely with various stakeholders at Splendor Infirmary, including administrative staff, healthcare providers, and IT personnel, to capture their specific needs and expectations for the new database system. This collaborative approach was crucial for understanding the intricacies of hospital operations and ensuring that the proposed solution aligns with the operational workflow. The primary requirements gathered include comprehensive patient and doctor details, including names, contact information, and relevant medical specialties. 
  One of the key aspects identified was the management of medical records, which encompasses detailed information about patient diagnoses, prescriptions, and treatment histories. To facilitate efficient healthcare delivery, the database must support seamless appointment scheduling and tracking, allowing patients to manage their visits and doctors to have real-time access to their schedules. Additionally, an organizational structure for various hospital departments is necessary to ensure that appointments are correctly categorized and that patient information is easily retrievable based on departmental requirements.
  In line with these requirements, we implemented key data points reflecting patient data sampling, which will be elaborated upon in Chapter 3 (Database Schema and Implementation). This sampling ensures that the data collected is representative and meets the diverse needs of the hospital’s patient demographic.

**2.2 Conceptual Design**

The conceptual design of the database system was developed using an Entity-Relationship (ER) model. This model serves as a blueprint for identifying and defining the core entities essential to the hospital's operations, including Patients, Doctors, Medical Records, Appointments, and Departments. Each of these entities has distinct attributes and plays a vital role in the overall functionality of the system.
- Patients are defined by attributes such as full name, address, date of birth, insurance details, and optional contact information like email addresses and telephone numbers. The inclusion of a username and password is also crucial, as it allows patients to securely log into their patient portal for managing appointments and accessing their medical records.
- Doctors are characterized by their names, specialties, and availability, which are integral to the appointment scheduling process. The system must check for doctor availability in real-time to ensure that patients can book their appointments without conflicts.
- Medical Records include critical data points such as past appointments, diagnoses, prescribed medications, and recorded allergies. This information is essential for doctors to provide informed care during patient visits.
- Appointments will be stored with details including date, time, department, status (pending, canceled, or completed), and the assigned doctor. This organization helps streamline the appointment management process.
- Departments serve as the organizational framework within the hospital, allowing for efficient categorization and retrieval of appointment and patient data.
  
**2.3 Logical Design**

The logical design phase involved translating the conceptual ER model into a structured format suitable for implementation in a relational database. This included defining specific tables for each entity identified earlier, ensuring that all relationships among entities are established correctly. For instance, the Appointments table is linked to both the Patients and Doctors tables through foreign keys, which helps maintain data integrity and referential integrity throughout the database.
Appropriate primary keys were established for each table, ensuring that each record can be uniquely identified. For example, the PatientID serves as the primary key in the Patients table, while the AppointmentID uniquely identifies each appointment in the Appointments table. This design enhances data retrieval efficiency and supports the implementation of business rules, such as ensuring that a patient cannot book overlapping appointments with the same doctor.

**2.4 Physical Design**

In the final phase, we implemented the physical design of the database using T-SQL within SQL Server. This involved selecting appropriate data types for each attribute, establishing constraints to ensure data accuracy, and creating indexes to optimize query performance. Additionally, we set up triggers to enforce business rules and maintain data integrity. 
For instance, when a patient arrives for an appointment, the database will trigger an update to the appointment status from "pending" to "completed" once the consultation is finalized. Furthermore, if a patient cancels an appointment, they must rebook through the portal, prompting the system to update the appointment records accordingly. This meticulous approach to physical design ensures that the system not only meets current operational needs but is also scalable for future growth.
By aligning our design and implementation strategies with the specific requirements gathered from stakeholders, Splendor Analytics is committed to delivering a robust database solution that enhances the operational efficiency of Splendor Infirmary while ensuring high-quality patient care.

---
## Database Schema and Implementation

**3.1 Database and Table Structure**

The database, named SplendorInfirmary, consists of five primary tables:

*a)	Patients Table*

 ![Patients table](https://github.com/user-attachments/assets/441c7932-4194-46d3-bbdb-e143d7ce9a04)

This table consists of the following columns:
 - 	PatientId: A unique identifier for each patient. It is an integer that auto-increments with each new record (PRIMARY KEY).
 - 	Prefix: An optional field for titles (e.g., Mr., Mrs., Dr.).
 - 	FirstName: The patient's first name. This field is mandatory (NOT NULL).
 - 	LastName: The patient's last name. This field is also mandatory (NOT NULL).
 - 	DateOfBirth: The patient's date of birth (NOT NULL).
 - 	Insurance: Information about the patient’s health insurance provider.
 - 	Gender: The gender of the patient, represented as a single character with a CHECK constraint to ensure only 'M', 'F', or 'O' (Other) are accepted.
 - 	MaritalStatus: Indicates the marital status of the patient with a CHECK constraint limiting the values to 'Single', 'Married', 'Divorced', or 'Widowed'.
 - 	Race: An optional field for the patient's racial or ethnic background.
 - 	Address: The patient's residential address.
 - 	City: The city in which the patient resides.
 - 	EmailAddress: The patient's email, which must be unique across the table (UNIQUE constraint) to prevent duplication.
 - 	PhoneNumber: The patient's phone number, also required to be unique (UNIQUE constraint).
 - 	DateLeft: Records the date the patient left the hospital system, if applicable; this field is nullable.

*b) Departments Table*

 ![Departments table](https://github.com/user-attachments/assets/27a3b3e2-f5c8-439b-b621-db2c78f0e71f)
 
 -	DepartmentId: A unique identifier for each department, starting at 100 and auto-incrementing (PRIMARY KEY).
 -	DepartmentName: The name of the department (NOT NULL).

*c) Medical Records Table*

![Medical Records table](https://github.com/user-attachments/assets/525f2e25-e8b8-47c1-b30d-22b94e8d527b)

 
 -  RecordId: A unique identifier for each medical record, auto-incrementing (PRIMARY KEY).
 -  PatientId: A foreign key linking to the PatientId in the patients table, ensuring that each medical record corresponds to a valid patient (NOT NULL). The ON DELETE CASCADE option ensures that if a patient record is deleted, all associated medical records are also removed.
 -  DepartmentId: A foreign key linking to the DepartmentId in the departments table, indicating the department involved in the patient's treatment (NOT NULL). Similar to PatientId, it uses ON DELETE CASCADE.
 -  DiagnosisHistory: A text field capturing the history of diagnoses for the patient.
 -  SpecialityVisited: The specialty or specific area of medicine the patient visited.
 -  StartDate: The date when the patient's treatment began.
 -  EndDate: The date when the treatment concluded.
 -  AdmissionType: Indicates the type of admission, with a CHECK constraint limiting options to 'Regular', 'Daycase', 'Emergency', 'Inpatient', or 'Outpatient'.
 -  Prescription: A text field containing details of prescribed medications.
 -  Allergies: Records any known allergies, with a default value of 'No Allergies'.
 -  Cost: A decimal field representing the cost of the treatment, with a CHECK constraint to ensure it is non-negative.

*d) Doctors Table*

![Doctors table](https://github.com/user-attachments/assets/300a8acd-7777-4941-b78f-3e4c17c7a342)

 
 -  DoctorId: A unique identifier for each doctor, starting at 1000 and auto-incrementing (PRIMARY KEY).
 -  FirstName: The doctor’s first name.
 -  Lastname: A single character for the doctor's last name.
 -  Speciality: The area of expertise or specialization of the doctor.
 -  DepartmentId: A foreign key linking to the DepartmentId in the departments table, indicating the department to which the doctor belongs (NOT NULL). This relationship employs ON DELETE CASCADE, ensuring that if a department is removed, all associated doctors will also be deleted.
 -  Rank: A classification for the doctor's rank with a CHECK constraint allowing values of 'Junior', 'Senior', 'Specialist', or 'Consultant'.

*e) Appointments Table*

![Appointments table](https://github.com/user-attachments/assets/f6179e21-7c74-4ccd-aad3-ed01a1fd9399)

 -  AppointmentId: A unique identifier for each appointment, auto-incrementing (PRIMARY KEY).
 -  DoctorId: A foreign key linking to the DoctorId in the doctors table, indicating which doctor is assigned to the appointment (NOT NULL). ON DELETE CASCADE ensures that when a doctor is removed, all associated appointments are also deleted.
 -  PatientId: A foreign key linking to the PatientId in the patients table, indicating which patient has the appointment (NOT NULL). This also employs ON DELETE CASCADE.
 -  Date: The date of the appointment (NOT NULL).
 -  Time: The time of the appointment (NOT NULL).
 -  Status: The current status of the appointment, with a CHECK constraint limiting it to 'Scheduled', 'Completed', or 'Canceled'.
 -  BookingStatus: Indicates whether the appointment has been rebooked, with a CHECK constraint limiting options to 'Rebooked', 'Not Rebooked', or 'Done', defaulting to 'Done'.
 -  TreatmentOutcome: A text field capturing the outcome of the treatment during the appointment.

**Summary of Relationships**

![SplendorInfirmary database schema](https://github.com/user-attachments/assets/0f6cc14f-915d-4a3f-b72d-0fdca8a8701a)

 
 -  Patients to Medical Records: One-to-Many relationship; each patient can have multiple medical records, but each medical record is linked to a single patient.
 -  Departments to Medical Records: One-to-Many relationship; each department can have multiple medical records, but each medical record is linked to a single department.
 -  Departments to Doctors: One-to-Many relationship; each department can have multiple doctors, but each doctor belongs to only one department.
 -  Patients to Appointments: One-to-Many relationship; each patient can have multiple appointments, but each appointment is linked to a single patient.
 -  Doctors to Appointments: One-to-Many relationship; each doctor can have multiple appointments, but each appointment is assigned to one doctor

**3.2 Constraints and Data Integrity**

-  Foreign Keys: Ensure referential integrity between tables (e.g., linking PatientId in appointments to the patients table).
-  Check Constraints: Validate data entries (e.g., Gender can only be 'M', 'F', or 'O').
-  Triggers: Enforce business rules, such as rebooking canceled appointments.

**3.3 Triggers and Business Logic**

![Rebooking Trigger](https://github.com/user-attachments/assets/69ae200d-5e70-496b-877d-7b044a06239a)

 
A trigger was created to ensure that canceled appointments are rebooked:

The rebooking trigger was implemented in the appointments table to enforce business logic regarding appointment cancellations.

*Key Features:*

  1.	Activation: The trigger is activated AFTER UPDATE operations on the appointments table.
  2.	Condition Checking: It checks for any records in the inserted pseudo-table where the Status is 'Canceled' and BookingStatus is 'Not Rebooked'.
  3.	Error Handling: If such a record exists, the trigger raises an error with the message: *'Appointment is canceled. You must rebook the appointment before proceeding.'*
  4.	Transaction Rollback: It executes a ROLLBACK TRANSACTION, preventing any further changes until the appointment is rebooked.
     
The following are implications of creating the Trigger:

  -  Patient Compliance: Encourages patients to rebook canceled appointments, ensuring they do not miss healthcare opportunities.
  -  Resource Management: Helps the hospital efficiently manage its scheduling and resources.
  -  Data Integrity: Maintains the accuracy of appointment records, preventing inconsistencies.
  
In essence, the rebooking trigger is crucial for managing appointment processes effectively, enhancing patient care, and ensuring operational efficiency.

--- 
## Normalization

  Normalization is a critical process in database design that aims to organize data efficiently and reduce redundancy. By structuring a database into distinct tables and establishing relationships between them, normalization enhances data integrity and makes it easier to manage. 
  This systematic approach minimizes the risks of anomalies during data operations such as insertions, updates, and deletions. The normalization process is typically divided into several stages, known as normal forms, each with its specific rules and requirements. In this chapter, we will explore the three primary normal forms—First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF)—as they relate to the database design.
  
**4.1 First Normal Form (1NF)**

  First Normal Form (1NF) ensures that each column in a table contains only atomic values, meaning that each entry must be indivisible. This eliminates any repeating groups or arrays within a single column, allowing for a clearer structure.
  •	Example: In the patients table, separate columns are used for FirstName and LastName. This design adheres to 1NF as each column holds a single piece of information.

**4.2 Second Normal Form (2NF)**

  Second Normal Form (2NF) is achieved by removing partial dependencies, ensuring that all non-key attributes are fully functionally dependent on the primary key. This means that each non-key attribute must be directly related to the entire primary key, not just a portion of it.
  •	Example: In the medical_records table, attributes such as DiagnosisHistory and Prescription are fully dependent on RecordId, the primary key of the table. This ensures that no partial dependencies exist, fulfilling the requirements of 2NF.

**4.3 Third Normal Form (3NF)**

  Third Normal Form (3NF) focuses on eliminating transitive dependencies, which occur when non-key attributes depend on other non-key attributes. For a table to be in 3NF, non-key attributes must only depend on the primary key.
  •	Example: The patients table does not store DepartmentName, which belongs to the departments table. By ensuring that such relationships are maintained in their respective tables, the design adheres to 3NF, promoting data integrity and reducing redundancy.

---
## Justification of Design Choices and Conclusion

  The design choices made for the database system were carefully considered to enhance efficiency, maintain data integrity, and support the hospital's operational needs. Below are the key justifications for these design decisions:

**Separation of Concerns**

  Creating distinct tables for patients, doctors, departments, appointments, and medical_records effectively reduces data redundancy and promotes efficient data management. This separation allows each table to focus on its specific domain, ensuring that information is logically organized and easily retrievable. By isolating different entities, the database design not only simplifies data manipulation but also improves clarity, making it easier for medical staff and administrators to access and manage relevant information without confusion.

**Data Integrity and Consistency**

  The implementation of foreign keys and constraints is integral to maintaining robust relationships among the various tables while validating data entry. These mechanisms help to minimize errors and ensure data consistency throughout the system. For instance, by linking appointments to patients and doctors through foreign keys, the database enforces referential integrity, which prevents orphaned records and ensures that all entries remain coherent and interconnected. This validation process is essential for maintaining the accuracy of patient information, medical records, and appointment schedules, thereby enhancing the reliability of the system.

**Scalability and Maintainability**

  The schema has been designed with scalability and maintainability in mind, allowing for future expansion as the needs of Splendor Infirmary evolve. The modular structure enables the addition of new tables and relationships without necessitating significant restructuring of existing components. This flexibility is crucial for accommodating potential growth in patient volume, the introduction of new medical services, or changes in administrative requirements. As the healthcare landscape evolves, the database can adapt seamlessly, ensuring that it continues to meet the hospital's operational demands.

**Business Rules Enforcement**

  To uphold the operational standards and protocols of Splendor Infirmary, triggers and check constraints have been implemented to enforce essential business rules. For example, the `rebooking` trigger ensures that patients who cancel appointments are required to rebook before proceeding with further actions. Similarly, check constraints validate data entries, such as ensuring that appointment statuses are restricted to predefined values. These mechanisms help to maintain adherence to hospital policies, improve workflow efficiency, and enhance the overall patient experience by minimizing the likelihood of procedural errors.

  In summary, the design choices made for the database are grounded in principles that prioritize efficiency, integrity, scalability, and adherence to business rules. By separating concerns, ensuring data consistency, and incorporating mechanisms for enforcing operational policies, the database not only meets the current needs of the hospital but is also poised to adapt to future challenges This thoughtful approach to database design supports the overarching goal of delivering high-quality patient care while facilitating smooth operations within the hospital.

  Furthermore, this structure will enable the Hospital to manage its operations effectively and improve the quality of patient care
  The designed database system for Splendor Infirmary is robust, scalable, and maintains data integrity while providing necessary functionalities for managing hospital operations effectively. 
_________________________________________________________
**Amin Adam** for **Splendor Analytics** Consultancy Team


