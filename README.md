Sure! Here is a README file for your GitHub repository:

```markdown
# Code Guard: Log Security Suite

Code Guard is a comprehensive suite designed for log analysis and file encryption/decryption. It provides tools for analyzing log files to identify critical events, errors, and warnings, as well as for encrypting and decrypting files using AES-256 encryption.

## Features

- Log Analysis
  - Counts the total number of lines in the log file.
  - Counts the number of errors and warnings.
  - Identifies and lists critical events.
  - Extracts and lists the top 5 most common error and warning messages.
  - Generates a summary report with the analysis results.

- Encryption and Decryption
  - Encrypts files using AES-256-CBC encryption.
  - Decrypts files previously encrypted with AES-256-CBC.
  
## Requirements

- Bash (Unix shell)
- OpenSSL (for encryption and decryption)

## Usage

### Log Analysis

1. Run the script:
   ```bash
   ./script_name.sh
   ```
2. Select the log analysis option by pressing `1`.
3. Enter the path to the log file when prompted.
4. The script will process the log file and generate a summary report.

### Encryption and Decryption

1. Run the script:
   ```bash
   ./script_name.sh
   ```
2. Select the encryption/decryption option by pressing `2`.
3. Follow the prompts to either encrypt or decrypt a file:
   - For encryption, enter the file path and the encryption key.
   - For decryption, enter the file path of the encrypted file and the decryption key.

## Example

Here is an example of how to use the script:

```bash
$ ./script_name.sh
................................................................... Code Guard: Log Security Suite ....................................................................

Press 1 for Log Anylisis
Press 2 for Encryption and Decryption
1
enter the file path
/path/to/logfile.log
Summary report generated: log_summary_2024-05-20.txt
```

### Encryption Example

```bash
$ ./script_name.sh
................................................................... Code Guard: Log Security Suite ....................................................................

Press 1 for Log Anylisis
Press 2 for Encryption and Decryption
2
Options:
1. Encrypt file
2. Decrypt file
Enter your choice: 1
Enter the path to the file you want to encrypt: /path/to/file.txt
Enter the encryption key: mysecretpassword
File encrypted successfully! Encrypted file saved as /path/to/file.txt.encrypted
```

### Decryption Example

```bash
$ ./script_name.sh
................................................................... Code Guard: Log Security Suite ....................................................................

Press 1 for Log Anylisis
Press 2 for Encryption and Decryption
2
Options:
1. Encrypt file
2. Decrypt file
Enter your choice: 2
Enter the path to the file you want to decrypt: /path/to/file.txt.encrypted
Enter the decryption key: mysecretpassword
File decrypted successfully! Decrypted file saved as /path/to/file.txt
```

## Contributing

Feel free to fork this repository, make changes, and submit pull requests. Any contributions are welcome!


## Acknowledgments

- [OpenSSL](https://www.openssl.org/) for providing encryption and decryption functionalities.
```

Replace `script_name.sh` with the actual name of your script file. Save this content in a `README.md` file in the root of your GitHub repository.
