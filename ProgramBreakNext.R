# skips nr 3
for(i in 1:10){
  if(i == 3){
    next
  }
  print(i)
}

# break terminates 
for(i in 1:10){
  if(i == 4){
    break
  }
  print(i)
}
