#!/bin/awk -f

@include "utils.awk"

BEGIN {


	house=getline < "House"
	printf "[COORDINATE %s]\n", $0

	n=0
	# FS=","
}

/#/ { next }

{
	As[n]=getA($0)
	Bs[n]=getB($0)
	Cs[n]=getC($0)
	n++
}

END {
	printf "<table id=\"coordtab\">\n\t<tr>\n\t\t<th>A</th>\n\t\t<th>B</th>\n\t\t<th>C</th>\n\t</tr>\n"
	for (i=0; i < n; ++i) {
		# printf "(%s,%s,%s)\n", As[i], Bs[i], Cs[i]
		printf "<tr>\n\t\t<th>%s</th>\n\t\t<th>%s</th>\n\t\t<th>%s</th>\n\t</tr>\n", As[i], Bs[i], Cs[i]
	}

	printf "</table>\n"

	printf "<canvas id=\"minimap\" width=\"400\" height=\"200\" style=\"border:1px solid #000000;\"></canvas>"

	RS="\0"
	getline < "minimap.js"
	printf "<script> %s </script>\n", $0

	# printf "<script> var canvas = document.getElementById(\"minimap\");var ctx = canvas.getContext(\"2d\");ctx.moveTo(0,0);ctx.lineTo(200,100);ctx.stroke();</script>"

}
