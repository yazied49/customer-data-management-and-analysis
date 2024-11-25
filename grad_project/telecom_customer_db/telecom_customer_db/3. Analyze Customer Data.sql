-- ����� ������ �������

-- ���� ����� ���� �����
SELECT AVG(TRY_CAST([Satisfaction Score] AS decimal)) AS Average_Satisfaction 
FROM dbo.customer_inter;

-- ����� ������� ��� CLTV
SELECT 
    CASE 
        WHEN TRY_CAST(CLTV AS decimal) < 100 THEN 'Low CLTV'
        WHEN TRY_CAST(CLTV AS decimal) BETWEEN 100 AND 500 THEN 'Medium CLTV'
        ELSE 'High CLTV'
    END AS CLTV_Category, 
    COUNT(Customer_ID) AS Customer_Count
FROM dbo.customer_inter 
GROUP BY 
    CASE 
        WHEN TRY_CAST(CLTV AS decimal) < 100 THEN 'Low CLTV'
        WHEN TRY_CAST(CLTV AS decimal) BETWEEN 100 AND 500 THEN 'Medium CLTV'
        ELSE 'High CLTV'
    END;


-- ������ ��� ���� 10 ����� ��� CLTV
SELECT Customer_ID, TRY_CAST(CLTV AS decimal) AS CLTV 
FROM dbo.customer_inter 
ORDER BY CLTV DESC 
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;  -- ������ ��� ���� 10 ��� CLTV

-- ���� ����� Monthly Charge ������� ���������
SELECT AVG(TRY_CAST([Monthly Charge] AS decimal)) AS Avg_Monthly_Charge, 
       SUM(TRY_CAST([Total Revenue] AS decimal)) AS Total_Revenue 
FROM dbo.customer_trans;

-- ���� ��� ������� ����� ������ ������
SELECT COUNT(Customer_ID) AS Total_Customers, 
       SUM(TRY_CAST([Number of Referrals] AS int)) AS Total_Referrals 
FROM dbo.customer_trans  
WHERE [Referred a Friend] = 'Yes';

-- ��� ������� ��� �����
SELECT [Quarter], COUNT(Customer_ID) AS Customer_Count 
FROM dbo.customer_trans 
GROUP BY [Quarter] 
ORDER BY [Quarter];

-- ���� ����� �����
SELECT AVG(TRY_CAST([Age] AS int)) AS Average_Age 
FROM dbo.telco_customer_data;

-- ��� ������� ��� �����
SELECT [Gender], COUNT(Customer_ID) AS Count_By_Gender 
FROM dbo.telco_customer_data 
GROUP BY [Gender];

-- ������ ��� ������� ��� ������ ����������
SELECT 
    tcd.[Married], 
    COUNT(tcd.Customer_ID) AS Total_Customers, 
    AVG(TRY_CAST(ci.[Satisfaction Score] AS decimal)) AS Avg_Satisfaction
FROM dbo.customer_inter ci
JOIN dbo.telco_customer_data tcd ON ci.Customer_ID = tcd.Customer_ID
GROUP BY tcd.[Married];
-- ����� ���� ����� ��� ������ �������
SELECT 
    CASE 
        WHEN tcd.[Age] < 30 THEN 'Under 30'
        WHEN tcd.[Age] BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Over 50'
    END AS Age_Group, 
    AVG(TRY_CAST(ci.[Satisfaction Score] AS decimal)) AS Avg_Satisfaction
FROM dbo.telco_customer_data tcd
JOIN dbo.customer_inter ci ON tcd.Customer_ID = ci.Customer_ID
GROUP BY 
    CASE 
        WHEN tcd.[Age] < 30 THEN 'Under 30'
        WHEN tcd.[Age] BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Over 50'
    END;
--���� ���� ������� ����� ������ �� ������� ������ ����� ��� ���� ������ �� ���� customer_inter
SELECT 
    COUNT(Customer_ID) * 100.0 / (SELECT COUNT(*) FROM dbo.customer_inter) AS Churn_Percentage
FROM dbo.customer_inter
WHERE [Customer Status] = 'Churned';
--����� ������� ������� ��� ������ �������:
SELECT 
    CASE 
        WHEN tcd.[Age] < 30 THEN 'Under 30'
        WHEN tcd.[Age] BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Over 50'
    END AS Age_Group,
    SUM(TRY_CAST(ct.[Total Revenue] AS decimal)) AS Total_Revenue
FROM dbo.telco_customer_data tcd
JOIN dbo.customer_trans ct ON tcd.Customer_ID = ct.Customer_ID
GROUP BY 
    CASE 
        WHEN tcd.[Age] < 30 THEN 'Under 30'
        WHEN tcd.[Age] BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Over 50'
    END;
--����� ������ ������� ����� �������:
SELECT 
    [Contract], 
    AVG(TRY_CAST([Monthly Charge] AS decimal)) AS Avg_Monthly_Charge, 
    SUM(TRY_CAST([Total Revenue] AS decimal)) AS Total_Revenue, 
    COUNT(Customer_ID) AS Total_Customers
FROM dbo.customer_trans
GROUP BY [Contract];
--����� ������� ����� �������� �������� ����� ����� �� ���������:
SELECT 
    CASE 
        WHEN [Internet Service] = 1 THEN 'With Internet'
        ELSE 'No Internet'
    END AS Internet_Status,
    AVG(TRY_CAST([Monthly Charge] AS decimal)) AS Avg_Monthly_Charge, 
    SUM(TRY_CAST([Total Revenue] AS decimal)) AS Total_Revenue, 
    COUNT(Customer_ID) AS Total_Customers
FROM dbo.customer_trans
GROUP BY 
    CASE 
        WHEN [Internet Service] = 1 THEN 'With Internet'
        ELSE 'No Internet'
    END;
