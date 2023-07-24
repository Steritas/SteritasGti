# GTI Algorithm

This project is a R package that is a wrapper for the GTI algorithm (Python), which calculates the Glucocorticoid Toxicity Index (GTI) score for patients with chronic conditions.

To use this library, call the gti function with the appropriate input. The function takes in a list of lists or a Dataframe with information on patients' health metrics, as well as optional arguments for the baseline visit and measures to include in the final score. The output is a JSON object or DataFrame with the calculated GTI score for each patient.


## Units

 Measure | Metric | Imperial 
---------|--------|----------
 HbA1c   | mmol/L | DCCT %   
 Height  | meters | feet     
 Weight  | kg     | pounds   
 LDL     | mmol/L | mg/dL

## Requirements 

You should already have installed devtools. To install, it


## Installation

Linux/Max

```
export GIT_REPO_TOKEN = <ActualToken>
```

Windows:

```
set GIT_REPO_TOKEN = <ActualToken>
```

You can install this package using devtools, inside R console:

```
devtools::install_github("Steritas/SteritasGti")
```

## Usage

To use this package, you can import the gti function and pass in the required arguments:

```
library(SteritasGti)

results = calculate_score
        (input_subjects, 
        baseline="first", 
        algorithm = 'agti', 
        include=[], 
        output_format = 'json', 
        unit = 'metric')

```

- input_subjects (required): a Pandas DataFrame or a list of dictionaries where each dictionary represents a subject's data for a given visit. See [example_input.json](tests/example_input.json) in tests folder for reference.
- baseline (optional): specifies which visit should be used as the baseline (default is "first"). It can be 'first' or 'previous'
- include (optional): a list of scores to include in the output (default is an empty list)
- output_format (optional): either 'json' or 'df'. By default, the output format is the same as the input_subjects format.
- algorithm: str, optional: Indicates the algorithm. Possible values are 'agti', 'pgti', 'mdgti' and 'bgti'. Default is agti.
- unit: int, optional: unit of measurement for the fields listed above. 0 for metric and 1 for imperial. Default is 0
- fill_missing: bool, optional: decide whether to fill missing values with previous visit value

The output of the gti function is either a Dataframe, or a list of dictionaries where each dictionary represents a subject's GTI score for the included categories.


## Contributing

Contributions to this package are welcome! If you find a bug or have an idea for a new feature, please open an issue or submit a pull request.

## License

This package is released under the MIT License. See LICENSE for details.
