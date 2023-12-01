library(data.table)
source('getter.R') # see https://stackoverflow.com/a/77583836/1040035


# Part 1 -----------------------------------------------------------------------
calibration_values <- get_aoc(1, 2023) # download data as a text string (ask if you want get_aoc() source code)

sum(sapply(tstrsplit(calibration_values, '\n'), function(value){
  value_digits <- gsub('[^0-9.-]', '', value)
  as.numeric(paste0(strsplit(value_digits, '')[[1]][c(1, nchar(value_digits))], collapse=''))
}))


# Part 2 -----------------------------------------------------------------------
calibration_values <- get_aoc(1, 2023) 

numbers <- c('one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine')
names(numbers) <- 1:9

# This will swap strings of numbers (e.g. one) to one1one. 
#  - Digit is sandwiched with original string to handle overlap
#      e.g. twone should be 21, but changing one to 1 would give tw1, while 
#           the looped sandwich approach gives twone1one first, then 21
for(number in numbers){
  calibration_values <- gsub(number, 
                             paste0(number, names(numbers)[numbers==number], number), 
                             calibration_values)
}

sum(sapply(tstrsplit(calibration_values, '\n'), function(value){
  value_digits <- gsub('[^0-9.-]', '', value)
  as.numeric(paste0(strsplit(value_digits, '')[[1]][c(1, nchar(value_digits))], collapse=''))
}))
