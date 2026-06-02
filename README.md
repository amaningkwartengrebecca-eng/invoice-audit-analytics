# Project 1 — Vendor Fraud Detection: Forensic Analysis Report
**Thornfield Group | Internal Forensic Audit | April–November 2025**

---

## Scenario

Thornfield Group identified unusual activity within the procurement team alongside suspected fraudulent supplier behaviour. As the internal forensic data analyst, I was tasked with investigating six suppliers and the procurement employees linked to them, using invoice data spanning April to November 2025.

**Tools Used:**
- Excel - data preparation and initial review
- SQL - data cleaning, table joining and anomaly investigation
- Power BI - executive dashboard, KPI tracking and investigative visuals

---

## Questions Posed

1. Which suppliers represent the highest fraud risk and how much capital is at risk?
2. Which employees are implicated and is there evidence of collusion?
3. What does the fraud pattern look like over time and by category?
4. What should leadership do about it?

---

## Executive Summary

Thornfield Group's procurement function has a systemic controls failure. The one-to-one employee-to-supplier structure has eliminated cross-approval oversight entirely, creating an environment where six distinct fraud mechanisms operated simultaneously across eight months without internal detection. A total of £224,100 of capital is at risk across 18 of the 20 invoices reviewed, out of £235,900 total capital reviewed, largely concentrated in Q3 and Q4 of the year 2025.

![Executive Summary Dashboard](screenshots/page1_executive_summary.png)

---

## Root Cause

Every employee within the procurement team exclusively approved invoices from a single assigned supplier. No invoice was ever reviewed by more than one individual. This is not solely a people problem - it is an architectural controls failure that made every subsequent finding possible. Without this structure, the majority of fraud instances could have been identified and escalated earlier.

---

## Individual Supplier and Employee Findings

### Hartwell Civils — Employee J
The most forensically significant finding in the dataset. A clear two-phase fraud pattern was identified:

**Phase 1:** Three mandate fraud invoices totalling £61,750 processed between June and September 2025, redirecting payments to a fraudulent account.

**Phase 2:** A bank detail amendment was recorded on 2nd September 2025 — the exact same date as the final mandate fraud invoice. From that point, the fraud mechanism switches entirely to threshold manipulation, with one invoice processed in November at £9,700.

The fraudulent account is now the registered account on Thornfield's system. SQL analysis confirmed the date coincidence by joining the invoice table against the supplier register on `bank_detail_change_date`. J approved all four invoices exclusively. Whether J processed the bank detail amendment cannot be confirmed from invoice data alone meaning an audit log verification is required. As such,this remains a circumstantial but highly suspicious finding.

---

### Ridgeway Materials — Employee D
Three invoices approved. The final invoice - the last submission from this supplier within the review period - was £24,200 over this specific employees approval limit, representing the single highest value fraudulent transaction in the dataset at £34,000. Earlier invoices, during the period, were categorised as threshold manipulation suggesting a similar escalation pattern to Hartwell Civils: controlled, low-value fraud building toward a large terminal transaction. Ridgeway Materials submitted no further invoices after October 2025.

---

### Greenfield Supplies — Employee S
Three invoices approved, all from the same supplier, flagged across three distinct fraud categories: authorisation limit breach, weekend invoice and threshold manipulation. Every invoice approved by S was flagged. The weekend invoice in May represents the earliest fraud activity in the dataset for this supplier.

---

### Birchwood Timber — Employee M
Four invoices approved across two fraud categories. Weekend invoices in April and June represent earlier, lower-sophistication activity. Escalation to threshold manipulation in September and November mirrors the broader dataset pattern of fraud mechanism progression across Q3 and Q4. Birchwood Timber's fraud timeline is consistent with the systemic seasonal escalation pattern identified across multiple suppliers.

---

### Mercer Electrical — Employee P
Four invoices approved. Two invoices share identical works references but carry different values and sequential invoice numbers (interpreted as deliberate fabrication rather than accidental duplication). Sequential invoice numbers with differing values rule out any genuine error. A threshold manipulation invoice in June preceded the duplicate invoices in August, suggesting controls were tested before escalating toward fabrication.

---

### Apex Building Solutions — Employee L
One invoice, March 2025, never repeated. Apex is flagged as a potentially fictitious supplier,their status currently under review. Employee L has no other fraud flags across the dataset. A single invoice from an unverifiable supplier approved by an otherwise clean employee is consistent with a fictitious vendor scheme, where a legitimate looking approver is used deliberately to reduce suspicion. Requires Companies House verification and bank detail cross-referencing to confirm.

---

## Cross-Dataset Pattern Findings

### Seasonal Escalation Pattern
From May onwards, every month excluding one (July) contains threshold manipulation or mandate fraud activity across multiple suppliers. These are the same two fraud categories exploited by the implicated employees. Pre-May activity is more varied and lower in value. The concentration of serious fraud categories in Q3 and Q4 suggests either coordinated exploitation of reduced oversight during summer months, or suppliers independently identifying the same control weakness simultaneously.

### Fraud Sophistication Tiers
Three distinct levels of fraud sophistication are present across the dataset:

- **Opportunistic** - Weekend invoices, Isolated threshold manipulation, Low coordination.
- **Systematic** - Hartwell Civils' two-phase bank detail strategy, Mercer Electrical's escalation from threshold manipulation to invoice fabrication; both demonstrating planning and sequencing.
- **Ambiguous** - Apex Building Solutions and Employee Lisa; insufficient data to conclude either way.

### Approval Limit Breaches
Only two employees breached their approval limits — S and D. However, J's mandate fraud invoices are more financially damaging in aggregate despite never technically breaching his limit. This demonstrates that approval limits alone are insufficient as a control mechanism.

---

## Data Limitations

The following findings require further investigation beyond the scope of this dataset:

- Whether J processed the Hartwell Civils bank detail amendment - Requires vendor management system audit log verification
- Whether Apex Building Solutions is genuinely fictitious -  Requires Companies House verification and bank detail cross-referencing
- Whether the supplier escalation patterns represent coordination between suppliers or independent exploitation of the same systemic weakness
- Activity beyond 27th November 2025 is unknown - The dataset ends there and fraudulent activity may be ongoing

---

## Recommendations

![Recommendations Dashboard](screenshots/page4_recommendations.png)

All projected figures below are modelled estimates based on historical fraud rates observed across the review period April–November 2025. Actual outcomes may vary materially due to supplier behaviour, personnel changes, macroeconomic conditions and the extent of implementation. These projections should be treated as suggestive only and reviewed quarterly against actual outcomes.

### 1. Supplier Suspension
Immediate suspension of the three highest-risk suppliers, pending further investigation. Based on historical fraud rates, this projects an annual capital leakage reduction of **£227,775**.

### 2. Dual Authorisation Above 50% of Approval Limit
Implementing mandatory dual authorisation for any invoice exceeding 50% of the approving employee's limit directly addresses the threshold manipulation mechanism present in every employee's fraud profile. Projected saving: **£53,720** (80% of £67,150 threshold manipulation exposure).

### 3. Enhanced Q3 Oversight
Mandatory secondary review of all procurement activity during June–September. Based on £119,700 total Q3 fraud exposure, a 70% prevention rate projects a saving of **£83,790** annually.

### 4. Staff Investigation and Procurement Restructure
A formal investigation into all implicated employees with subsequent restructuring of the procurement approval framework to eliminate the one-to-one employee-supplier structure. Estimated short-term cost: **£20,000**. Full implementation of all recommended controls projects total annual fraud prevention of **£365,285** — an estimated return of **18x** on the restructure investment.

---

## Conclusion

This investigation identified not only individual fraud instances but a coordinated escalation pattern across multiple suppliers, concentrated in Q3, with evidence of a potential insider-supplier relationship in the highest value transaction. The root cause is a systemic approval controls weakness rather than isolated misconduct. The recommended controls, if fully implemented, project total annual fraud prevention of £365,285 against a one-time restructure cost of £20,000.

---

*Analysis conducted using Excel, SQL and Power BI. Full SQL queries, dataset schema and workflow documentation available in this repository.*
