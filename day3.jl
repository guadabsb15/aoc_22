using DelimitedFiles

# reading the input 
data = readdlm("input_day3")

priority = 0

for i in eachindex(data)
  #println(data[i])
  middle_index=length(data[i])÷2
  comp_1 = data[i][1:middle_index]
  comp_2 = data[i][middle_index+1:end] 

  no_occur = true
  j = 1
  letter ='a'
  #check occurance of letter 
  while no_occur
    if occursin(comp_1[j],comp_2)
      letter = comp_1[j]
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
