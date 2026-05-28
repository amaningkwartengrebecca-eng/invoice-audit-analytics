USE fa_portfolio;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- TABLE 1: EMPLOYEE LIMITS
-- ============================================================

DROP TABLE IF EXISTS `employee_limits`;
CREATE TABLE `employee_limits` (
    `employee_id`       VARCHAR(10)     NOT NULL,
    `employee_name`     VARCHAR(100)    NOT NULL,
    `department`        VARCHAR(100)    NOT NULL,
    `grade`             VARCHAR(20)     NOT NULL,
    `approval_limit_gbp` DECIMAL(10,2)  NOT NULL,
    PRIMARY KEY (`employee_id`)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO `employee_limits` (`employee_id`, `employee_name`, `department`, `grade`, `approval_limit_gbp`) VALUES
('E-001', 'Sarah Collins',  'Procurement', 'Grade 1', 5000.00),
('E-002', 'Marcus Webb',    'Procurement', 'Grade 2', 10000.00),
('E-003', 'Priya Sharma',   'Procurement', 'Grade 2', 10000.00),
('E-004', 'Daniel Okafor', 'Procurement', 'Grade 2', 10000.00),
('E-005', 'Lisa Thornton',  'Procurement', 'Grade 3', 25000.00),
('E-006', 'James Calloway', 'Procurement', 'Grade 3', 25000.00);


-- ============================================================
-- TABLE 2: SUPPLIER REGISTER
-- ============================================================

DROP TABLE IF EXISTS `supplier_register`;
CREATE TABLE `supplier_register` (
    `supplier_id`               VARCHAR(10)     NOT NULL,
    `supplier_name`             VARCHAR(100)    NOT NULL,
    `registration_date`         DATE            NOT NULL,
    `bank_detail_change_date`   DATE            NULL,
    `contact_name`              VARCHAR(100)    NOT NULL,
    `status`                    VARCHAR(20)     NOT NULL,
    PRIMARY KEY (`supplier_id`)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO `supplier_register` (`supplier_id`, `supplier_name`, `registration_date`, `bank_detail_change_date`, `contact_name`, `status`) VALUES
('TCS-003', 'Birchwood Timber',        '2019-03-12', NULL,         'James Hartley',  'Active'),
('TCS-005', 'Greenfield Supplies',     '2020-08-07', NULL,         'Sarah Nkomo',    'Active'),
('TCS-007', 'Mercer Electrical',       '2018-01-15', NULL,         'David Mercer',   'Active'),
('TCS-009', 'Hartwell Civils',         '2017-06-22', '2025-09-02', 'Paul Hartwell',  'Active'),
('TCS-011', 'Ridgeway Materials',      '2021-11-03', NULL,         'Claire Ridgeway','Active'),
('TCS-014', 'Apex Building Solutions', '2025-03-14', NULL,         'Unknown',        'Under Review');


-- ============================================================
-- TABLE 3: INVOICE DATA
-- ============================================================

DROP TABLE IF EXISTS `invoice_data`;
CREATE TABLE `invoice_data` (
    `invoice_number`    VARCHAR(20)     NOT NULL,
    `invoice_date`      DATE            NOT NULL,
    `supplier_id`       VARCHAR(10)     NOT NULL,
    `supplier_name`     VARCHAR(100)    NOT NULL,
    `amount_gbp`        DECIMAL(10,2)   NOT NULL,
    `approved_by`       VARCHAR(10)     NOT NULL,
    `works_reference`   VARCHAR(20)     NOT NULL,
    `payment_date`      DATE            NOT NULL,
    PRIMARY KEY (`invoice_number`),
    FOREIGN KEY (`supplier_id`)  REFERENCES `supplier_register`(`supplier_id`),
    FOREIGN KEY (`approved_by`)  REFERENCES `employee_limits`(`employee_id`)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO `invoice_data` (`invoice_number`, `invoice_date`, `supplier_id`, `supplier_name`, `amount_gbp`, `approved_by`, `works_reference`, `payment_date`) VALUES
('INV-0156', '2025-04-12', 'TCS-003', 'Birchwood Timber',        4200.00,  'E-002', 'WR-112', '2025-04-26'),
('INV-0178', '2025-04-23', 'TCS-007', 'Mercer Electrical',       6500.00,  'E-003', 'WR-118', '2025-05-07'),
('INV-0198', '2025-05-04', 'TCS-005', 'Greenfield Supplies',     3800.00,  'E-001', 'WR-124', '2025-05-18'),
('INV-0210', '2025-05-15', 'TCS-011', 'Ridgeway Materials',      9500.00,  'E-004', 'WR-130', '2025-05-29'),
('INV-0234', '2025-06-07', 'TCS-003', 'Birchwood Timber',        2100.00,  'E-002', 'WR-135', '2025-06-21'),
('INV-0267', '2025-06-19', 'TCS-009', 'Hartwell Civils',        18500.00,  'E-006', 'WR-141', '2025-07-03'),
('INV-0281', '2025-06-30', 'TCS-007', 'Mercer Electrical',       9200.00,  'E-003', 'WR-145', '2025-07-14'),
('INV-0287', '2025-03-14', 'TCS-014', 'Apex Building Solutions', 23500.00, 'E-005', 'WR-098', '2025-03-28'),
('INV-0301', '2025-07-10', 'TCS-005', 'Greenfield Supplies',     9750.00,  'E-001', 'WR-150', '2025-07-24'),
('INV-0318', '2025-07-24', 'TCS-009', 'Hartwell Civils',        22400.00,  'E-006', 'WR-156', '2025-08-07'),
('INV-0334', '2025-08-05', 'TCS-011', 'Ridgeway Materials',      9850.00,  'E-004', 'WR-161', '2025-08-19'),
('INV-0341', '2025-08-14', 'TCS-007', 'Mercer Electrical',       8750.00,  'E-003', 'WR-166', '2025-08-28'),
('INV-0342', '2025-08-17', 'TCS-007', 'Mercer Electrical',       8900.00,  'E-003', 'WR-166', '2025-08-31'),
('INV-0367', '2025-09-02', 'TCS-009', 'Hartwell Civils',        20850.00,  'E-006', 'WR-172', '2025-09-16'),
('INV-0389', '2025-09-18', 'TCS-003', 'Birchwood Timber',        9400.00,  'E-002', 'WR-178', '2025-10-02'),
('INV-0401', '2025-10-03', 'TCS-005', 'Greenfield Supplies',     9600.00,  'E-001', 'WR-183', '2025-10-17'),
('INV-0412', '2025-10-15', 'TCS-011', 'Ridgeway Materials',     34200.00,  'E-004', 'WR-188', '2025-10-29'),
('INV-0428', '2025-10-29', 'TCS-007', 'Mercer Electrical',       5300.00,  'E-003', 'WR-193', '2025-11-12'),
('INV-0445', '2025-11-12', 'TCS-003', 'Birchwood Timber',        9900.00,  'E-002', 'WR-198', '2025-11-26'),
('INV-0461', '2025-11-27', 'TCS-009', 'Hartwell Civils',         9700.00,  'E-006', 'WR-204', '2025-12-11');

SET FOREIGN_KEY_CHECKS = 1;


ALTER TABLE invoice_data
ADD fraud_flag TINYINT NOT NULL DEFAULT 0,
ADD fraud_category VARCHAR(50) NOT NULL DEFAULT 'Clean';

UPDATE invoice_data SET fraud_flag = 1, fraud_category = 'Weekend Invoice' WHERE invoice_number IN ('INV-0156', 'INV-0198', 'INV-0234');
UPDATE invoice_data SET fraud_flag = 1, fraud_category = 'Threshold Manipulation' WHERE invoice_number IN ('INV-0210', 'INV-0281', 'INV-0334', 'INV-0389', 'INV-0401', 'INV-0445', 'INV-0461');
UPDATE invoice_data SET fraud_flag = 1, fraud_category = 'Mandate Fraud' WHERE invoice_number IN ('INV-0267', 'INV-0318', 'INV-0367');
UPDATE invoice_data SET fraud_flag = 1, fraud_category = 'Fictitious Supplier' WHERE invoice_number = 'INV-0287';
UPDATE invoice_data SET fraud_flag = 1, fraud_category = 'Authorisation Limit Breach' WHERE invoice_number IN ('INV-0301', 'INV-0412');
UPDATE invoice_data SET fraud_flag = 1, fraud_category = 'Duplicate Invoice' WHERE invoice_number IN ('INV-0341', 'INV-0342');

select * from invoice_data;