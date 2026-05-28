use fa_portfolio;


describe supplier_register;


SELECT
    inv.invoice_number,
    inv.invoice_date,
    sup.supplier_id,
    sup.supplier_name,
    sup.registration_date
FROM invoice_data inv
JOIN supplier_register sup ON inv.supplier_id = sup.supplier_id
WHERE inv.invoice_date = sup.registration_date;




