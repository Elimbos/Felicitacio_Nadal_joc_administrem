void menuConfig()
{

  //Títols de les opcions per a canviar música i imatge
  textFont(fontBlack); //Font en negreta
  textSize(0.02*height); //Mesura més gran de la font
  text("Fons de pantalla:", width/2, ((height/2)-(0.01*height))-(int)(0.01*height));
  text("Música:", width/2, ((height/2)+(0.09*height))-(int)(0.01*height));
  textFont(fontNormal); //Recupera la font habitual del text
  textSize(0.01*height); //Recupera la mesura correcta de text.
  
  if (imgFonsOpcio) //Si 'imgFonsOpcio == true'
  {
    menu.getController("ARBREDENADAL").show(); //...mostra el botó "Arbre de Nadal"
    menu.getController("ESPELMESIARMONIA").hide(); //... i oculta el botó d' "Espelmes i armonia"
  }
  
  else //Si 'imgFonsOpcio == false'
  {
    menu.getController("ESPELMESIARMONIA").show(); //...mostra el botó "Arbre de Nadal"
    menu.getController("ARBREDENADAL").hide(); //... i oculta el botó d' "Espelmes i armonia"
  }
  
  // Tipus de música: 0 = 'Magical Christmas holidays' || 1 = 'Winter fun' || 2 = Music OFF
  
  if (ctrlMusic==0) //Si el valor de la variable és 0...
  {
    menu.getController("CHRISTMAS").show(); //...mostra el botó "Magical Christmas Holidays"...
    menu.getController("WINTER").hide(); //...oculta el botó "Winter Fun"...
    menu.getController("NOMUSIC").hide(); //...oculta el botó "Sense música"...
    textSize(0.01*height); //...redueix la mesura del text...
    text("Magical Christmas Holidays (short version) by AudioCoffee\nhttps://freesound.org/s/760971/ -- License: Attribution NonCommercial 4.0", width/2, 0.95*height); //...atribueix la musica...
    textSize(0.02*height); //...i recupera la mesura correcta de text.
    
  }
  if (ctrlMusic==1) //Si el valor de la variable és 1...
  {
    menu.getController("CHRISTMAS").hide(); //...oculta el botó "Magical Christmas Holidays"...
    menu.getController("WINTER").show(); //...mostra el botó "Winter Fun"...
    menu.getController("NOMUSIC").hide(); //...oculta el botó "Sense música"...
    text("Winter Fun (short ver.) by AudioCoffee\nhttps://freesound.org/s/717284/ -- License: Attribution NonCommercial 4.0", width/2, 0.95*height); //...atribueix la musica...
    textSize(0.02*height); //...i recupera la mesura correcta de text.
    
  }
  if (ctrlMusic==2)
  {
    menu.getController("CHRISTMAS").hide(); //...oculta el botó "Magical Christmas Holidays"...
    menu.getController("WINTER").hide(); //...oculta el botó "Winter Fun"...
    menu.getController("NOMUSIC").show(); //...mostra el botó "Sense música".
    
  }

  menu.getController("CONFIGURACIO").hide(); //...oculta el botó "Menú Configuració".
  menu.getController("JUGAR").hide(); //...oculta el botó "Menú Jugar".
  menu.getController("SORTIR").hide(); //...oculta el botó "Sortir".
  menu.getController("MENUPRINCIPAL").show(); //...mostra el botó "Menú Principal".
  menu.getController("INICIARPARTIDA").hide(); //...oculta el botó "Iniciar Partida"
}
