class PlayerMailer < ApplicationMailer
  default from: 'franchyz@protonmail.com'
 
  def welcome_email(player)
    #on récupère l'instance player pour ensuite pouvoir la passer à la view en @player
    @player = player 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://github.com/TacosTHP/Franchyz' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @player.email, subject: 'Bienvenue chez Franchyz !') 
  end
end
