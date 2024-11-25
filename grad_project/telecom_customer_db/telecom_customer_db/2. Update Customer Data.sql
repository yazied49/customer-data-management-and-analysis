-- ����� ������ �������
UPDATE dbo.customer_inter 
SET [Customer Status] = 'Churned'  
WHERE [Churn Label] = 'Yes';  

UPDATE dbo.customer_inter 
SET CLTV = '500.00'  -- ����� ��� ���� CLTV ������� ��� 
WHERE Customer_ID = '1';  -- ������ Customer_ID ���

UPDATE dbo.customer_inter 
SET [Satisfaction Score] = '5'  -- ����� ��� ������ ������� ��� 
WHERE Customer_ID = '2';  -- ������ Customer_ID ��� 

UPDATE dbo.telco_customer_data  
SET [Married] = 'Yes',  
    [Number of Dependents] = [Number of Dependents] + 1  
WHERE [Customer_ID] IN (
    SELECT Customer_ID 
    FROM dbo.telco_customer_data 
    WHERE [Gender] = 'Female' AND [Age] < 30
);
-- ����� ���� Monthly Charge �� customer_trans ������ ����� ��� ����
UPDATE dbo.customer_trans 
SET [Monthly Charge] = TRY_CAST([Monthly Charge] AS decimal) * 1.1  -- ����� ����� 10%
WHERE [Contract] = 'Month-to-Month';  -- ��� �������

-- ����� ������ ��������� ����� ��� ������ �������
UPDATE dbo.customer_trans 
SET [Total Revenue] = TRY_CAST([Total Revenue] AS decimal) + 100  -- ����� ������ 100
WHERE [Customer_ID] IN (
    SELECT Customer_ID 
    FROM dbo.customer_inter 
    WHERE [Customer Status] = 'Churned'
);

-- ���� �� ����� �������
SELECT COUNT(*) FROM dbo.customer_inter WHERE [Customer Status] = 'Churned';
