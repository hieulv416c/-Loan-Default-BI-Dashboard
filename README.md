
 # Loan Default Prediction & BI Analytics
## Project Overview

This project focuses on analyzing and predicting loan default risk using Business Intelligence (BI) and Machine Learning techniques. The system integrates data preprocessing, data warehousing, 
predictive analytics, and interactive dashboards to help financial institutions identify high-risk borrowers and improve lending decisions.

## Business Problem
Financial institutions often struggle with:
- Inefficient manual credit evaluation
- Lack of predictive analytics
- Increasing default risk
- Fragmented borrower data
- Difficulty identifying high-risk customers early
This project aims to:
- Predict loan default probability
- Identify high-risk borrowers
- Improve credit risk management
- Support data-driven lending decisions
## Dataset Information
The dataset contains 256000 historical loan records from 2013–2018.
| Feature        | Description                                    |
| -------------- | ---------------------------------------------- |
| Age            | Borrower age                                   |
| Income         | Annual income                                  |
| LoanAmount     | Total loan amount                              |
| CreditScore    | Creditworthiness score                         |
| InterestRate   | Loan interest rate                             |
| DTIRatio       | Debt-to-Income ratio                           |
| EmploymentType | Employment status                              |
| Education      | Education level                                |
| MaritalStatus  | Marital status                                 |
| LoanPurpose    | Purpose of loan                                |
| Default        | Target variable (1 = Default, 0 = Non-default) |

## Technologies Used
Python, PowerBI, Github

## Project Workflow
Raw Dataset
    ↓
Data Cleaning & Preprocessing
    ↓
Feature Engineering
    ↓
Data Warehouse Construction (Star Schema)
    ↓
Power BI Dashboard Development
    ↓
Machine Learning Model Training
    ↓
Loan Default Prediction

## Data Modeling
<img width="833" height="674" alt="image" src="https://github.com/user-attachments/assets/6bef4937-77bb-4035-a9ef-cdc9acbe0005" />

The data is stored in 1 fact table and 8 dimension tables.

## Data Visulization
<img width="1422" height="778" alt="image" src="https://github.com/user-attachments/assets/e86588e5-c61b-462e-b40c-b3c51304c86e" />

The first dashboard serves as the introduction and navigation page of the entire Loan Report system. Rather than focusing on analytical insights, this page establishes the project’s context, objectives, and analytical direction. It acts as the starting point that introduces users to the purpose of the study and provides a high-level understanding of the analytical framework before moving into detailed dashboards.
