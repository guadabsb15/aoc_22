using DelimitedFiles

# reading the input 
data = readdlm("input_day3")

priority = 0

for i in eachindex(data)
  if i % 3 != 0
    continue
  end
  #println(data[i])
  rsack_1 = data[i]
  rsack_2 = data[i-1] 
  rsack_3 = data[i-2]

  no_occur = true
  j = 1
  letter ='a'
  #check occurance of letter 
  while no_occur
    if occursin(rsack_1[j],rsack_2) && occursin(rsack_1[j],rsack_3)
      letter = rsack_1[j]
      no_occur=false
    end
    j = j+1
  end  

  #check if it is lower case
  if occursin(r"^[a-z]+$",string(letter))
    global priority = priority+(Int(letter) - 96)
  else
    global priority = priority+(Int(letter) - 38)
  end

end

println(priority)
#println(Int('a')) #need to substract 96
#println(Int('A')) #need to substract 38
