#!/bin/bash
echo "................................................................... Code Guard: Log Security Suite ...................................................................."
echo "      "
echo "      "
echo "Press 1 for Log Anylisis"
echo "Press 2 for Encryption and Decryption"
read option
case $option in 
1) 
{
# Check if the user provided the log file path as a command-line argument
echo "enter the file path"
read file

# Get the log file path from the command-line argument
log_file="$file"

# Check if the log file exists
if [ ! -f "$log_file" ]; then
  echo "Error: Log file not found: $log_file"
  exit 1
fi

# Step 1: Count the total number of lines in the log file
total_lines=$(wc -l < "$log_file")

# Initialize error and warning counts
error_count=0
warning_count=0

# Search for critical events (lines containing the keyword “CRITICAL”) and store them in an array
mapfile -t critical_events < <(grep -n -i "CRITICAL" "$log_file")

# Identify the top 5 most common error messages and their occurrence count using associative arrays
declare -A error_messages
declare -A warning_messages
while IFS= read -r line; do
  # Check for error messages
  if grep -qi "ERROR" <<< "$line"; then
    ((error_count++))
  fi
  # Check for warning messages
  if grep -qi "WARNING" <<< "$line"; then
    ((warning_count++))
  fi
  # Use awk to extract the error or warning message (fields are space-separated)
  message=$(awk '{for (i=3; i<=NF; i++) printf $i " "; print ""}' <<< "$line")
  # Increment error or warning count
  if grep -qi "ERROR" <<< "$line"; then
    ((error_messages["$message"]++))
  elif grep -qi "WARNING" <<< "$line"; then
    ((warning_messages["$message"]++))
  fi
done < "$log_file"

# Sort the error messages by occurrence count (descending order)
sorted_error_messages=$(for key in "${!error_messages[@]}"; do
  echo "${error_messages[$key]} $key"
done | sort -rn | head -n 5)

# Sort the warning messages by occurrence count (descending order)
sorted_warning_messages=$(for key in "${!warning_messages[@]}"; do
  echo "${warning_messages[$key]} $key"
done | sort -rn | head -n 5)

# Generate the summary report in a separate file
summary_report="log_summary_$(date +%Y-%m-%d).txt"
{
  echo "Date of analysis: $(date)"
  echo "Log file: $log_file"
  echo "Total lines processed: $total_lines"
  echo "Total error count: $error_count"
  echo "Total warning count: $warning_count"
  echo -e "\nTop 5 error messages:"
  echo "$sorted_error_messages"
  echo -e "\nTop 5 warning messages:"
  echo "$sorted_warning_messages"
  echo -e "\nCritical events with line numbers:"
  for event in "${critical_events[@]}"; do
    echo "$event"
  done
} > "$summary_report"

echo "Summary report generated: $summary_report"
} ;;

2)
{

# Function to encrypt a file
encrypt_file() {
    local key="$1"
    local input_file="$2"
    local output_file="${input_file}.encrypted"
    openssl enc -aes-256-cbc -salt -in "$input_file" -out "$output_file" -pass "pass:$key"
    echo "File encrypted successfully! Encrypted file saved as $output_file"
}

# Function to decrypt a file
decrypt_file() {
    local key="$1"
    local input_file="$2"
    local output_file="${input_file%.encrypted}"
    openssl enc -d -aes-256-cbc -in "$input_file" -out "$output_file" -pass "pass:$key"
    echo "File decrypted successfully! Decrypted file saved as $output_file"
}

# Main function
main() {
    echo "Options:"
    echo "1. Encrypt file"
    echo "2. Decrypt file"
    read -p "Enter your choice: " option

    case $option in
        1)
            read -p "Enter the path to the file you want to encrypt: " filename
            read -p "Enter the encryption key: " key
            encrypt_file "$key" "$filename"
            ;;
        2)
            read -p "Enter the path to the file you want to decrypt: " filename
            read -p "Enter the decryption key: " key
            decrypt_file "$key" "$filename"
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
}

# Execute main function
main

};;

*) echo "not valid" ;;
esac 
