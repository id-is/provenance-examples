cwlVersion: v1.0
class: CommandLineTool
baseCommand: [python]

requirements:
  - class: DockerRequirement
    dockerPull: antganios/mnist-python-env:latest

inputs:
  - id: dataset_url
    type: string
    default: "https://s3.amazonaws.com/img-datasets/mnist.pkl.gz"
  - id: train_dataset_name
    type: string
    default: "train.pkl"
  - id: test_dataset_name
    type: string
    default: "test.pkl"


outputs:
  - id: train_dataset
    type: File
    outputBinding:
      glob: $(inputs.train_dataset_name) 
  - id: test_dataset
    type: File
    outputBinding:
      glob: $(inputs.test_dataset_name) 


arguments: ["/home/app/download_ds.py", $(inputs.dataset_url),$(inputs.train_dataset_name),$(inputs.test_dataset_name) ]
