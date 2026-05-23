--Câu 1: Tính tỷ lệ nợ xấu (Default Rate) theo từng nhóm trình độ học vấn (Education).
SELECT 
    e.Education,
    COUNT(f.LoanID) AS Total_Loans,
    SUM(CAST(f.[Default] AS INT)) AS Total_Defaults, 
    ROUND(CAST(SUM(CAST(f.[Default] AS INT)) AS FLOAT) / COUNT(f.LoanID) * 100, 2) AS Default_Rate_Percentage
FROM FactLoan f
JOIN DimEducation e ON f.EducationKey = e.EducationKey
GROUP BY e.Education
ORDER BY Default_Rate_Percentage DESC;
--Câu 2: Tìm điểm tín dụng (CreditScore) trung bình của những khách hàng bị nợ xấu so với những khách hàng thanh toán đầy đủ.
SELECT 
    CASE WHEN [Default] = 1 THEN 'Nợ xấu (Default)' ELSE 'Thanh toán đủ (Non-Default)' END AS Loan_Status,
    AVG(CreditScore) AS Average_CreditScore,
    COUNT(*) AS Number_of_Customers
FROM FactLoan
GROUP BY [Default];
--Câu 3: Nhóm khách hàng theo CreditScoreBins và tính tỷ lệ nợ xấu cho từng nhóm để xem bảng xếp hạng rủi ro.
SELECT 
    CreditScoreBins,
    COUNT(LoanID) AS Total_Loans,
    ROUND(AVG(CAST([Default] AS FLOAT)) * 100, 2) AS Risk_Probability_Percentage
FROM FactLoan
GROUP BY CreditScoreBins
ORDER BY Risk_Probability_Percentage DESC;
--Câu 4: Thống kê số lượng khoản vay và tổng số tiền vay (LoanAmount) theo tình trạng hôn nhân (MaritalStatus).
SELECT 
    m.MaritalStatus,
    COUNT(f.LoanID) AS Number_of_Loans,
    SUM(f.LoanAmount) AS Total_Disbursed_Amount,
    AVG(f.LoanAmount) AS Average_Loan_Value
FROM FactLoan f
JOIN DimMaritalStatus m ON f.MaritalStatusKey = m.MaritalStatusKey
GROUP BY m.MaritalStatus
ORDER BY Total_Disbursed_Amount DESC;
--Câu 5: Độ tuổi trung bình của khách hàng đi vay theo từng mục đích vay (LoanPurpose) là bao nhiêu?
SELECT 
    m.MaritalStatus,
    COUNT(f.LoanID) AS Number_of_Loans,
    SUM(f.LoanAmount) AS Total_Disbursed_Amount,
    AVG(f.LoanAmount) AS Average_Loan_Value
FROM FactLoan f
JOIN DimMaritalStatus m ON f.MaritalStatusKey = m.MaritalStatusKey
GROUP BY m.MaritalStatus
ORDER BY Total_Disbursed_Amount DESC;
--Câu 6: Những khách hàng có người bảo lãnh (HasCoSigner) thường có số tiền vay cao hơn hay thấp hơn so với người vay đơn lẻ?
SELECT 
    c.HasCoSigner,
    AVG(f.LoanAmount) AS Average_Loan_Amount,
    COUNT(f.LoanID) AS Total_Loans
FROM FactLoan f
JOIN DimHasCoSigner c ON f.HasCoSignerKey = c.HasCoSignerKey
GROUP BY c.HasCoSigner;
--Câu 7: Tính tổng dư nợ vay (LoanAmount) theo từng Quý trong năm.
SELECT 
    t.[Year],
    t.[Quarter],
    SUM(f.LoanAmount) AS Total_Loan_Amount
FROM FactLoan f
JOIN DimDate t ON f.DateKey = t.DateKey
GROUP BY t.[Year], t.[Quarter]
ORDER BY t.[Year], t.[Quarter];
--Câu 8: So sánh số lượng đơn đăng ký vay giữa Ngày trong tuần và Cuối tuần (Is_Weekend).
-- Tạo cột Is_Weekend
ALTER TABLE DimDate
ADD Day_Of_Week NVARCHAR(15), -- Lưu tên thứ (Monday, Tuesday...) hoặc dùng tinyint nếu lưu số (1-7)
    Is_Weekend TINYINT;

update DimDate
set Day_Of_Week = DATENAME(WEEKDAY, FullDate);
update DimDate
Set Is_Weekend = case when Day_Of_Week in ('Saturday', 'Sunday') then 1 Else 0 end;
-- Query
SELECT 
    t.Is_Weekend,
    CASE WHEN t.Is_Weekend = 1 THEN 'Cuối tuần' ELSE 'Ngày trong tuần' END AS Day_Type,
    COUNT(f.LoanID) AS Number_of_Applications
FROM FactLoan f
JOIN DimDate t ON f.DateKey = t.DateKey
GROUP BY t.Is_Weekend;
--Câu 9: Xu hướng thay đổi lãi suất (InterestRate) trung bình qua các tháng.
SELECT 
    t.[Year],
    t.Month,
    AVG(f.InterestRate) AS Average_Interest_Rate
FROM FactLoan f
JOIN DimDate t ON f.DateKey = t.DateKey
GROUP BY t.[Year], t.[Month]
ORDER BY t.[Year], t.[Month];
--Câu 10: Liệt kê Top 10 khách hàng có chỉ số nợ trên thu nhập (DTIRatio) cao nhất nhưng chưa bị nợ xấu (Default = 0).
SELECT TOP 10
    LoanID,
    DTIRatio,
    Income,
    LoanAmount
FROM FactLoan
WHERE [Default] = 0  -- Chưa bị nợ xấu
ORDER BY DTIRatio DESC;
--Câu 11: Tính mối tương quan giữa số tháng làm việc (MonthsEmployed) và số tiền vay tối đa mà khách hàng được duyệt.
SELECT 
    MonthsEmployed,
    AVG(LoanAmount) AS Avg_Loan_Amount,
    MAX(LoanAmount) AS Max_Loan_Amount,
    COUNT(LoanID) AS Customer_Count
FROM FactLoan
GROUP BY MonthsEmployed
ORDER BY MonthsEmployed;
--Câu 12: Tìm những khách hàng có từ 5 dòng tín dụng trở lên (NumCreditLines >= 5) và đang có khoản vay thế chấp nhà (HasMortgage).
SELECT 
    f.LoanID,
    f.NumCreditLines,
    m.HasMortgage,
    f.CreditScore
FROM FactLoan f
JOIN DimHasMortgage m ON f.HasMortgageKey = m.HasMortgageKey
WHERE f.NumCreditLines >= 5 
  AND m.HasMortgage = 'Yes';