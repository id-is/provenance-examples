import pickle
import numpy as np
import tensorflow as tf
from tensorflow.keras.models import load_model
import sys

# Load MNIST test data from the pickle file
with open(sys.argv[1], 'rb') as file:
    test_data = pickle.load(file)


# Separate the test data into features (images) and labels
X_test, y_test = test_data[0], test_data[1]

# Normalize pixel values to be between 0 and 1
X_test = X_test / 255.0

# Load the trained and Evaluate the model on the test set
model = load_model(sys.argv[2])
eval_result = model.evaluate(X_test, y_test)

# Print the evaluation result
with open(sys.argv[3], 'w') as f:
    f.write(f"Test Loss: {eval_result[0]}, Test Accuracy: {eval_result[1]}")
