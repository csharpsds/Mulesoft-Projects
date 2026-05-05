%dw 2.0
output applictaion/java
---
if ( isEmpty(attributes.headers.'x-transaction-id') ) 
	correlationId
else
	attributes.headers.'x-transaction-id'