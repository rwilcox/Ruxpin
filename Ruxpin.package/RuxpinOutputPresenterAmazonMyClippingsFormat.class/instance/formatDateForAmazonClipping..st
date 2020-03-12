private
formatDateForAmazonClipping: x

"Given a date, will output a string like:
Sunday, January 26, 2020 8:15:07 PM"
|y|
y := ((x hour24) > 12) ifTrue: [ 'PM' ] ifFalse: [ 'AM' ].

^ '{1}, {2} {3}, {4} {5}:{6}:{7} {8}' format: { 
	x dayOfWeekName .
	x monthName .
	x dayOfMonth.
	x year.
	x hour12.
	x minutes.
	x second.
	y
}.

