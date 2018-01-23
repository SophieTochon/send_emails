Hello ! 

Pour info : 

- Le programme "scrapping.rb" va chercher les mails des mairies de Paris et les retourne sous la forme d'un hash
- Le programme "get_the_email_html.rb" contient une fonction qui retourne le corps du mail à envoyer, histoire d'éviter de pourir le programme suivant avec des lignes de texte
- Le programme "send_emails.rb" :

  - Créé un spreadsheet, remplit la colonne A avec le nom des mairies et la colonne B avec le mail qui y correspond
  - Envoie un mail personnalisé à chaque mairie à l'aide de deux méthode : send_email_to_line et go_through_all_the_lines

Si tu souhaites tester le programme, tu dois :

- Importer, dans le dossier que tu auras téléchargé, un fichier config.json qui contient tes propres clés
- Renseigner ton mail et ton mot de passe Gmail dans le fichier send_emails.rb, ligne 30

Pour désactiver / réactiver la protection Google : https://myaccount.google.com/lesssecureapps

Si tu exécutes le programme send_emails.rb, il renverra un mail à toutes les mairies à Paris. Pense à remplacer mon prénom par le tien dans le corps du mail !

Pour toute question tu peux me contacter sur Slack, @ Sophie Tochon

Allez bisous !
