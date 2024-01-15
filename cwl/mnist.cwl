cwlVersion: v1.2
class: Workflow

requirements:
  InlineJavascriptRequirement: {}

inputs:
  dataset_url: string
  train_dataset_name: string
  test_dataset_name: string
  model_name: string
  results_name: string

outputs:

  - id: results
    type: File
    outputSource: evaluate/results


steps:
  download_ds:
    run: download_ds.cwl
    in:
      dataset_url: dataset_url
      train_dataset_name: train_dataset_name
      test_dataset_name: test_dataset_name
    out: [train_dataset, test_dataset]
  train:
    run: train.cwl
    in:
      train_dataset: download_ds/train_dataset
      model_name: model_name
    out: [model]
  evaluate:
    run: evaluate.cwl
    in:
      test_dataset: download_ds/test_dataset
      model: train/model
      results_name: results_name
    out: [results]