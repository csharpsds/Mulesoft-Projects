%dw 2.0
output application/json
---
{
  application: app.name,
  version: "v1",
  environment: Mule::p('mule.env'),
  status: Mule::p('api.status.running'),
  timestamp: now() as String {format: Mule::p('formats.timestamp')}
}