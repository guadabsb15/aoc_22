using DelimitedFiles

# reading the input 
data = readdlm("input_day2",'\n')

n_data=length(data)

points = zeros(Int64,n_data)

#rock =  A, paper = B, scissors=C
#rock =  X, paper = Y, scissors=Z 


for i in eachindex(data)
  
  #case of win rock-paper, paper-scissors, scissors-rock 
  if (data[i][3] == 'Z')
    points[i] = points[i]+6
    if data[i][1] == 'A'
      points[i] = points[i]+2
    elseif data[i][1] == 'B'
      points[i] = points[i]+3
    else
      points[i] = points[i]+1
    end

  #case of draw
  elseif (data[i][3] == 'Y')
    points[i] = points[i]+3
    if data[i][1] == 'A'
      points[i] = points[i]+1
    elseif data[i][1] == 'B'
      points[i] = points[i]+2
    else
      points[i] = points[i]+3
    end

  #case of lose
  else
    if data[i][1] == 'A'
      points[i] = points[i]+3
    elseif data[i][1] == 'B'
      points[i] = points[i]+1
    else
      points[i] = points[i]+2
    end

  end


end

println(sum(points))
