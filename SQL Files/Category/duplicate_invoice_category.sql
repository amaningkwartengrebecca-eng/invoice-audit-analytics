use fa_portfolio;

describe invoice_data;

describe supplier_register;

SELECT
    a.invoice_number AS invoice_1,
    b.invoice_number AS invoice_2,
    a.supplier_name,
    a.works_reference,
    a.amount_gbp AS amount_1,
    b.amount_gbp AS amount_2
FROM invoice_data a
JOIN invoice_data b 
    ON a.supplier_id = b.supplier_id
    AND a.works_reference = b.works_reference
    AND a.invoice_number < b.invoice_number;
