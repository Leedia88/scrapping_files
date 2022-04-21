require 'rubygems'
require 'nokogiri'  
require 'open-uri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"
page = Nokogiri::HTML(open(PAGE_URL))

puts page.class

puts page.css('title').text


# a = [
#   { "BTC" => 5245.12 },
#   { "ETH" => 217.34 }, 
#   etc
# ]

  #prix  :    page.css('div.cmc-table__table-wrapper-outer tr.cmc-table-row   td.cmc-table__cell--sort-by__price a')
  # td.cmc-table__cell--sort-by__price a
  # pour chaque tr ligne
  # on stocke le prix et le nom de la crypto

def parsing_table(page, num)
  #page.css(div.cmc-table--sort-by__rank td)
  
  array = []
  crypto = []
  prix = []

  # on sélectionn toutes les link avec le prix, on prend le texte et le met dans une array
  page.css('div.cmc-table__table-wrapper-outer tr.cmc-table-row   td.cmc-table__cell--sort-by__price a').each do |link|
    prix << link.text
  end

  page.css('div.cmc-table__table-wrapper-outer tr.cmc-table-row a.cmc-table__column-name--name').each do |link|
    crypto << link.text
  end

  num.times do |i|
    result = Hash.new
    puts "c'est #{i}"    
    result[crypto[i]]= prix[i]
    array << result
    puts result
  end

  return array
  
end

#XPATH
# //h3[@class='r']/a[@class='l'] #direct parent
# //ha//a #parent at ani level


# page.xpath("//tbody//a[@class='cmc-table__column-name--symbol cmc-link']").each do |currency| 
#   puts currency.text
# end

# puts page.css('div.cmc-table__table-wrapper-outer table')
# puts fetch_prices(page)
# parsing_table(page) 
# lignes = page.css('div.cmc-table__table-wrapper-outer tr.cmc-table-row')
# puts "la classe de lignes #{lignes.class}"
# result = Hash.new
# result[lignes.css('a.cmc-link')]= lignes.css('td.cmc-table__cell--sort-by__price a')
# puts result

# crypto = []
# prix = []
# page.css('div.cmc-table__table-wrapper-outer tr.cmc-table-row   td.cmc-table__cell--sort-by__price a').each do |link|
#   prix << link.text
# end

# page.css('div.cmc-table__table-wrapper-outer tr.cmc-table-row a.cmc-table__column-name--name').each do |link|
#   crypto << link.text
# end

# puts prix.size
# puts crypto.size

puts page.css('div.cmc-table__table-wrapper-outer   td.cmc-table__cell--sort-by__price a').size

p parsing_table(page, 20)


