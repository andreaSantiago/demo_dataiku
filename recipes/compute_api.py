import dataikuapi

client = dataikuapi.APINodeClient("http://localhost:11900/", "test")

record_to_predict = {
    "claim_id": 68261,
    "customer_id": "0-10367726338",
    "claim_date": "2016-10-19T00:00:00.000Z",
    "claim_amount": 129.8,
    "fraud_score": 0.7499318580627239
}
prediction = client.predict_record("test", record_to_predict)
print(prediction["result"])