using DelimitedFiles

# reading the input 
data = readdlm("input_day5", '\n')

#the first 3 lines have the stack info
const nlines= 8
stacks_data = data[1:nlines]

const ncol = 9 #the stacks have 3 columns
#columns with the letters we care about are 2, 6, 10... (2+(n-1)*4)
columns = [ 2+(n-1)*4 for n=1:ncol ]

stack1 = Char[]
stacks = Any[]


for j in eachindex(columns) 
  #Prepare the stacks "list of lists"
  push!(stacks,copy(stack1))
  #fill list of list in order to have top in text at top of list
  for i in eachindex(stacks_data)
    if data[nlines+1-i][columns[j]] != ' '
      push!(stacks[j],stacks_data[nlines+1-i][columns[j]])
    end
  end

end


#get information for motions
for i in data[3:end]
  moves=match(r"move (\d+) from (\d+) to (\d+)",i)
  #do moves for the lines that have moves
  if moves != nothing
    n_moves = parse(Int64,moves[1])
    from_s = parse(Int64,moves[2])
    to_s = parse(Int64,moves[3])
    for m in 1:n_moves      #some version of pop stack[moves[2]] and push stack[moves[3]]
      item = pop!(stacks[from_s])
      push!(stacks[to_s],item)
    end 
  end   
end


final_string=""

#collect the positions at the top
for i in stacks
  global final_string=string(final_string,i[end]) 
end


println(final_string)
