require 'rubygems'
require 'nokogiri'  
require 'open-uri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"
page = Nokogiri::HTML(URI.open(PAGE_URL))

def parsing_table(page, num)
  
  array = []
  crypto = []
  prix = []

  # on sélectionn toutes les link avec le prix, on prend le texte et le met dans une array
  page.css('div.cmc-table__table-wrapper-outer tr.cmc-table-row   td.cmc-table__cell--sort-by__price a').take(num).each do |link|
    prix_f  = link.text.tr('$', '').to_f
    prix << prix_f
  end

  # on sélectionn toutes les link avec le symbole, on prend le texte et le met dans une array
  page.css('div.cmc-table__table-wrapper-outer tr.cmc-table-row   td.cmc-table__cell--sort-by__symbol').take(num).each do |link|
    crypto << link.text
  end

  #on construit l'array
  num.times do |i|
    result = Hash.new   
    result[crypto[i]]= prix[i]
    array << result
  end

  return array
  
end


def check_table(array)

  boolean = true

  #array vide
  if array.size == 0 
    boolean = false
  end

  #array ne contient pas des hash
  for item in array
    if !(item.is_a? Hash)
      boolean = false
    end
  end

  return boolean

end
