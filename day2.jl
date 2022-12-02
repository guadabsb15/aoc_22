using DelimitedFiles

# reading the input 
data = readdlm("input_day2",'\n')

n_data=length(data)

points = zeros(Int64,n_data)

# ok data looks like A space X for example
# the elements I'm interested in are in index 1 and 3 

#if data[1][2]==' ' 
#  println(data[1][3])
#end

#rock =  A, paper = B, scissors=C
#rock =  X, paper = Y, scissors=Z 


for i in eachindex(data)
  
  #case of win rock-paper, paper-scissors, scissors-rock 
  if ( (data[i][1] == 'A' && data[i][3] == 'Y') || (data[i][1] == 'B' && data[i][3] == 'Z')
      || (data[i][1] == 'C' && data[i][3] == 'X') )

    points[i] = points[i]+6
  end

  #case of draw
  if ( (data[i][1] == 'A' && data[i][3] == 'X') || (data[i][1] == 'B' && data[i][3] == 'Y')
      || (data[i][1] == 'C' && data[i][3] == 'Z') )

    points[i] = points[i]+3
  end

  #points for rock
  if data[i][3] == 'X'
    points[i] = points[i]+1
  end 
  #points for paper
  if data[i][3] == 'Y'
    points[i] = points[i]+2 
  end
  #points for scissors
  if data[i][3] == 'Z'
    points[i] = points[i]+3 
  end

end

println(sum(points))
