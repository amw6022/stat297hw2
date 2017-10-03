#Fizz Buzz Problem
array = c()

for (i in 1:1000) {
  if (i %% 3 == 0){
    if (i %% 5 == 0){
      q = "Fizz Buzz"
      array[i] <- q
    }else{
      r = "Fizz"
      array[i] <- r
    }
  }else if (i %% 5 == 0){
    s = "Buzz"
    array[i] <- s
  }else{
    array[i] <- i
  }  
}

print(array)

#Map Problem