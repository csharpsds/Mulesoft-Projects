%dw 2.0
output application/json
---
{
    "queryString": "select distinct pii.identifier_value as isbn13, ic.code, ic.legend 
  					from " ++ p('carta-sapi.schema.bookentity') ++ ".course_master_contact cmc
  					join " ++ p('carta-sapi.schema.bookentity') ++ ".course_issue ci on ci.parent_carta_id = cmc.carta_id and ci._fivetran_deleted =0
  					join " ++ p('carta-sapi.schema.crossproduct') ++ ".product_identifier pii on pii.product_id = ci.carta_id and pii._fivetran_deleted = 0 and pii.identifier_type  = 'isbn_13'
  					join " ++ p('carta-sapi.schema.reference') ++ ".internalcontacts ic on ic.code = cmc.contact_code and ic._fivetran_deleted = 0
  					where 1=1 
  					and contact_type_code ='01'
  					and cmc._fivetran_deleted = 0
  					and pii.identifier_value = :isbn13", 
    "bindValues": {
        "isbn13": payload.isbn13 as String
    }
}
