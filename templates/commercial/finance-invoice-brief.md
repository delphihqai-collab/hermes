# Finance — Invoice Creation Request Brief
**Template version:** 1.0
**Owner:** Finance Agent → HERMES → Boss
**Purpose:** Structured request for invoice creation and issuance. Raised at contract signature (first invoice) and monthly thereafter. HERMES routes to Boss for approval before any invoice is issued externally.

---

## INVOICE REFERENCE

**Company (client):** [REQUIRED] *e.g. Clínica Dental Horizonte*
**Invoice number:** [REQUIRED] *e.g. DELPHI-2026-001*
**Invoice type:** [REQUIRED — First invoice / Monthly recurring / Ad hoc]
**Invoice date:** [REQUIRED] *e.g. 2026-03-01*
**Payment due date:** [REQUIRED] *e.g. 2026-03-31 (Net 30)*
**Invoice period:** [REQUIRED] *e.g. March 2026*

---

## INVOICE DETAILS

**Line items:**

| Description | Quantity | Unit price | Total |
|---|---|---|---|
| [REQUIRED e.g. AI process automation subscription — March 2026] | 1 | EUR [REQUIRED] | EUR [REQUIRED] |
| [OPTIONAL additional line] | | | |

**Subtotal:** EUR [REQUIRED]
**VAT (23% Portugal standard rate):** EUR [REQUIRED]
**Total invoiced:** EUR [REQUIRED]

**Payment terms:** [REQUIRED] *e.g. Net 30 — payment by 2026-03-31*
**Payment method:** [REQUIRED] *e.g. Bank transfer to Delphi IBAN [HERMES to populate from config]*

---

## CLIENT BILLING DETAILS

**Client legal entity name:** [REQUIRED] *e.g. Clínica Dental Horizonte Lda*
**Client NIF/VAT number:** [REQUIRED] *e.g. PT 507 123 456*
**Client billing address:** [REQUIRED]
**Client billing contact (if different from primary):** [OPTIONAL]

---

## CONTRACT VALIDATION

**Invoiced amount matches contract:** [REQUIRED — YES / NO / DISCREPANCY]
If discrepancy: [REQUIRED] *explain and flag to HERMES before proceeding*
**Invoice within agreed payment schedule:** [REQUIRED — YES / NO]
**Scope delivered as contracted:** [REQUIRED — FULLY / PARTIALLY / NOT YET]
If not fully: [REQUIRED] *explain — partial delivery invoicing requires Boss approval*

---

## MARGIN CHECK

**Monthly subscription revenue:** EUR [REQUIRED]
**Margin floor check:** [REQUIRED — ABOVE FLOOR / AT FLOOR / BELOW FLOOR / UNCALIBRATED]
*Note: If margin floor is not yet calibrated, state "uncalibrated — manual review required" and flag to HERMES.*
**Any discount applied:** [REQUIRED — YES / NO]
If YES: [REQUIRED] *amount, approval reference, and authority who approved*

---

## PAYMENT TRACKING

*For recurring invoices — record prior payment status.*

**Prior invoice status:** [REQUIRED for recurring — PAID ON TIME / PAID LATE / OUTSTANDING / FIRST INVOICE]
**Outstanding balance from prior periods:** [REQUIRED — EUR 0 or specify]
**Days outstanding (if applicable):** [OPTIONAL]
**Flag required:** [REQUIRED — NONE / MEDIUM (1–7 days late) / HIGH (7–14 days late) / CRITICAL (>14 days or disputed)]

---

## 30-DAY CASH FLOW CONTRIBUTION

**This invoice due in next 30 days:** [REQUIRED — YES / NO]
**Expected receipt date (based on payment history):** [OPTIONAL]
**30-day inflow projection (Finance to update in monthly report):** [OPTIONAL]

---

## HERMES REVIEW

**Reviewed by HERMES:** [HERMES to complete]
**Approved for issuance:** YES / NO / HOLD
**Routed to Boss:** YES / NO
**Boss approval received:** YES / NO
**Invoice issued date:** [HERMES to complete]
**Notes:** [HERMES to complete]
