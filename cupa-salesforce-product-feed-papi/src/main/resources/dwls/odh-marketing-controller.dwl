%dw 2.0
output application/json
---
{
    "queryString": "SELECT ci.EAN_NUMBER AS isbn13, ct.UK_MARKETING_CONTROLLER, ct.EDITOR_CODE, ses.EMPLOYEE_NAME AS EDITOR_NAME
					FROM app_core_tm.core_title ct
					JOIN app_core_tm.core_isbn ci ON ci.TITLE_CODE = ct.TITLE_CODE 
					LEFT JOIN APP_SYSREF.SR_EMPLOYEE_SAO ses ON ses.EMPLOYEE_CODE = ct.EDITOR_CODE 
					WHERE ci.EAN_NUMBER  = :isbn13",
    "bindValues": {
        "isbn13": payload.isbn13 as String
    }
}