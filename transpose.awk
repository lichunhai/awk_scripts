#!/usr/bin/awk -f

{
	for (i = 1; i <= NF; i++)
		cell[FNR, i] = $i
}

END {
	OFS = "\t"
	for (i = 1; i <= NF; i++) {
		for (j = 1; j <= FNR; j++)
			printf j == FNR ? "%s" : "%s%s", cell[j, i], OFS
			#printf j == FNR ? "%s" : "%s%s", cell[j, i], FS
		#print ""
		printf "%s", RS
	}
}
