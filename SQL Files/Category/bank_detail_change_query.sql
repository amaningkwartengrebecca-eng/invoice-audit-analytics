use fa_portfolio;

describe invoice_data;
describe supplier_register;



SELECT     
    sup.supplier_name,
    inv.invoice_number,
    inv.payment_date,
    sup.bank_detail_change_date
FROM supplier_register sup
JOIN invoice_data inv ON sup.supplier_id = inv.supplier_id
WHERE inv.payment_date > sup.bank_detail_change_date;
