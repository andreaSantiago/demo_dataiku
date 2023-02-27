SELECT 
    "New_Claims"."claim_id" AS "claim_id",
    "New_Claims"."contract_id" AS "contract_id",
    "New_Claims"."claim_amount" AS "claim_amount",
    "New_Claims"."claim_date" AS "claim_date",
    "New_Claims"."expert" AS "expert",
    "New_Claims"."litigation_flag" AS "litigation_flag",
    "New_Claims"."code_dep" AS "code_dep",
    "Departements_Ref"."department" AS "department",
    "Departements_Ref"."region" AS "region",
    "Departements_Ref"."geopoint" AS "geopoint",
    "Contracts_and_Customers_ref"."product_id" AS "product_id",
    "Contracts_and_Customers_ref"."car_brand" AS "car_brand",
    "Contracts_and_Customers_ref"."car_model" AS "car_model",
    "Contracts_and_Customers_ref"."car_number" AS "car_number",
    "Contracts_and_Customers_ref"."policies_last_year" AS "policies_last_year",
    "Contracts_and_Customers_ref"."policies_last_3_years" AS "policies_last_3_years",
    "Contracts_and_Customers_ref"."contract_duration" AS "contract_duration",
    "Contracts_and_Customers_ref"."contract_end_date_year" AS "contract_end_date_year",
    "Contracts_and_Customers_ref"."customer_id" AS "customer_id",
    "Contracts_and_Customers_ref"."agency_id" AS "agency_id",
    "Contracts_and_Customers_ref"."customer_age" AS "customer_age",
    "Contracts_and_Customers_ref"."customer_group" AS "customer_group",
    "Contracts_and_Customers_ref"."email_domain" AS "email_domain",
    "Contracts_and_Customers_ref"."gender" AS "gender",
    "Contracts_and_Customers_ref"."customer_category" AS "customer_category"
  FROM "INSURANCEFRAUDDETECTIONNEW_new_claims" "New_Claims"
  LEFT JOIN "INSURANCEFRAUDDETECTIONNEW_departements_ref" "Departements_Ref"
    ON "New_Claims"."code_dep" = "Departements_Ref"."code_dep"
  LEFT JOIN "INSURANCEFRAUDDETECTIONNEW_contracts_and_customers_ref" "Contracts_and_Customers_ref"
    ON "New_Claims"."contract_id" = "Contracts_and_Customers_ref"."contract_id"