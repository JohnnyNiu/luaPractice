function paint(x,y)
	print ( x .."-".. y)
end

function drawLine(x1,y1,x2,y2)
	x,y = x1,y1
	while(not (x == x2 and y == y2))
	do
		paint(x,y)
		x=moveOneUnit(x,x2)
		y=moveOneUnit(y,y2)
	end

end

function moveOneUnit(n1, n2)
	if (n1 > n2) then
		return n1 -1;
	elseif (n1 < n2 ) then
		return n1 + 1;
	else
		return n1;
	end
end


print("-------")
function drawOutsideCircle(x,y,l, gap)
	drawLine(x,y, x+l,y)
	drawLine(x+l,y,x+l,y+l)
	drawLine(x+l,y+l,x, y+l)
	drawLine(x,y+l,x,y+gap)
	print("----one circle----")
	return x, y+gap
end
function drawInsideCircle(x,y,l, gap)
        drawLine(x,y, x+l,y)
        drawLine(x+l,y,x+l,y+l-gap)
        drawLine(x+l,y+l-gap,x+gap, y+l-gap)
        drawLine(x+gap,y+l-gap,x+gap,y+gap)
        print("----one circle----")
        return x+gap, y+gap
end
function drawToCenter(x, y, l, gap, endGap, circleCounter)
	centerX, centerY = getCenter(x,y,l)
	if(math.abs(x-centerX)<=endGap and  math.abs(y-centerY)<=endGap) then
		print("end")	
	else
		if(circleCounter == 0 ) then 
			x,y= drawOutsideCircle(x,y ,l, gap)
			drawToCenter(x,y,l-gap, gap, endGap, circleCounter+1);
		else
			x,y= drawInsideCircle(x,y ,l, gap)
			drawToCenter(x,y,l-gap, gap, endGap, circleCounter+1);
		end

	end
end

function getCenter(x, y, l)
	return x+l/2, y+l/2
end

drawToCenter(0,0,10,1,2,0)
