import json
import joblib
import numpy as np
from azureml.core.model import Model

def init():
    global model
    model_path = Model.get_model_path('customer_churn_voting_classifier')
    print(f"Model path: {model_path}")  # Add this to log the model path
    model = joblib.load(model_path)

def run(raw_data):
    data = np.array(json.loads(raw_data)['data'])
    predictions = model.predict(data)
    return json.dumps(predictions.tolist())