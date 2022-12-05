using DelimitedFiles

# reading the input 
data = readdlm("input_day4")

contained = 0

for i in eachindex(data)
  interval=match(r"(\d+)-(\d+),(\d+)-(\d+)",data[i])

  lo = parse(Int64,interval[1])
  hi = parse(Int64,interval[2])

  lo2 = parse(Int64,interval[3])
  hi2 = parse(Int64,interval[4])

  if (lo>=lo2  && hi<=hi2)

    global contained = contained +1
 
  elseif (lo2>=lo && hi2<=hi)
 
    global contained = contained +1

  end
 
end

println(contained)
