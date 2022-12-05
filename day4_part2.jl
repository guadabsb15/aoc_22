using DelimitedFiles

# reading the input 
data = readdlm("input_day4")

overlap = 0

for i in eachindex(data)
  interval=match(r"(\d+)-(\d+),(\d+)-(\d+)",data[i])

  lo = parse(Int64,interval[1])
  hi = parse(Int64,interval[2])

  lo2 = parse(Int64,interval[3])
  hi2 = parse(Int64,interval[4])

  #create sets with the intervals
  set1 = Set(UnitRange(lo,hi)) 
  set2 = Set(UnitRange(lo2,hi2))  

  #see if there is intersection
  
  intersection = intersect(set1,set2)
  
  if (length(intersection)>0)

    global overlap = overlap +1
 
  end
 
end

println(overlap)
