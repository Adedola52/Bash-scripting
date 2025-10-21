#! /bin/bash

url="https://github.com/dataengineering-community/launchpad/raw/refs/heads/main/Linux/sales_data.csv"
data="/home/taibatabowaba/Desktop/data_pipeline/input/sales_data.csv"
log_file="/home/taibatabowaba/Desktop/data_pipeline/logs/preprocess.log"
output="/home/taibatabowaba/Desktop/data_pipeline/output/cleaned_sales_data.csv"

# fetch data from a raw source hosted on github
if curl -L -o "$data" "$url"; then
    echo "$(date '+%Y-%m-%d %H:%M:%S'): Fetching data from source..." > "$log_file"
else
    echo "$(date '+%Y-%m-%d %H:%M:%S'): Failed to fetch data..." > "$log_file"
fi


# ingested data is being preprocessed. it checks for the extra_col and the status column, filters the status column and drops the extra_col
if [[ -f $data ]]; then
  echo "$(date '+%Y-%m-%d %H:%M:%S'): Fetched data, starting preprocessing..." >> "$log_file"
  awk -F, '
NR==1 {
  for (i=1; i<=NF; i++) {
    if ($i != "extra_col") keep[i] = 1
    if ($i == "status") col = i
  }
}

NR==1 || $col != "Failed" {
  out = ""
  for (i=1; i<=NF; i++) {
    if (keep[i]) {
      if (out == "")
        out = $i
      else
        out = out FS $i
    }
  }
  print out
}' "$data" > "$output"
echo "$(date '+%Y-%m-%d %H:%M:%S'): Data successfully processed" >> "$log_file"
else
  echo "$(date '+%Y-%m-%d %H:%M:%S') ERROR: Dataframe not found" >> "$log_file" 
fi
