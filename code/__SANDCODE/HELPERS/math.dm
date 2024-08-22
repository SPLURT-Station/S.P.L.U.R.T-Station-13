/proc/percentage_between(x,a,b,centesimal = TRUE)
	if (a > b)
		return percentage_between(x, b, a, centesimal)
	return clamp((x-a)/(b-a),0,1) * (centesimal ? 100 : 1)
