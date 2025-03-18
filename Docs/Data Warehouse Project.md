## Data Warehouse Project

1.	Requirement Analysis
    - Analyse & Understand the Requirements
    
2.	Design Data Architecture
    -  Choose Data Management Approach
    -  Brainstorm & Design the Layers
    -  Draw the Data Architecture
      
3.	Project Initialization
    - Create Detailed Projects Task
    - Define Project Naming Convertions
  	- create GIT Repo & Prepare the Structure
  	-  Create Database & Schemas
  	
4.	Build Bronze Layer
        - Analysing:   source Systems
  	- Coding:      Data Ingestion
  	- Validating:  Data Completeness & Schema Checks
  	- Documents:   Draw Data Flow
  	- Commit code in git repo
  	
5.	Build Silver Layer
    - Analysing:Explore & Understand Data
  	- Coding:Data Cleaning
  	- Validating:Data correctness Checks
  	- Documenting & Versioning in GIT
  	- Commit Code in GIT Repo
     
6.	Build Gold Layer
     - Analysing:Explore Business Objects
   	 - Coding: Data Integration
  	 - Validating: Data Integration Checks
  	 - Document: Draw Data Model of star Schema
  	 - Document: Create Data Catalog

       [Notion] https://www.notion.so/Data-Warehouse-Project-1b8dbf418f1380b9aab2f8ab02e9c6a3?pvs=4
  
============================================================================
=
# 1.Requirement Analysis

## Project Requirements
Building the Data Warehouse (Data Engineering)

 ## Objective:
Develop a modern data warehouse using server to consolidate sales data, enabling analytical reporting  and decision-making.

## Specifications:
- Data sources: Import data from two source system (ERP and CRM) provided as CSV files.
- Data Quality: Cleanse and resolve data quality issues prior to analysis.
- Integration: combine both sources into a single, user- friendly data model designed for analytical queries.
 - Scope: Focus on the latest dataset only.
 - Documentation: Provide clear documentation data model to support both business stakeholders and analytics teams.

## BI: Analytics & Reporting (Data Analysis)

## Objective:
Develop SQL-based analytics to deliver detailed  insights into:
- Customer Behavior
- Products performance
- Sales Trends
 These insights empower stakeholders with key business  metrics, enabling strategic, decision-making.

============================================================================
=
# 2.Design Data Architecture
 ## I.Choose the Right Approach
 
![achi-removebg-preview](https://github.com/user-attachments/assets/8896e94f-a74a-47d7-a508-59c33abcbdbb)

 ### How to build Data Warehouse
 

![data_achitecture_5 2-removebg-preview](https://github.com/user-attachments/assets/481f01ea-618e-429e-b824-98c6d0b4946e)

## II.Brainstorm & Design the Layers
<img width="800" alt="layerspng" src="https://github.com/user-attachments/assets/e4738035-2205-454d-aea6-b41818c39d06" />


- SEPARATION OF CONCERNS

![6-removebg-preview](https://github.com/user-attachments/assets/b3bdfaf3-0e7c-467b-9229-600a573ab70f)

![soc-removebg-preview](https://github.com/user-attachments/assets/882cea2b-d667-437a-95bb-781c06951e13)

## III.Draw the Data Architecture

![data_architecture](https://github.com/user-attachments/assets/57c38719-d8df-4f20-a48a-f575111e456a)

============================================================================
=
# 3.Project Initialization
 ## I. Create Detailed Projects Task
      [Notion] https://www.notion.so/Data-Warehouse-Project-1b8dbf418f1380b9aab2f8ab02e9c6a3?pvs=4
 
## II. Define Project Naming Convertions

# **Naming Conventions**

This document outlines the naming conventions used for schemas, tables, views, columns, and other objects in the data warehouse.

## **Table of Contents**

1. [General Principles](#general-principles)
2. [Table Naming Conventions](#table-naming-conventions)
   - [Bronze Rules](#bronze-rules)
   - [Silver Rules](#silver-rules)
   - [Gold Rules](#gold-rules)
3. [Column Naming Conventions](#column-naming-conventions)
   - [Surrogate Keys](#surrogate-keys)
   - [Technical Columns](#technical-columns)
4. [Stored Procedure](#stored-procedure-naming-conventions)
---

## **General Principles**

- **Naming Conventions**: Use snake_case, with lowercase letters and underscores (`_`) to separate words.
- **Language**: Use English for all names.
- **Avoid Reserved Words**: Do not use SQL reserved words as object names.

## **Table Naming Conventions**

### **Bronze Rules**
- All names must start with the source system name, and table names must match their original names without renaming.
- **`<sourcesystem>_<entity>`**  
  - `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).  
  - `<entity>`: Exact table name from the source system.  
  - Example: `crm_customer_info` → Customer information from the CRM system.

### **Silver Rules**
- All names must start with the source system name, and table names must match their original names without renaming.
- **`<sourcesystem>_<entity>`**  
  - `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).  
  - `<entity>`: Exact table name from the source system.  
  - Example: `crm_customer_info` → Customer information from the CRM system.

### **Gold Rules**
- All names must use meaningful, business-aligned names for tables, starting with the category prefix.
- **`<category>_<entity>`**  
  - `<category>`: Describes the role of the table, such as `dim` (dimension) or `fact` (fact table).  
  - `<entity>`: Descriptive name of the table, aligned with the business domain (e.g., `customers`, `products`, `sales`).  
  - Examples:
    - `dim_customers` → Dimension table for customer data.  
    - `fact_sales` → Fact table containing sales transactions.  

#### **Glossary of Category Patterns**

| Pattern     | Meaning                           | Example(s)                              |
|-------------|-----------------------------------|-----------------------------------------|
| `dim_`      | Dimension table                  | `dim_customer`, `dim_product`           |
| `fact_`     | Fact table                       | `fact_sales`                            |
| `report_`   | Report table                     | `report_customers`, `report_sales_monthly`   |

## **Column Naming Conventions**

### **Surrogate Keys**  
- All primary keys in dimension tables must use the suffix `_key`.
- **`<table_name>_key`**  
  - `<table_name>`: Refers to the name of the table or entity the key belongs to.  
  - `_key`: A suffix indicating that this column is a surrogate key.  
  - Example: `customer_key` → Surrogate key in the `dim_customers` table.
  
### **Technical Columns**
- All technical columns must start with the prefix `dwh_`, followed by a descriptive name indicating the column's purpose.
- **`dwh_<column_name>`**  
  - `dwh`: Prefix exclusively for system-generated metadata.  
  - `<column_name>`: Descriptive name indicating the column's purpose.  
  - Example: `dwh_load_date` → System-generated column used to store the date when the record was loaded.
 
## **Stored Procedure**

- All stored procedures used for loading data must follow the naming pattern:
- **`load_<layer>`**.
  
  - `<layer>`: Represents the layer being loaded, such as `bronze`, `silver`, or `gold`.
  - Example: 
    - `load_bronze` → Stored procedure for loading data into the Bronze layer.
    - `load_silver` → Stored procedure for loading data into the Silver layer.



## III. Create GIT Repo & Prepare the Structure
## VI. Create Database & Schemas


============================================================================
=

# 4.Build Bronze Layer
<img width="638" alt="BROZON" src="https://github.com/user-attachments/assets/4b16d42e-5941-4110-86c6-ba606c976d4b" />
    
## 1. Analysing:   Source Systems

<img width="700" alt="ANALYSISI" src="https://github.com/user-attachments/assets/fd3daad8-dbc7-44da-a8eb-898fec0e7232" />

## 2.Coding:      Data Ingestion   AND    3.Validating:  Data Completeness & Schema Checks
- Creating DDL for tables
- Develop SQL Load Scripts
![bulk1-removebg-preview](https://github.com/user-attachments/assets/dc512dd1-441c-4962-b845-899c17da10dd)
## 4.Documents:   Draw Data Flow
## 5.Commit code in git repo
