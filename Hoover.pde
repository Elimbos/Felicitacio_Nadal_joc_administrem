
  /*********************************************************
   ****MENU PRINCIPAL - CONFIGURACIÓ - JOC INTERACTIU*******
   *********************************************************/
void hoover()
{ //(1)X
  //Declaració de variables per a simplificar el codi a nivell local
  float xBotons = (width/2-((2*height)/10));
  float yBoto1 = (height/2)-(0.01*height);
  float yBoto2 = (height/2)+(0.09*height);
  float yBoto3 = (height/2)+(0.19*height);
  float llargBoto = ((2*height)/5);
  float ampleBoto = (0.06*height);
  float ySeleccio = (height/2)-(0.19*height);
  float ampleSeleccio = (ampleIMG/3);
  float xOpcions = (width/2+ampleIMG/3);
  float yOpcions = (height-(0.1*height));

  cursor(ARROW); //Cursor per defecte.
  
  if ((tempsActual-tempsInicial > 5000.0 && ctrlMenu==0) || ctrlMenu==1) //Si no està dintre dels primers 5 segons de la felicitació per a evitar clics involuntaris i està al Menú principal, o bé està a CONFIGURACIÓ...
  {
    
    if   ((mouseX > xBotons) && (mouseX < xBotons + llargBoto)) //...i el ratolí està dintre les coordenades X dels botons...
    {
      
      if (  (mouseY > yBoto1 && mouseY < yBoto1 + ampleBoto)
         || (mouseY > yBoto2 && mouseY < yBoto2 + ampleBoto)
         || (mouseY > yBoto3 && mouseY < yBoto3 + ampleBoto)) //...i el ratolí està dintre les coordenades Y dels tres botons...
      {
        cursor(HAND); //...canvia el punter a premut.
      } 
    }
  }
  
  else if (ctrlMenu==2 && !jocIniciat) //Si està al menú Joc i el joc no està iniciat...
  {
    
    if ((mouseX > xBotons) && (mouseX < xBotons + llargBoto)) //...i el ratolí està dintre les coordenades X dels botons...
    {
      
      if (((mouseY > yBoto2 && mouseY < yBoto2 + ampleBoto) && personatge!=0)
       || (mouseY > yBoto3 && mouseY < yBoto3 + ampleBoto))//...i el ratolí està dintre les coordenades Y del botó d'iniciar partida habilitat...
      {
        cursor(HAND); //...canvia el punter a premut.
      }
     }     
     
    if ((mouseX > extremEsqX) && (mouseX < extremDretX)) //Si el ratolí està dintre les coordenades X de la selecció de personatges...
    {
      
      if((mouseY > ySeleccio) && (mouseY < ySeleccio + ampleSeleccio)) //...o bé, el ratolí està dintre les coordenades Y de la selecció de personatges...
      {
        cursor(HAND); //...canvia el punter a premut.
      }
            
     if(mouseX > xOpcions && mouseX < extremDretX) //...i està a les coordenades X d'instruccions...
     {
        
        if(mouseY > yOpcions && mouseY < height) //...i també a les coordenades Y d'instruccions...
        {
          cursor(HAND); //...canvia el punter a premut.   
        }
     }   
    }
  }
   
   else if(ctrlMenu==2 && jocIniciat) //Si està al menú joc i el joc SÍ està iniciat...
   { 
     
     if(mouseX > xOpcions && mouseX < extremDretX) //...i les coordendes X son les de la icona de sortida...
     { 
        
        if(mouseY > yOpcions && mouseY < height) //... i les coordenades Y també son les de la icona de sortida...
        { 
          cursor(HAND); //...canvia el punter a premut.
        }
     }
   } 
} 
