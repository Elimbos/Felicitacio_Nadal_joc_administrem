//Funció necessària per a controlar els botons mitjançant ControlP5

void controlEvent(ControlEvent menus)
{
  String boto = menus.getName(); 
  
  /*******MENÚ PRINCIPAL********/
  
  //BOTÓ DE CONFIGURACIÓ
  if(boto.equals("CONFIGURACIO") && tempsActual-tempsInicial > 5000.0 && ctrlMenu==0) //Si el botó clicat és el de CONFIGURACIÓ i han passat més dels 5s de la felicitació...
  {
    ctrlMenu = 1; //...canvia 'ctrlMenu' a 1...
  }
  
  //BOTÓ DE JUGAR
  else if(boto.equals("JUGAR") && tempsActual-tempsInicial > 5000.0 && ctrlMenu==0) //Si el botó clicat és el de JUGAR i han passat més dels 5s de la felicitació...
  {
    ctrlMenu = 2; //...canvia 'ctrlmenu' a 2...
  }
  
  //BOTÓ DE SORTIR
  else if(boto.equals("SORTIR") && tempsActual-tempsInicial > 5000.0 && ctrlMenu==0) //Si el botó clicat és el de SORTIR i han passat més dels 5s de la felicitació...
  {
    ctrlMenu = 3; //...canvia 'ctrlMenu' a 3, el que desencadena un esdeveniment que finalitza amb el tancament del programa.
    tempsInicial = millis(); //Reinicia el comptador de temps per a la despedida
  }
  
  /*******MENÚ CONFIGURACIÓ********/
  
  //BOTONS DE CANVI DE FONS
  else if ((boto.equals("ARBREDENADAL") || boto.equals("ESPELMESIARMONIA")) && ctrlMenu==1) //Si es fa clic a un dels botons de canvi de fons de pantalla...
  {
    imgFonsOpcio = !imgFonsOpcio; //Canvia el valor booleà de la variable per a mostrar l'altra imatge
  }
  
  //BOTONS DE CANVI DE MUSICA
  else if (boto.equals("CHRISTMAS") && ctrlMusic==0)
  {
    ctrlMusic=1;
    christmas.pause(); //...pausa la canço 'christmas'...
    winter.play(); //...engega la canço 'winter'...
    winter.loop(); //...repeteix la canço en bucle.
  }
  else if (boto.equals("WINTER") && ctrlMusic==1)
  {
    ctrlMusic=2;
    winter.pause(); //...pausa la canço 'Winter'.
  }
  else if (boto.equals("NOMUSIC") && ctrlMusic==2)
  {
    ctrlMusic=0;
    christmas.play(); //...engega la canço "christmas"...
    christmas.loop(); //...repeteix la canço en bucle.
  }
    
  //BOTÓ DE MENÚ PRINCIPAL
  else if(boto.equals("MENUPRINCIPAL")) //Si el botó clicat és el de MENÚ PRINCIPAL...
  {
    if(ctrlMenu==2) //Si està al menú de Joc...
    {
      personatge=0; //...des-selecciona qualsevol personatge.
    }
    ctrlMenu = 0; //...canvia 'ctrlMenu' a 0, el que retorna al menú principal.
  }
  
  //BOTÓ DE MENÚ PRINCIPAL
  else if(boto.equals("INICIARPARTIDA")  && personatge!=0) //Si el botó clicat és el de INICIAR PARTIDA quan està habilitat...
  {
    tempsJocAnterior = millis(); //...inicia el temps al joc per a calcular la velocitat de desplaçament...
    tempsInicialJoc = millis(); //...inicia el temps per a calcular la durada de la partida
    jocIniciat=true; //...QUÈ COMENCI LA PARTIDA!!
  }
}

  
    
