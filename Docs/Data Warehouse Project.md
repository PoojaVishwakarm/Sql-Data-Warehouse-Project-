## Data Warehouse Project

1.	Requirement Analysis
    - Analyse & Understand the Requirements
    
2.	Design Data Architecture
    - Choose Data Management Approach
    - Brainstorm & Design the Layers
    - Draw the Data Architecture
      
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


-SEPARATION OF CONCERNS
![6-removebg-preview](https://github.com/user-attachments/assets/b3bdfaf3-0e7c-467b-9229-600a573ab70f)

![soc-removebg-preview](https://github.com/user-attachments/assets/882cea2b-d667-437a-95bb-781c06951e13)


