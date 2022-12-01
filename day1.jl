using DelimitedFiles

# reading the input 
data = readdlm("input_day1",skipblanks=false)

if data[3] == ""
  println(data[4])
end

sum = 0 
large = sum
position = 0

for i in eachindex(data)
  if data[i] == ""
    if sum > large
      global large = sum
      global sum = 0 
    else
      global sum = 0
    end 
    global position = position+1

  else
    global sum = sum+data[i]
  end
end

println(large)
println(position)
