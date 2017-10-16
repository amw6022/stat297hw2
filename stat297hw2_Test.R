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

big10 = read_html("http://www.bigten.org/library/stats/fb-confsked.html#standings")
big10 %>%
  html_nodes(".b1gfbstats:nth-child(9) td:nth-child(1) , .b1gfbstats:nth-child(6) td:nth-child(1)") %>%
  html_text() -> uni_name
uni_name = paste(uni_name, "University")
uni_coord = data.frame(geocode(uni_name))
big10 %>%
  html_nodes("td:nth-child(7)") %>%
  html_text() -> uni_wp
uni_coord$wp = 100*as.numeric(uni_wp[1:length(uni_name)])
uni_coord$conf = rep(c('East Division', 'West Division'), each = length(uni_name)/2)

uni_coord
names(uni_coord)[names(uni_coord) == 'conf'] = 'Division'
library(mapproj)
states = map_data('state')
conf_states = subset(states, region %in% c('south dakota', 'nebraska','kansas', 'minnesota', 'iowa', 'missouri', 'wisconsin', 'illinois', 'indiana', 'michigan', 'ohio', 'west virginia', 'pennsylvania', 'maryland', 'new jersey'))