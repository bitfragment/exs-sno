index_file="index.md"

# Extension of files to include:
ext="sno"

title="# Snobol 4 exercises: Forte 1967"

biblio="In Allen Forte, *SNOBOL3 Primer: An Introduction to the Computer Programming Language* (Cambridge, MA: MIT Press, 1967).\n\nWritten in Snobol4 and compiled with [The Macro Implementation of SNOBOL4 in C (CSNOBOL4) Version 1.5](http://formulae.brew.sh/formula/snobol4) by Philip L. Budne, October 1, 2013. SNOBOL4 (Version 3.11, May 19, 1975), Bell Telephone Laboratories."

echo "${title}\\n\\n" > "${index_file}"
echo "${biblio}\\n\\n" >> "${index_file}"

for file in "$PWD"/*."${ext}"; do
	filename=$(basename $file)
    [[ $filename =~ .*-test ]] && continue
    extensionless="${filename%%.*}"
    num=$(head -1 $file | sed 's/^; *//')
    description=$(grep "; *Description: " $file \
        | sed 's/^; *Description: //')
	echo "* ["${num}"]("${extensionless}".html) " \
        "${description}" >> "${index_file}"
done
