#!/bin/bash
JSESSIONID=${1}
INPUT_FILE=${2}

if [ -z "${JSESSIONID}" ]; then
  echo "Error: JSESSIONID cannot be empty."
  exit 1
fi

if [ ! -f "${INPUT_FILE}" ]; then
  echo "Error: Input file '${INPUT_FILE}' not found."
  exit 1
fi

if [ ! -x "../send_sale.sh" ]; then
  echo "Error: '../send_sale.sh' not found or is not executable."
  exit 1
fi

# Remove carriage returns from the input file in-place
sed -i 's/\r//g' "${INPUT_FILE}"

#loop thru the content of INPUT_FILE line by line and use the value as ID

echo "JESSIONID: ${JSESSIONID}"
while IFS= read -r ID; do
  # Ignore empty lines
  if [ -n "${ID}" ]; then
    ../send_sale.sh "$JSESSIONID" "$ID"
  fi
done < "${INPUT_FILE}"


