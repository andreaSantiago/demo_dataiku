import dataiku
import pandas as pd

import dataikuapi

@app.route('/scoring_api_call/<path:params>')
def scoring_api_call(params):
    
    # get Parameters from the form
    print(params)
    # print(params) --> {'claimAmount': '5435','claimDate': '2019-11-27T00:00:00.000Z','claimDept': '77','claimExpert': '1','contractID': '333333','litigationFlag': '1'}
    params = json.loads(params)
    
    claimExpert = "0"
    if params.get('claimExpert')=="true":
        claimExpert = "1"
        
    litigation = "0"
    if params.get('litigationFlag')=="true":
        litigation = "1"
    
    if params.get('claimDate') == "":
        claimDate = "2019-09-01T00:00:00.000Z"
    else :
        claimDate = params.get('claimDate') + 'T00:00:00.000Z'
    
    record_to_predict = {
        "contract_id": params.get('contractID'),
        "claim_amount": params.get('claimAmount'),
        "claim_date": claimDate,
        "expert": claimExpert,
        "litigation_flag": litigation,
        "code_dep": params.get('claimDept')[:2]
    }

    
    #record_to_predict = {
    #    "contract_id": "229959",
    #    "claim_amount": "240.93",
    #    "claim_date": "2015-11-27T00:00:00.000Z",
    #    "expert": "1",
    #    "litigation_flag": "0",
    #    "code_dep": 76
    #}
    
    client = dataikuapi.APINodeClient("http://localhost:11900/", "test")
    prediction = client.predict_record("test", record_to_predict)
    #return json.dumps({"results": prediction["result"]})
    return json.dumps({"results": prediction})
