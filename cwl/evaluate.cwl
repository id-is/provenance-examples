cwlVersion: v1.0
class: CommandLineTool
baseCommand: [python]

requirements:
  - class: DockerRequirement
    dockerPull: antganios/mnist-python-env:latest

inputs:
  - id: test_dataset
    type: File
  - id: model
    type: File
  - id: results_name
    type: string

outputs:
  - id: results
    type: File
    outputBinding:
      glob: $(inputs.results_name)


arguments: ["/home/app/evaluate.py",$(inputs.test_dataset.path), $(inputs.model.path), $(inputs.results_name)]
