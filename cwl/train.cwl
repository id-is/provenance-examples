cwlVersion: v1.0
class: CommandLineTool
baseCommand: [python]

requirements:
  - class: DockerRequirement
    dockerPull: antganios/mnist-python-env:latest

inputs:
  - id: train_dataset
    type: File
  - id: model_name
    type: string
    default: "mnist_model.keras"



outputs:
  - id: model
    type: File
    outputBinding:
      glob: $(inputs.model_name)

arguments: ["/home/app/train.py",$(inputs.train_dataset.path), $(inputs.model_name)]
