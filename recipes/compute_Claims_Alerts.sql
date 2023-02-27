SELECT 
  "claim_id", "customer_id", "claim_date", "claim_amount", "proba_1" as Fraud_Score
  FROM "${projectKey}_new_claims_scored"
  WHERE "prediction" = '1' AND "claim_amount" > 0
  ORDER BY "proba_1" DESC