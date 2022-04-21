require 'rubygems'
require 'nokogiri'  
require 'open-uri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"
page = Nokogiri::HTML(URI.open(PAGE_URL))

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
  page.css('div.cmc-table__table-wrapper-outer tr.cmc-table-row   td.cmc-table__cell--sort-by__price a').take(num).each do |link|
    prix_f  = link.text.tr('$', '').to_f
    prix << prix_f
  end

  page.css('div.cmc-table__table-wrapper-outer tr.cmc-table-row   td.cmc-table__cell--sort-by__symbol').take(num).each do |link|
    crypto << link.text
  end

  num.times do |i|
    result = Hash.new   
    result[crypto[i]]= prix[i]
    array << result
  end

  return array
  
end


def check_table(array)

  boolean = true

  if array.size == 0 
    boolean = false
    puts "jdjd"
  end

  for item in array
    if !(item.is_a? Hash)
      boolean = false
    end
  end

  return boolean

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
# page.css('div.cmc-table__table-wrapper-outer tr.cmc-table-row   td.cmc-table__cell--sort-by__price a').take(num).each do |link|
#   prix << link.text
# end

# page.css('div.cmc-table__table-wrapper-outer tr.cmc-table-row a.cmc-table__column-name--name').each do |link|
#   crypto << link.text
# end

# puts prix.size
# puts crypto.size

# puts page.css('div.cmc-table__table-wrapper-outer   td.cmc-table__cell--sort-by__price a').size

# p parsing_table(page, 20)


# puts page.css('div.cmc-table__table-wrapper-outer tr.cmc-table-row   td.cmc-table__cell--sort-by__price a').take(5)
