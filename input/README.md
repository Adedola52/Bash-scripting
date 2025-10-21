# Bash-scripting
This project focuses on building a data processing system automated with cron jobs. It simulates the development of a basic data pipeline involving data generation, ingestion, and transformation. To achieve this, a linux virtual machine
was set up.

## Set up
A main directory was created to organize the pipeline structure. Within it, subdirectories such as input, output, and logs were set up to store data files, processed results, and log information respectively. Here is what it loooks like:

```
├── input/
│   └── sales_data.csv
├── output/
│   └── cleaned_data.csv
├── logs/
│   └── preprocess.log
    └── summary.log
├── scripts/
│   └── preprocess.sh
    └── monitor.sh
```

## Data Ingestion and preprocessing
Data ingestion was simulated by fetching data from a raw source hosted on GitHub using the **'curl'** command. The ingested data was then preprocessed by dropping 
the 'extra_col' column and filtering the 'status' column to filter out rows that were marked as failed. The cleaned and processed data was saved to an output file, and the success or failure of the preprocessing step was logged in a log file. 

## Automating the pipeline with cron jobs
The data ingestion and preprocessing process was automated to run daily at 12:00 AM using cron jobs. To effectively monitor the pipeline, another script was created to read the preprocess log, which records the success or failure of the data ingestion and preprocessing steps. This monitoring script is scheduled to run at 12:05 AM, right after preprocessing, to ensure that any breakage or error during the ingestion or preprocessing stages is detected and logged.

## Permission and security
To maintain proper access control and security across the pipeline, permissions were adjusted for key directories and files
- The input folder was configured to be writable only by the user to prevent unauthorized data modification
- Access to the logs directory was restricted so that only authorized users can read files

These measures help ensure data integrity and prevent unauthorized access to sensitive information.
