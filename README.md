# Scrapping exercices  

#### Détail des exercices  
---------------
  
## Dark scrap  
En prenant pour source le site CoinMarketCap, fait un programme qui récupère le cours de toutes les cryptomonnaies et les enregistre bien proprement dans un array de hashs.  
`a = [  `  
  `{ "BTC" => 5245.12 },  `  
  `{ "ETH" => 217.34 },   `  
  `etc  `  
`]  `  
* Tout se jouera sur la rédaction d'un XPath pertinent et précis qui extrait juste ce qu'il faut d'éléments HTML. Puis un bon traitement de ces éléments pour en extraire les 2 infos dont tu as besoin : le nom des crypto et leur cours.  
N'hésite pas à découper ton programme en plusieurs étapes simples et dont le fonctionnement est facile à vérifier. 
  
1. Isoler les éléments HTML qui vont bien  
2. En extraire le texte et mettre ça dans un hash  
3. Réorganiser ce hash dans un array de plusieurs mini-hash comme demandé.  
* Pense à bien nommer tes variables pour ne pas te perdre !  
* Mets des puts dans ton code pour que ton terminal affiche quelque chose à chaque fois qu'il a pu récupérer une donnée.  
  
### Tests  
1. le fonctionnement de base de ton programme (pas d'erreur ni de retour vide) et   
2.  que ton programme sort bien un array cohérent (vérifier la présence de 2-3 cryptomonnaies, vérifier que l’array est de taille cohérente, etc.).  
-------------------
## Mairie Scrap  
Va sur cet annuaire des mairies et récupère les adresses e-mails des mairies du Val d'Oise. Comme pour l'exercice précédent, tu devras enregistrer les données dans un array de hash suivant ce format  
`a = [  `  
  `{ "ville_1" => "email_1" }, `   
  `{ "ville_2" => "email_2" }, `  
  `etc  `  
`]  `  
