void menuJoc()
{ //(1)X
  textAlign(CENTER); //Centra el text
  
  /***** CODI PER AL JOC NO INICIAT *****/
  
  if(!jocIniciat) //Si el joc no està iniciat...
  {  
    //Mostra i oculta els botons
    menu.getController("CONFIGURACIO").hide(); //...oculta el botó "Menú Configuració".
    menu.getController("JUGAR").hide(); //...oculta el botó "Menú Jugar".
    menu.getController("SORTIR").hide(); //...oculta el botó "Sortir".
    menu.getController("ESPELMESIARMONIA").hide(); //...oculta el botó "Arbre de Nadal"
    menu.getController("ARBREDENADAL").hide(); //... i oculta el botó d' "Espelmes i armonia"
    menu.getController("CHRISTMAS").hide(); //...oculta el botó "Magical Christmas Holidays"...
    menu.getController("WINTER").hide(); //...oculta el botó "Winter Fun"...
    menu.getController("NOMUSIC").hide(); //...oculta el botó "Sense música"...
    menu.getController("MENUPRINCIPAL").show(); //...mostra el botó "Menú Principal".
    menu.getController("INICIARPARTIDA").show(); //...mostra el botó "Iniciar Partida".
    
    
    if(!instruccions) //Si les instruccions no estan actives...
    {
      background(255); //...posa el fons en blanc.
      fill(0); //...posa emplenat negre per garantir que és veu el text sempre
      textFont(fontBlack); //Font en negreta
      textSize(0.02*height); //Mesura més gran de la font
      text("Selecciona el personatge", width/2, height/4); //...text de selecció de personatge
      textFont(fontNormal); //Recupera la font habitual del text
      textSize(0.01*height); //Recupera la mesura correcta de text.
      imageMode(CENTER); //Centra les imatges, m'ajuda a tenir una millor referència per als personatges
      noFill(); //...elimina l'emplenat per a fer els quadres.
      
      for(int i=1; i<=3;i++)  //Dibuixa uns quadres on aniran les imatges per a seleccionar personatge
      { 
        rect(extremEsqX+(i*ampleIMG/3)-ampleIMG/3, (height/2)-(0.19*height), ampleIMG/3, ampleIMG/3); //En proporció a 'i' de valor de 1 a 3, crea tres quadres centrals.
        
        if(i==1 && ctrlMenu==2)
        { 
          
          if(personatge!=1) //Si no està seleccionat aquest primer personatge)...
          { 
            image(femDreta, extremEsqX+(i*ampleIMG/3)-ampleIMG/6, (height/2)-(0.19*height)+ampleIMG/6); //... i inserta imatge amb aparença femenina.
          } 
          
          else //No obstant, si sí està seleccionat aquest primer personatge...
          { 
            image(femSelect, extremEsqX+(i*ampleIMG/3)-ampleIMG/6, (height/2)-(0.19*height)+ampleIMG/6); //...i inserta imatge amb aparença femenina amb selecció.
          } 
        }
      
        else if(i==2)
        { 
        
          if(personatge!=2) //Si no està seleccionat aquest segon personatge)...
          { 
            image(masDreta, extremEsqX+(i*ampleIMG/3)-ampleIMG/6, (height/2)-(0.19*height)+ampleIMG/6); //...i inserta imatge amb aparença masculina.
          } 
        
          else //No obstant, si sí està seleccionat aquest segon personatge...
          { 
            image(masSelect, extremEsqX+(i*ampleIMG/3)-ampleIMG/6, (height/2)-(0.19*height)+ampleIMG/6); //...i inserta imatge amb aparença masculina amb selecció.
          } 
        } 
      
        else
        { 
         
          if(personatge!=3) //Si no està seleccionat aquest tercer personatge)...
          { 
            image(figDreta, extremEsqX+(i*ampleIMG/3)-ampleIMG/6, (height/2)-(0.19*height)+ampleIMG/6); //...i inserta imatge neutra.
          } 
       
          else //No obstant, si sí està seleccionat aquest tercer personatge...
          { 
            image(figSelect, extremEsqX+(i*ampleIMG/3)-ampleIMG/6, (height/2)-(0.19*height)+ampleIMG/6); //...i inserta imatge neutra amb selecció.
          } 
        } 
      } 
      
      if(personatge==0) //Si no hi ha cap personatge seleccionat...
      { 
        menu.getController("INICIARPARTIDA").setColorBackground(color(180)); // ...estableix un color gris apagat...
        menu.getController("INICIARPARTIDA").setColorActive(color(180)); // ...no mostra efectes de hoover...
        menu.getController("INICIARPARTIDA").lock(); //...bloqueja el botó
      } 
  
      else //Si hi ha algun personatge seleccionat...
      { 
        menu.getController("INICIARPARTIDA").setColorBackground(color(248, 177, 55)); // ...estableix un color corporatiu del client...
        menu.getController("INICIARPARTIDA").setColorActive(color(79, 164, 255)); // ...estableix el color complementari per al hoover...
        menu.getController("INICIARPARTIDA").unlock(); //...desbloqueja el botó
      } 

      imgBaixDreta(instruccionsIMG, extremDretX+20, height); //...i situa la icona d'instruccions.
    } 
    
    /****** CODI PER A LES INSTRUCCIONS DE COM JUGAR ***/
    
    else //...però si les instruccions sí ho estan d'actives... (if(instruccions))
    { 
      background(255); //Situo el fons en blanc.    
      text("Instruccions:\n\n" +
           "El nostre personatge, és dedica a l'administració, però és totalment\n" +
           "mancat d’orientació, així que necessitarà la nostra ajuda per a atendre\n" +
           "la seva clientela, per això necessita visitar les seves comunitats.\n\n" +
           
           "l joc és molt senzill, el nostre personatge anirà donant voltes\n" +
           "mb desorientació, passant per davant dels portals sense veure’ls.\n" +
           "a nostra missió és avisar quan està just davant per evitar que passi\n" +
           "el portal de llarg.\n\n" +
           
           "Per a avisar és pot fer un toc o clic a la pantalla, excepte a la\n" +
           "icona de sortida situada a l’extrem inferior dret, o bé, si és disposa\n" +
           "de teclat, utilitzar la tecla ESPAI.\n\n" +
           
           "COMPTE! No és igual d’anada que de tornada! Si al arribar al portal,\n" +
           "té la meitat del cos dins, sabrà veure l’entrada; però si, en canvi,\n" +
           "passa de llarg amb només la punta del peu... ja no serà capaç de trobar-la!\n\n" + 
           
           "Té només cinc oportunitats d’errar el portal abans de fer tard, perdre\n" +
           "massa clientela i haver de plegar.\n\n" +
           
           "Com que és una persona molt atabalada, d’una visita a una altra cada\n" +
           "cop va amb més pressa i li resulta més fàcil equivocar-se. No obstant\n" +
           "això, com també és una persona molt optimista, com més a prop està de la\n" +
           "catàstrofe, més fàcil li resulta recuperar-se si aconsegueix una bona ratxa!\n\n" +
           
           "Podràs ajudar el nostre personatge a fer les seves visites?\n\n\n\n" +
           
           "- Incrementa la velocitat a cada nivell.\n\n" +
           "- Puntuació: 15 punts per nivell superat +5 punts per nivell de ratxa\n" +
           "  d'encerts consecutius (p.e. ratxa de 3 encerts 15 + 5x3 = 30 punts).\n\n" +
           "- Recuperació de vides per ratxes exitoses:\n" +
           "   · 1 vida a 2 vides: 3 nivells consecutius.\n" +
           "   · 2 vides a 3 vides: 6 nivells consecutius.\n" +
           "   · 3 vides a 4 vides: 9 nivells consecutius.\n" +
           "   · 4 vides a 5 vides: 12 nivells consecutius.", width/2, 0.05*height);
      
      imgBaixDreta(exit, extremDretX+20, height); //...i situa la icona de sortir.
    } 
  } 
  
  /***** AMB EL JOC INICIAT *****/
  
  else //Si el joc SÍ està iniciat (if(jocIniciat)
  { 
    
    //Oculta tots els botons
    menu.getController("CONFIGURACIO").hide(); //...oculta el botó "Menú Configuració".
    menu.getController("JUGAR").hide(); //...oculta el botó "Menú Jugar".
    menu.getController("SORTIR").hide(); //...oculta el botó "Sortir".
    menu.getController("ESPELMESIARMONIA").hide(); //...oculta el botó "Arbre de Nadal"
    menu.getController("ARBREDENADAL").hide(); //... i oculta el botó d' "Espelmes i armonia"
    menu.getController("CHRISTMAS").hide(); //...oculta el botó "Magical Christmas Holidays"...
    menu.getController("WINTER").hide(); //...oculta el botó "Winter Fun"...
    menu.getController("NOMUSIC").hide(); //...oculta el botó "Sense música"...
    menu.getController("MENUPRINCIPAL").hide(); //...oculta el botó "Menú Principal".
    menu.getController("INICIARPARTIDA").hide(); //...oculta el botó "Iniciar Partida".
  
    centrarImatge(fonsJoc); //Centra la imatge de fons amb l'edifici del joc.
    
    personatgeSelect(personatge); //S'executa la funció per a assignar al joc el personatge seleccionat.
    
    calculMoviment(nivell); //S'executa la funció que calcula la velocitat de moviment segons nivell.
  
    
    marcadorVides(vides); //S'executa la funció que mostra les vides restants.
    
    image(personatgeJugable, posJocX, 2.04*height/3); //Posiciona el personatge jugable a la zona de la porta.   
    
    
    
    /***** AMB EL JOC SENSE PAUSA *****/
    
    if(!jocEnPausa) //Si el joc NO està pausat...
    { 
      
      /***** GESTIONA EL SENTIT DE DESPLAÇAMENT DEL PERSONATGE *****/
      
      if(sentitDreta) //...i el personatge és desplaça fins a la dreta...
      { 
        posJocX += moviment; //...s'incrementa la posició segons el moviment obtingut aquell frame.
      
        if(posJocX >= extremDretX) //Si arriba al límit de la imatge a l'extrem de la dreta...
        { 
          sentitDreta=false; //Canvia el sentit cap a l'esquerra.
        } 
      } 
    
      else //...i el personatge és desplaça fins a l'esquerra (if(!sentitDreta))...
      { 
        posJocX -= moviment; //...és redueix la seva posició segons el moviment obtingut aquell frame.
      
        if(posJocX <= extremEsqX) //Si arriba al límit de la imatge a l'extrem de l'esquerra...
        { 
          sentitDreta=true; //Canvia el sentit cap a la dreta.
        } 
      }  
    } 
    
    if(sumarVida) //Si el comptador ha arribat al nivell necessari per a sumar una vida...
    {
      vides++; //...suma una vida...
      sumarVida=false; //...i torna a desactivar el comptador.
    }
    
    /***** AMB EL JOC EN PAUSA *****/
    else   //Si el joc ha estat pausat...
    { 
        if (mostrarResultat) //...i no està mostrant els resultats...
        {
          reiniciarRonda(); //...mostra resultats i reinicia la ronda.
        } 
    } 
  
  if(!mostrarResultat) //Si no està mostrant el resultat...
  {
    textSize(0.05*height); //Engrandeix el text
    text("NIVELL  " + nivell, width/2, (4*height)/5); //Indica el nivell actual
    textSize(0.025*height); //Retorna a la mesura de text per defecte
    tempsJoc = ((millis() - tempsInicialJoc) / 1000); //Calcula el temps en segons
    text("Temps de joc: " + tempsJoc + " seg.", width/2, ((4*height)/5)+0.05*height); //Mostra el temps de durada de partida
    text("Puntuació: " + puntuacio, width/2, ((4*height)/5)+0.1*height); //Mostra la puntuació obtinguda.
  }
    
  imgBaixDreta(exit, extremDretX+20, height); //...i situa la icona de sortir.
  } 
} 
