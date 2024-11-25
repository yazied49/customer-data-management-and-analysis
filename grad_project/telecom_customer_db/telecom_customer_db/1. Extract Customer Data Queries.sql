-- 1. ������� ������ ������� �� customer_inter
-- ������� �������� �� ��������
SELECT * 
FROM dbo.customer_inter;

-- ������� �������� ������ �����
SELECT 
    Customer_ID, 
    [Satisfaction Score], 
    [Churn Label], 
    CLTV, 
    [Customer Status]  
FROM dbo.customer_inter;

-- ������� ������� ����� ����� ���� ��� ���� �� 3
SELECT * 
FROM dbo.customer_inter 
WHERE [Satisfaction Score] > 3;  -- �� ���� ��������

-- ������� ������� ����� �� ������� �� 'Churned'
SELECT * 
FROM dbo.customer_inter 
WHERE [Customer Status] = 'Churned';  -- ������ ��

-- ������� ����� ��� ������� ��� ��� ��� Churn
SELECT 
    [Churn Category], 
    COUNT(Customer_ID) AS Customer_Count 
FROM dbo.customer_inter 
GROUP BY [Churn Category] 
ORDER BY Customer_Count DESC;

-- 2. ������� ������ ������� �� telco_customer_data
-- ������� �������� �� ��������
SELECT * 
FROM dbo.telco_customer_data;

-- ������� ������ ������� �������� ��� 18 � 65 ���
SELECT  
    Customer_ID, 
    [Count], 
    [Gender], 
    [Age], 
    [Under 30], 
    [Senior Citizen], 
    [Married], 
    [Dependents], 
    [Number of Dependents], 
    [Country], 
    [State],  
    [City], 
    [Zip Code] 
FROM dbo.telco_customer_data 
WHERE [Age] >= 18 AND [Age] <= 65;  -- ���� ������ ������� ��������

-- ������� ����� ��� ������� ��� �����
SELECT 
    [Gender], 
    COUNT(Customer_ID) AS Count_By_Gender 
FROM dbo.telco_customer_data 
GROUP BY [Gender];

-- ������� ����� ����� �����
SELECT 
    AVG(TRY_CAST([Age] AS int)) AS Average_Age 
FROM dbo.telco_customer_data;

-- ������� ����� ��� ������� ��� ������ ����������
SELECT 
    [Married], 
    COUNT(Customer_ID) AS Total_Customers 
FROM dbo.telco_customer_data 
GROUP BY [Married]; 

-- 3. ������� ������ ������� �� customer_trans
-- ������� �������� �� ��������
SELECT * 
FROM dbo.customer_trans;

-- ������� �������� ������ ����� �� ������
SELECT 
    Customer_ID, 
    [Monthly Charge], 
    [Total Revenue], 
    [Contract] 
FROM dbo.customer_trans;

-- ������� ����� ����� Monthly Charge ������� ���������
SELECT 
    AVG(TRY_CAST([Monthly Charge] AS decimal)) AS Avg_Monthly_Charge, 
    SUM(TRY_CAST([Total Revenue] AS decimal)) AS Total_Revenue 
FROM dbo.customer_trans;

-- ������� ����� ��� ������� ����� ������ ������
SELECT 
    COUNT(Customer_ID) AS Total_Customers, 
    SUM(TRY_CAST([Number of Referrals] AS int)) AS Total_Referrals 
FROM dbo.customer_trans  
WHERE [Referred a Friend] = '1';

-- ������� ���� ������� ��� �����
SELECT 
    [Quarter], 
    COUNT(Customer_ID) AS Customer_Count 
FROM dbo.customer_trans 
GROUP BY [Quarter] 
ORDER BY [Quarter];
