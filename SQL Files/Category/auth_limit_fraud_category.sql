USE fa_portfolio;

describe employee_limits;

SELECT 
    invoice_number,
    supplier_name,
    amount_gbp,
    approved_by,
    employee_name,
    approval_limit_gbp,
    (amount_gbp - approval_limit_gbp) AS breach_amount
FROM invoice_data 
JOIN employee_limits  ON approved_by = employee_id
WHERE amount_gbp > approval_limit_gbp;

describe invoice_data;
-- During SQL migration, automated querying identified two additional authorisation breaches (INV-0301 and INV-0401, Sarah Collins, Grade 1) not captured in the original Excel analysis, as the manual review only tested invoices exceeding the Grade 2 threshold. This highlights the advantage of systematic SQL querying over manual threshold-based Excel analysis. -- 
