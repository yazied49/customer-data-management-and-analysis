-- 1. ÇÓÊÎáÇÕ ÈíÇäÇÊ ÇáÚãáÇÁ ãä customer_inter
-- ÇÓÊÚáÇã áÇÓÊÎÑÇÌ ßá ÇáÈíÇäÇÊ
SELECT * 
FROM dbo.customer_inter;

-- ÇÓÊÚáÇã áÇÓÊÎÑÇÌ ÈíÇäÇÊ ãÍÏÏÉ
SELECT 
    Customer_ID, 
    [Satisfaction Score], 
    [Churn Label], 
    CLTV, 
    [Customer Status]  
FROM dbo.customer_inter;

-- ÇÓÊÚáÇã ááÚãáÇÁ ÇáÐíä áÏíåã ÏÑÌÉ ÑÖÇ ÃÚáì ãä 3
SELECT * 
FROM dbo.customer_inter 
WHERE [Satisfaction Score] > 3;  -- Çí Þíãå ÚÇæÒíäåÇ

-- ÇÓÊÚáÇã ááÚãáÇÁ ÇáÐíä Êã ÊÕäíÝåã ßÜ 'Churned'
SELECT * 
FROM dbo.customer_inter 
WHERE [Customer Status] = 'Churned';  -- ááÍÇáå Ïí

-- ÇÓÊÚáÇã áÍÓÇÈ ÚÏÏ ÇáÚãáÇÁ ÍÓÈ ÝÆÉ ÇáÜ Churn
SELECT 
    [Churn Category], 
    COUNT(Customer_ID) AS Customer_Count 
FROM dbo.customer_inter 
GROUP BY [Churn Category] 
ORDER BY Customer_Count DESC;

-- 2. ÇÓÊÎáÇÕ ÈíÇäÇÊ ÇáÚãáÇÁ ãä telco_customer_data
-- ÇÓÊÚáÇã áÇÓÊÎÑÇÌ ßá ÇáÈíÇäÇÊ
SELECT * 
FROM dbo.telco_customer_data;

-- ÇÓÊÚáÇã áÊÕÝíÉ ÇáÚãáÇÁ ÇáÈÇáÛíä Èíä 18 æ 65 ÓäÉ
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
WHERE [Age] >= 18 AND [Age] <= 65;  -- ãËÇá áÊÕÝíÉ ÇáÚãáÇÁ ÇáÈÇáÛíä

-- ÇÓÊÚáÇã áÍÓÇÈ ÚÏÏ ÇáÚãáÇÁ ÍÓÈ ÇáÌäÓ
SELECT 
    [Gender], 
    COUNT(Customer_ID) AS Count_By_Gender 
FROM dbo.telco_customer_data 
GROUP BY [Gender];

-- ÇÓÊÚáÇã áÍÓÇÈ ãÊæÓØ ÇáÚãÑ
SELECT 
    AVG(TRY_CAST([Age] AS int)) AS Average_Age 
FROM dbo.telco_customer_data;

-- ÇÓÊÚáÇã áÍÓÇÈ ÚÏÏ ÇáÚãáÇÁ ÍÓÈ ÇáÍÇáÉ ÇáÇÌÊãÇÚíÉ
SELECT 
    [Married], 
    COUNT(Customer_ID) AS Total_Customers 
FROM dbo.telco_customer_data 
GROUP BY [Married]; 

-- 3. ÇÓÊÎáÇÕ ÈíÇäÇÊ ÇáÚãáÇÁ ãä customer_trans
-- ÇÓÊÚáÇã áÇÓÊÎÑÇÌ ßá ÇáÈíÇäÇÊ
SELECT * 
FROM dbo.customer_trans;

-- ÇÓÊÚáÇã áÇÓÊÎÑÇÌ ÈíÇäÇÊ ãÍÏÏÉ ãÚ ÍÓÇÈÇÊ
SELECT 
    Customer_ID, 
    [Monthly Charge], 
    [Total Revenue], 
    [Contract] 
FROM dbo.customer_trans;

-- ÇÓÊÚáÇã áÍÓÇÈ ãÊæÓØ Monthly Charge æÅÌãÇáí ÇáÅíÑÇÏÇÊ
SELECT 
    AVG(TRY_CAST([Monthly Charge] AS decimal)) AS Avg_Monthly_Charge, 
    SUM(TRY_CAST([Total Revenue] AS decimal)) AS Total_Revenue 
FROM dbo.customer_trans;

-- ÇÓÊÚáÇã áÍÓÇÈ ÚÏÏ ÇáÚãáÇÁ ÇáÐíä ÃÍÇáæÇ ÃÕÏÞÇÁ
SELECT 
    COUNT(Customer_ID) AS Total_Customers, 
    SUM(TRY_CAST([Number of Referrals] AS int)) AS Total_Referrals 
FROM dbo.customer_trans  
WHERE [Referred a Friend] = '1';

-- ÇÓÊÚáÇã áÚÏÏ ÇáÚãáÇÁ ÍÓÈ ÇáÑÈÚ
SELECT 
    [Quarter], 
    COUNT(Customer_ID) AS Customer_Count 
FROM dbo.customer_trans 
GROUP BY [Quarter] 
ORDER BY [Quarter];
