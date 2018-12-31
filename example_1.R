library("microbenchmark")

# con loops --------------------------------------------------------------------

sum_loop <- function(numbers){
  
  result <- 0
  
  for(number in 1:numbers){
   
    result <- result + number
    print(result) 
    
  }
}

some_numbers <- as.numeric(1e3)

microbenchmark(
  
  sum_loop(some_numbers),
  sum(some_numbers)

) 

sum_loop_bc <- compiler::cmpfun(sum_loop)

microbenchmark(
  
  sum_loop(some_numbers),
  sum(some_numbers),
  sum_loop_bc(some_numbers)

) 

compiler::disassemble(sum_loop)

