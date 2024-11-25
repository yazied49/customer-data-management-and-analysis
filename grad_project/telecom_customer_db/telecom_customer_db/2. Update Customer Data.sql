-- ÊÍÏíË ÈíÇäÇÊ ÇáÚãáÇÁ
UPDATE dbo.customer_inter 
SET [Customer Status] = 'Churned'  
WHERE [Churn Label] = 'Yes';  

UPDATE dbo.customer_inter 
SET CLTV = '500.00'  -- ÊÚííä Åáì ŞíãÉ CLTV ÇáÌÏíÏÉ ßäÕ 
WHERE Customer_ID = '1';  -- ÇÓÊÎÏã Customer_ID ßäÕ

UPDATE dbo.customer_inter 
SET [Satisfaction Score] = '5'  -- ÊÚííä Åáì ÇáÏÑÌÉ ÇáÌÏíÏÉ ßäÕ 
WHERE Customer_ID = '2';  -- ÇÓÊÎÏã Customer_ID ßäÕ 

UPDATE dbo.telco_customer_data  
SET [Married] = 'Yes',  
    [Number of Dependents] = [Number of Dependents] + 1  
WHERE [Customer_ID] IN (
    SELECT Customer_ID 
    FROM dbo.telco_customer_data 
    WHERE [Gender] = 'Female' AND [Age] < 30
);
-- ÊÍÏíË ŞíãÉ Monthly Charge İí customer_trans áÚãáÇÁ áÏíåã ÚŞÏ ÔåÑí
UPDATE dbo.customer_trans 
SET [Monthly Charge] = TRY_CAST([Monthly Charge] AS decimal) * 1.1  -- ÒíÇÏÉ ÈäÓÈÉ 10%
WHERE [Contract] = 'Month-to-Month';  -- ÔÑØ ÇáÊÍÏíË

-- ÊÍÏíË ÅÌãÇáí ÇáÅíÑÇÏÇÊ ÈäÇÁğ Úáì ÇáÔÑæØ ÇáãÍÏÏÉ
UPDATE dbo.customer_trans 
SET [Total Revenue] = TRY_CAST([Total Revenue] AS decimal) + 100  -- ÒíÇÏÉ ÈãŞÏÇÑ 100
WHERE [Customer_ID] IN (
    SELECT Customer_ID 
    FROM dbo.customer_inter 
    WHERE [Customer Status] = 'Churned'
);

-- ÊÍŞŞ ãä ÊÃËíÑ ÇáÊÍÏíË
SELECT COUNT(*) FROM dbo.customer_inter WHERE [Customer Status] = 'Churned';
