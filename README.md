A bash script that helps verify sha512 in a single command
======================================================

The script is based on `sha256sum` utility and allows to compare
SHA 256 sums without downloading a file with the sum.

## Installation
Add the following function to your `.bashrc` or `.zshrc` file:
  ```shell script
  sha512() {
    expected_checksum=$1
    filename=$2
    actual_checksum=$(shasum -a 512 "$filename" | awk '{print $1}')

    if [[ "$expected_checksum" == "$actual_checksum" ]]; then
      echo "Checksum matched: OK for $filename"
    else
      echo "Checksum mismatch: FAILED for $filename"
    fi
}
  ```

## Usage
You can compare SHA 512 sums in the following way:
```shell script
sha512 <expected-sha-256-sum> <name-of-the-file>
```

## Examples
```shell script
sha256 091e104d6ed542e6bbcb4463bd6c22b68022750e373ccb6ba23b86335cbb55bdcec47ba2d5b4278fe1cb58c21a5aadf8bacaccde6eaca15879601e684ebfbc63 dotnet-sdk-7.0.305-osx-arm64.pkg
```
The output if the sums match:
```
Checksum matched: OK for dotnet-sdk-7.0.305-osx-arm64.pkg
```
The output if the sums do not match:
```shell script
Checksum mismatch: FAILED for dotnet-sdk-7.0.305-osx-arm64.pkg
```
