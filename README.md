
 # Loan Default Prediction & BI Analytics
## Project Overview

This project focuses on analyzing and predicting loan default risk using Business Intelligence (BI) and Machine Learning techniques. The system integrates data preprocessing, data warehousing, 
predictive analytics, and interactive dashboards to help financial institutions identify high-risk borrowers and improve lending decisions.
## 🛠 Tech Stack

![SQL](https://img.shields.io/badge/SQL-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-Data_Analysis_Expressions-orange?style=for-the-badge)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

- **SQL:** Thực hiện EDA, kiểm tra logic dữ liệu và tối ưu hóa truy vấn đầu vào.
- **Power BI:** Xây dựng mô hình dữ liệu (Star Schema) và thiết kế Dashboard.
- **DAX:** Xử lý các phép tính Measure và Calculated Column chuyên sâu.
- **Python:** Tiền xử lý dữ liệu (ETL) và phân tích thống kê nâng cao.
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
Raw Dataset -> Data Cleaning & Preprocessing -> EDA ->  Feature Engineering -> Data Warehouse Construction (Star Schema) -> Power BI Dashboard Development -> Machine Learning Model Training -> Loan Default Prediction

## Data Modeling
<img width="833" height="674" alt="image" src="https://github.com/user-attachments/assets/6bef4937-77bb-4035-a9ef-cdc9acbe0005" />

The data is stored in 1 fact table and 8 dimension tables.

### Data Cleaning & Preprocessing
Xử lý Missing -> Xử lý Duplicate & Data Consistency -> Datetime Standardization -> Data Quality Check -> Xem và xử lý Outlier 

### EDA 
Sử dụng SQl để EDA dữ liệu và phân tích.

## Data Visulization
### Master Data Page
<img width="1422" height="778" alt="image" src="https://github.com/user-attachments/assets/e86588e5-c61b-462e-b40c-b3c51304c86e" />

The first dashboard serves as the introduction and navigation page of the entire Loan Report system. Rather than focusing on analytical insights, this page establishes the project’s context, objectives, and analytical direction. It acts as the starting point that introduces users to the purpose of the study and provides a high-level understanding of the analytical framework before moving into detailed dashboards.
## Overview Page
<img width="1413" height="794" alt="image" src="https://github.com/user-attachments/assets/4f3a020d-dac4-49e7-a593-1faac2802ec3" />

The combination of these KPIs reveals an important business narrative. Although the organization manages a very large loan portfolio with more than 255,000 loans, the average loan size remains relatively moderate. This suggests a diversification strategy focused on distributing risk across a broad customer base rather than concentrating capital in a few high-value borrowers.

The average interest rate of approximately 13% is relatively high, implying that the institution may be targeting medium-to-high-risk borrowers in exchange for stronger profit margins. However, this aggressive lending strategy is accompanied by a default rate of around 12%, meaning roughly 1 out of every 9 loans experiences repayment difficulties. From a risk-management perspective, this indicates a business model that balances growth and profitability against elevated credit exposure.

💭 Because of the high risk, interest rates may be raised in a calculated manner to compensate for the risk.
💭 Improve the credit scoring system and prediction system to avoid default situations.
#### Age Group Distribution
The Age Group donut chart shows that borrowers are heavily concentrated in the (77%)
19–39 age group
40–59 age group
This pattern is strategically reasonable because these age ranges represent economically active individuals with stable income streams and stronger borrowing demand for housing, business, education, and consumption purposes
Despite the low number of senior citizens: This could be an untapped niche market.
💭Continue to prioritize campaigns targeting employed individuals (ex: home loan for 30–45, education loan for young adults, business expansion loan for middle-age borrowers)
💭Continue to maintain conservative policies for both teenagers and senior citizens, yêu cầu stricter approval conditions (co-signer, lower loan limit, higher collateral requirement). 
#### Loan Purpose Analysis
The “Total Loan Amount by Purpose” chart reveals that the portfolio is distributed relatively evenly across:
Business, Home, Education, Auto, Other
No single category dominates the portfolio, with each purpose contributing approximately 20% of the total loan value.
This balanced structure indicates strong portfolio diversification, which is generally considered a positive signal in credit-risk management. By spreading exposure across multiple lending categories, the institution reduces dependency on a single economic sector and minimizes concentration risk.
💭A more detailed analysis is needed to make a decision.
#### Loan Term Analysis
The “Total Loan Amount by Loan Term” chart shows that medium-term loans (2–4 years) dominate the portfolio with approximately 19.6bn in loan value, significantly exceeding both short-term and long-term loans.
This pattern reflects a relatively balanced lending strategy:
- Short-term loans typically offer lower risk but smaller returns
- Long-term loans increase uncertainty and repayment risk
- Medium-term loans provide a compromise between profitability and risk control
The dominance of medium-term loans suggests that the institution prioritizes sustainable portfolio growth while maintaining manageable liquidity and default exposure.
#### Trend Analysis
After declining in 2014, lending activity gradually recovered and reached its highest level in 2018. Despite short-term fluctuations, the long-term trend remains relatively stable.
#### YOY Loan Amount Change
2014 and 2017 experienced negative growth
2015 and 2018 showed strong recovery
The strongest growth occurred in 2018
#### YOY Default Rate Change
The dashboard reveals a noticeable relationship between credit expansion and default risk:
During periods of lending growth, default rates also tend to increase
During tighter lending periods, default rates decline
This reflects a common phenomenon in financial institutions: aggressive loan expansion often increases exposure to higher-risk borrowers.
## Loan Amount Page
<img width="1406" height="774" alt="image" src="https://github.com/user-attachments/assets/375cdf50-06c0-439f-9f09-9785cd03acdc" />

The total loan amount is distributed very evenly among the groups: Unemployed, Part-time, Self-employed, and Full-time (each group ranging around 1.35 billion - 1.37 billion). This shows that the business is not overly dependent on any particular group.

#### The Relationship Between Income and Employment
The majority of total loans (4 billion out of 5 billion) come from the High Income group.
Within this High Income group, cash flow is evenly distributed among full-time, part-time, and self-employed individuals. This confirms that income is more important than employment type in determining loan limits.
#### Loan by level
The loan amounts are roughly the same across different educational levels (Bachelor's, PhD, Master's, High School) (all around 1.4 billion).
#### Decision
💭 Focus on the "High Income" group: Since this is the main source of revenue (80% of total value), personalized product packages (Premium services) are needed to retain this group.
💭 Explore the Middle Age group: This group has financial stability. It is necessary to promote Home and Business loan packages for this demographic.
💭 Adjust loan objectives: Intensify marketing for the Education and Auto segments with promotional programs, as these two segments currently have the lowest valuations in the portfolio.
💭 Businesses should implement broad marketing campaigns instead of focusing solely on the higher education group.

### Default Rate Page
<img width="1401" height="792" alt="image" src="https://github.com/user-attachments/assets/776181ce-3a54-4539-8aa6-5ab6cad6699b" />

The non-performing loan ratio peaked in 2016 ($11.75%) and showed signs of rising again in 2018 ($11.60%). This signals a return to a risk cycle. The 11.61% level reflects a real risk that needs to be closely monitored.
#### Age and Income
Age and Income (Inverse Correlation)
Teenagers (0-18): Have an astonishingly high rate of bad debt (22.14%). This is the riskiest group.
Low Income: Have the highest rate of bad debt (17.38%).
Insight: Young people with low incomes are the segment that causes the biggest losses for businesses.
#### Employee and Education
Unemployed individuals: The bad debt rate is as high as 13.55%.
High school graduates: Have the highest bad debt rate among the education group (12.88%). The higher the educational level (PhD, Master's), the lower the bad debt rate.
#### Purpose of borrowing:
Business loans: Have the highest bad debt rate (12.33%).
Home loans: Are the safest type of loan (10.23%).
#### Decision
💭 Stop granting unsecured personal loans to teenagers. Only lend with a guarantor (Senior Citizens) or extremely secure collateral.
💭 Scale up the home loan group with the lowest default rate ($10.23%) and large market potential.
💭 Maintain current policies but may slightly reduce interest rates to compete with high-income groups.
💭 Tighten the business plan appraisal process. Increase the risk premium for business loans to offset the $12.33% non-performing loan ratio.
### Details Page
<img width="1408" height="790" alt="image" src="https://github.com/user-attachments/assets/68b63b1b-e248-4187-9a0b-582eb7f7177c" />

#### Credit Score
- Very Low Credit Score: The non-performing loan ratio is as high as 15.55%.
- High Credit Score: Even in the best group, the non-performing loan ratio is still at 12.22%.
- Insight: Even customers with a "High" credit score in your system still have a higher-than-average non-performing loan ratio. This demonstrates that the current scoring criteria are too lax or no longer accurately reflect market realities.
#### DtiRatio
- At a DTI of approximately 0.1, the non-performing loan ratio is 10.37%. When the DTI approaches 0.8-1.0, the non-performing loan ratio jumps to 16.65%. <br>
Insight: Customers are carrying too much debt relative to their income. Those with a DTI > 0.5 are pushing the company's non-performing loan ratio to alarming levels.
#### The Role of Mortgage and Co-Signer: 
- Co-Signer: Having a guarantor helped reduce the non-performing loan (NPL) rate from $15.06% to 12.05%. Mortgage: Having collateral helped reduce it from $14.26% to 12.84%. <br>
Insight: These security measures are effective but not strong enough to bring NPLs to a safe level.
#### Decision
💭 Imposing a strict $DTI cap. Rejecting or requiring extremely high collateral for any loan with a $DtiRatio > 0.4$. Data shows that above this level, the probability of default skyrockets.

### Conclusion
1. Regarding Products & Segments
- Prioritize Home Loans:
- Expand the scale as this is the safest segment (lowest bad debt).
- Tighten Business Loans: Increase risk fees and conduct thorough due to high bad debt ($12.33%).
- Focus on High-Income Groups: Retain them with Premium packages as they contribute $80% of the value but have the least bad debt.
2. Regarding Risk Management (Urgent)
- Stop Teen Loans (0-18): Only approve loans with a guarantor or strong collateral (bad debt in this group has jumped to $22%).
- Establish a DTI ceiling: Reject loans with a debt-to-income ratio ($DTI > 0.4).
- Tighten Credit Score: Redefine the "High Score" standard as the current bad debt level ($12.22%) is still too high for safety.
3. Regarding Operations:
- Mandatory Co-signer: Applicable to young, unemployed, or low-income groups to reduce bad debt from $15% to $12%.
- Interest Rate Balancing: Adjust interest rates to adequately compensate for the $13% bad debt level.
- Mass Marketing: No discrimination based on educational background is required as loan values ​​are equivalent.

## Prediction
After the data processing and cleaning process: Data cleaning -> Feature engineering
We use 3 ML models: Logistic Regression, Random Forest, Gradient Boosting Classifier (GBM) to predict high risk loans
Models evaluated by precision, recall, f1-score, support
-> GBM is the best predictive model
Therefore, we decided to use GBM to predict lending risk.
<img width="520" height="415" alt="image" src="https://github.com/user-attachments/assets/f99e629a-94ec-4d64-ad4c-be759ee57faf" />
