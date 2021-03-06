#!/usr/bin/awk -f

ARGIND == 1 && $0 {
    for (i = 1; i <= NF; i++)
	cell[cellrow + 0, i] = $i

    cellrow++

    if (FNR == 1) {
	cellcol = NF
    } else if (NF != cellcol) {
    	print "!!!!!!!!!!!!!", FNR
	exit(1)
    }

    next
}

{
    line[FNR] = $0
}

END {
    #dump_cell()

    for (i = 1; i < cellrow; i++) {
	for (j = 1; j <= FNR; j++) {
	    $0 = line[j]
	    for (k = 1; k <= cellcol; k++) {
		gsub(cell[0, k], cell[i, k])
	    }
	    print
	}
	print ""
    }
}

function dump_cell(    i, j)
{
    for (i = 0; i < cellrow; i++)
	for (j = 1; j <= cellcol; j++)
	    print cell[i, j]
}
