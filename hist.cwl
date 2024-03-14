class: Workflow
cwlVersion: v1.0

requirements:
  DockerRequirement:
    dockerPull:
      antganios/mnist-python-env:latest

inputs:
  - id: txt_file
    type: File
  - id: plot_name
    type: string
    default: "plot.png"

outputs:
  - id: plot_file
    type: File
    outputSource: plot/plot_file

steps:
  plot:
    in:
      txt_file: txt_file
      plot_name: plot_name
    out: [plot_file]
    run:
      class: CommandLineTool
      inputs:
        txt_file: File
        plot_name: string
      outputs:
        - id: plot_file
          type: File
          outputBinding:
            glob: $(inputs.plot_name) 
      baseCommand: python
      arguments: ["/app/plot.py", $(inputs.txt_file.path),$(inputs.plot_name)] 
 