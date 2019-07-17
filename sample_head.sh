#!/usr/bin/env bash

# Source the optparse.bash file ---------------------------------------------------
source optparse.sh
# Define options
#optparse_usage_header="[OPTIONS] <args>"
optparse.define short=f long=file desc="The file to process" variable=file
optparse.define short=o long=output desc="The output file" variable=output default=head_output.txt
optparse.define short=l long=lines desc="The number of lines to head" variable=lines default=5
optparse.define short=v long=verbose desc="Flag to set verbose mode on" variable=verbose_mode behaviour="flag"
# Source the output file ----------------------------------------------------------
. <( optparse.build )

# Display arguments
$verbose_mode && {
	echo "Verbose mode ON"
	echo "FILE  : $file"
	echo "OUTPUT: $output"
	echo "LINES : $lines"
}

# Check if input file exists
[ "$verbose_mode" = "true" ] && echo "Checking input file $file..."
[ ! -f $file ] && {
	echo "File does not exist"
	exit 1
}

[ "$verbose_mode" = "true" ] && echo "Heading first $lines lines into $output..."
cat $file | head -n $lines > $output

[ "$verbose_mode" = "true" ] && echo "Done."

exit 0
