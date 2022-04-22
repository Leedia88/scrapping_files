require 'rubygems'
require 'nokogiri'  
require 'open-uri'


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

def perform
    puts get_townhall_urls("http://annuaire-des-mairies.com/val-d-oise.html")
end

perform