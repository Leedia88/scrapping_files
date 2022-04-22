require_relative "../lib/mairie_scrap"

# a = [
#   { "ville_1" => "email_1" },
#   { "ville_2" => "email_2" }, 
#   etc
# ]

# Pour les tests, ce sera la même chose que pour l'exercice précédent mais appliqué aux deux méthodes : 
#des tests de fonctionnement de base et des tests de cohérence du résultat.

describe "test de fonctionnement de la fonction de récupération de l'adresse email" do

    it "test de la fonction get_townhall url" do
        exept(get_townhall_email("Ableiges")).to eq("mairie.ableiges95@wanadoo.fr")
    end
end

describe "test de fonctionnnement de la fonctio du bon format email @" do
    it ""
end
