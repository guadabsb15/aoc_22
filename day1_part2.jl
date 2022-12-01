using DelimitedFiles

# reading the input 
data = readdlm("input_day1",skipblanks=false)

sum_c = 0 
calories = Int[]

for i in eachindex(data)
  if data[i] == ""
    push!(calories,copy(sum_c))
    global sum_c = 0
  else
    global sum_c = sum_c+data[i]
  end
end


#large1 = sort(calories, rev=true)[1]
#println(large1)

large3 = sort(calories,rev=true)[1:3]
large3_sum = sum(large3)
println(large3_sum) 
