%dw 2.0
output application/json
---
{
	"error": {
		"message": error.description,
		(if(error.detailedDescription != error.description) "details": error.detailedDescription else {}),
		"type": error.errorType.asString
	}
}