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
