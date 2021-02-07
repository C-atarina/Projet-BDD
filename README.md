# Projet-BDD

Nous devions gérer une base de données avec 3 milions de data.  
Il fallait dans un premier temps la nétoyer pour pouvoir répondre aux souhaits des dieux ci-dessous :  
  
I. Par province, le top 5 des divinités préférées.  
II. Le prix moyen de chaque équipement, indépendamment de la divinité, des pouvoirs et des décorations.  
III. La divinité la plus demandée par toutes les provinces (en terme de nombre total d’objets vendus).  
IV. Une comparaison (la plus visuelle possible) de la progression des ventes en Ægypte avec celle des autres provinces. L’objectif est de mettre en évidence l’intérêt ou non d’une action particulière à mener pour augmenter les ventes dans cette contrée.  
V. Le résultat de la comparaison du calendrier des fêtes religieuses avec les ventes. L’objectif est de contrôler si ces fêtes ont un impact sur les ventes. (Par exemple, y a-t-il une augmentation des ventes d’objets à l’effigie d’Athéna ou liés par leur pouvoir à Athéna lors du mois Scirophorion ? Si oui, il faut quantifier cette augmentation)  
VI. Le résultat de la comparaison du calendrier des guerres avec les ventes par province. L’objectif est de contrôler s’il y a une relation ou non entre les deux.  
VII. Une procédure simple et ergonomique permettant l’ajout d’une nouvelle vente (avec toutes les informations nécessaires).  
VIII. La quantification de l’impact sur les ventes des dons d’objet aux demi-dieux. On veut savoir si les dons aux demi-dieux pendant les guerres auxquelles ils ont participé ont permis d’augmenter les ventes d’objets similaires dans la contrée en guerre. Il s’agit donc d’une comparaison des ventes « avant les dons » par rapport à « après ces dons ».  
IX. Une vue simplifiée permettant de mettre en évidence la progression des ventes par artisan.  
X. Un tableau qui permet de rapprocher l’artisan (ou le binôme d’artisans) de la divinité qui lui est la plus demandée en fonction du prix de vente.  
XI. La vérification de l’intérêt financier d’équiper des demi-dieux. On souhaite ici chiffrer par demi-dieu la différence entre le montant approximatif du don (approximatif car le montant exact n'est pas donné) et l'augmentation des ventes si elle existe.  
XII. La liste des provinces qui préfèrent payer en Oberon d’or.  
  
Je me suis chargé du nettoyage de la base dans sa totalité, malheuresement, je n'ai pas pu récupérer la totalité des requêtes SQL utilisé pour répondres aux souhaits.
