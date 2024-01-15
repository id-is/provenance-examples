import pickle
import numpy as np
import tensorflow as tf
import sys
from tensorflow.keras import layers, models


# Load MNIST data from the pickle file
with open(sys.argv[1], 'rb') as file:
    data = pickle.load(file)

# Separate the data into features (images) and labels
X_train, y_train = data[0], data[1]

# Normalize pixel values to be between 0 and 1
X_train = X_train / 255.0

# Define the model
model = models.Sequential([
    layers.Flatten(input_shape=(28, 28)),  # Flatten the 28x28 images to a 1D array
    layers.Dense(128, activation='relu'),
    layers.Dense(10, activation='softmax')  # Output layer with 10 units for 10 classes
])

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Train the model
model.fit(X_train, y_train, epochs=10)

# Save the trained model
model_name = sys.argv[2]
model.save(model_name)
