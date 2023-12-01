library(httr)

session <- '53616c7465645f5fa84d9a2bcf370ca36123953f95972af75a9f05096890e9e0b9607a39917472bfd7488f1d371946f51e8221d257940d11bf50db994146ff0c'
get_aoc <- function(day, year, ck=session){
  rawToChar(GET(paste0('https://adventofcode.com/', year,'/day/', day, '/input'), 
                set_cookies(session=ck))$content)
}