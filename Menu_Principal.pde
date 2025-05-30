void menuPrincipal()
{
  if(tempsActual-tempsInicial > 5000.0 && ctrlMenu==0)  //Si han passat més de 5s de l'inici i ctrlMenu == 0...
  {
  //Mostra i oculta els botons
    menu.getController("CONFIGURACIO").show(); //...mostra el botó "Menú Configuració".
    menu.getController("JUGAR").show(); //...mostra el botó "Menú Jugar".
    menu.getController("SORTIR").show(); //...mostra el botó "Sortir".
    menu.getController("ESPELMESIARMONIA").hide(); //...oculta el botó "Arbre de Nadal"
    menu.getController("ARBREDENADAL").hide(); //... i oculta el botó d' "Espelmes i armonia"
    menu.getController("CHRISTMAS").hide(); //...oculta el botó "Magical Christmas Holidays"...
    menu.getController("WINTER").hide(); //...oculta el botó "Winter Fun"...
    menu.getController("NOMUSIC").hide(); //...oculta el botó "Sense música"...
    menu.getController("MENUPRINCIPAL").hide(); //...oculta el botó "Menú Principal".
    menu.getController("INICIARPARTIDA").hide(); //...oculta el botó "Iniciar Partida".
 }
}


    
