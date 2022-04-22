require 'rubygems'
require 'nokogiri'  
require 'open-uri'

# a = [
#   { "ville_1" => "email_1" },
#   { "ville_2" => "email_2" }, 
#   etc
# ]

# Pour les tests, ce sera la même chose que pour l'exercice précédent mais appliqué aux deux méthodes : 
#des tests de fonctionnement de base et des tests de cohérence du résultat.

# def xpath_email(pagenoko)
#     return pagenoko.xpath('//main/section[2]/table/tbody/tr[4]/td[2]')
# end
# def get_nokopage(url)
#     return Nokogiri::HTML(URI.open(url))
# end

def get_townhall_email(townhall_url)
    email = Nokogiri::HTML(URI.open(townhall_url)).xpath('//main/section[2]//table/tbody/tr[4]/td[2]').text
    return email
end

def get_townhall_urls(townhall_url)
    array = [] #array de hash

    #on récupère les nodes, pour chaque ville, on construit l'email/ on applique la fonction get et on ajoute l'email à la liste
    Nokogiri::HTML(URI.open(townhall_url)).xpath("//a[@class='lientxt']/@href").each do |link|
        result = Hash.new
        result[link.text[5..-6].capitalize] = get_townhall_email("http://annuaire-des-mairies.com#{link.text[1..-1]}")
        array << result
    end
    return array
    
end

#puts Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/95/avernes.html")).xpath('//main/section[2]//table/tbody/tr[4]/td[2]').text

# .xpath('//main/section[2]//table/tbody/tr[4]/td[2]').text

#.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')

# puts get_townhall_email("http://annuaire-des-mairies.com/95/avernes.html")

# Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html")).xpath("//a[@class='lientxt']/@href").each do |link|
#     puts link
# end

puts get_townhall_urls("http://annuaire-des-mairies.com/val-d-oise.html")


#"//a[@class='lientxt']")
