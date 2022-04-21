# Le CEO de Get-email Corp a besoin de tes services. Il voudrait toutes les adresses e-mail des mairies du Val d'Oise. 
#Aucun souci pour toi. Va sur cet annuaire des mairies et récupère les adresses e-mails des mairies du Val d'Oise. 
#Comme pour l'exercice précédent, tu devras enregistrer les données dans un array de hash suivant ce format :

# a = [
#   { "ville_1" => "email_1" },
#   { "ville_2" => "email_2" }, 
#   etc
# ]

# Décomposons le programme en 2 sous-problème simples:

#     Tu dois être capable d'obtenir un e-mail de mairie à partir de la page de cette dernière 
#(pas en partant du listing complet des mairies). Fais d'abord une méthode get_townhall_email(townhall_url) 
#qui récupère l’e-mail d'une mairie à partir de l'URL de mairies, par exemple celle de Avernes.
#     Une fois que tu sais le faire pour une mairie, tu vas vouloir industrialiser et répéter ça sur tout 
#l'annuaire du Val d'Oise. La prochaine étape est de coder une méthode get_townhall_urls qui récupère les URLs 
#de chaque ville du Val d'Oise.

# Quand tu es assez sûr que chaque méthode marche séparément, tu as juste à imbriquer les deux et à toi la gloire.

# Pour les tests, ce sera la même chose que pour l'exercice précédent mais appliqué aux deux méthodes : 
#des tests de fonctionnement de base et des tests de cohérence du résultat.

require 'rubygems'
require 'nokogiri'  
require 'open-uri'


def xpath_email(pagenoko)
    return pagenoko.xpath('//main/section[2]/table/tbody/tr[4]/td[2]')
end

def get_nokopage(url)
    return Nokogiri::HTML(URI.open(url))
end


def get_townhall_email(townhall_url)
    email = Nokogiri::HTML(URI.open(townhall_url)).xpath('//main/section[2]//table/tbody/tr[4]/td[2]').text
    return email
end

def get_townhall_urls(townhall_url)
    array = []
    email_liste =[]
    Nokogiri::HTML(URI.open(townhall_url)).xpath("//a[@class='lientxt']/@href").each do |link|
        # email_liste << get_townhall_email("http://annuaire-des-mairies.com#{link.text[1..-1]}")
        result = Hash.new
        result[link.text[5..-6].capitalize] = get_townhall_email("http://annuaire-des-mairies.com#{link.text[1..-1]}")
        array << result
    end

    return array
    #pour chaque ville, on construit l'email/ on applique la fonction get et on ajoute l'email à la liste
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
