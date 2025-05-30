/*********************************************************
*************************FUNCIÓ***************************
**********************************************************/

//Funció per a controlar el pas del temps i saber su han passat els 5 segons
float controlTemps()
{
 float controlTempsActual; //Variable local on copiar el temps actual
  
 controlTempsActual = millis(); //S'assigna el temps actual que ha passat des de l'inici del programa en mil·lisegons
 
 return controlTempsActual;  //La funció retorna el temps actual
}

/*********************************************************
*************************FUNCIÓ***************************
**********************************************************/

//Funció per a centrar la imatge i alleugerir el codi evitant repeticions
void centrarImatge(PImage imatge)
{
  imatge.resize(0, height); //S'assigna que sempre ocupi tota l'alçada de la pantalla, si s'ha de retallar que sigui sempre pels laterals
  
  image(imatge, width/2, height/2); // Situa la imatge segons la variable booleana
}

/*********************************************************
*************************FUNCIÓ***************************
**********************************************************/

/*OBSERVACIÓ IMPORTANT: Al crear els botons dels diferents menús, s'ha observat un problema d'ajust.
  El programa i la imatge està pensada per a utilitzar-se en telèfons mòbils, si s'executa en un ordinador
  aquesta manté la proporció amb la imatge centrada deixant el blanc als voltants, com en aquest casos
  width serà molt més gran que l'ample de la imatge, com la orginal té unes dimensions de 1125x2436px,
  enlloc d'utilitzar 'width' s'utilitzarà la proporcionalitat 'height*(1125/2436)' que serà desat en una
  variable per a facilitar l'ús.*/

/*OBSERVACIÓ ADDICIONAL: Pot succeïr que hi hagi dispositius amb pantalles més estretes que la relació de la imatge,
  per a aquests casos mitjançant una comprovació de si 'height*(1125/2436) > width' és verificarà, si resulta que
  efectivament, la pantalla és més estreta que la proporcionalitat d'amplada de la imatge, s'assignarà a aquella
  variable el valor de width.*/

//Creo una funció per a comprovar els aspectes anteriors i retornar el valor adequat per a l'amplada.
float ampleImatge()
{
  float ampleIMG; //Variable local per als càlculs
  
  //Comprova si la pantalla és més estreta que l'amplada de la imatge
  
  if (height*(1125/2436) > width) ampleIMG = width; //Sí és més ampla la imatge que la pantalla... assigna el valor de la pantalla
  
  else ampleIMG = height*(1125.0/2436.0); //En canvi, si la pantalla és més ampla que l'amplada de la imatge... assigna el valor proporcional de l'amplada de la imatge.
  
  return ampleIMG; //Retorna el valor utilitzat per a l'amplada de la imatge
}

/*********************************************************
*************************FUNCIÓ***************************
**********************************************************/

//Funció que mostra la FELICITACIÓ
void mostrarFelicitacio()
{
  if (imgFonsOpcio) imgFons = feliArbre; //Si 'imgFonsOpcio == true... mostrarà la FELICITACIÓ de l'arbre de Nadal i el mateix fons.
    
  else imgFons = feliVeles; //En canvi, si és fals... mostrarà la FELICITACIÓ de les espelmes i el mateix fons.
   
  centrarImatge(imgFons); //Centra la imatge
}

/*********************************************************
*************************FUNCIÓ***************************
**********************************************************/

//Funció que mostra la DESPEDIDA
void mostrarDespedida()
{
  //Ocultar tots els botons
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
  
  if (imgFonsOpcio) imgFons = despArbre; //Si 'imgFonsOpcio == true... mostrarà la DESPEDIDA de l'arbre de Nadal i el mateix fons.
        
  else imgFons = despVeles; //En canvi, si és fals... mostrarà la DESPEDIDA de les espelmes i el mateix fons.
  
  centrarImatge(imgFons); //Centra la imatge
}


/*********************************************************
*************************FUNCIÓ***************************
**********************************************************/

//Funció que permet situar les imatges especificant l'extrem inferior dret (per a instruccions i sortida)
void imgBaixDreta(PImage img, float x, float y)
{
  image(img, x-img.width, y-img.height); //Insereix una imatge on a la posició X indicada li resta l'amplada i a la posició Y l'alçada de manera automàtica.
}

//Funció per a canviar el text quan hi ha o quan no hi ha instruccions obertes
void reiniciarRonda()
{  
  
  if (estatPartida == comprovarEstat.ERROR && jocEnPausa) //...i ha estat per errar durant la partida...
  {
      
    if(vides==1) //...i era la teva última vida, durant un màxim de 5 segons...
    {
      
      if(millis() - tempsInicialResultats <=6000) //...i el temps és menor a 5 segons...
      {
         centrarImatge(fonsJoc); //...centra la imatge de fons amb l'edifici del joc...
         image(personatgeJugable, posJocX, 2.04*height/3); //...posiciona el personatge on s'ha quedat al pausar...
         textSize(0.05*height); //...engrandeix el text...
         fill(255,0,0); //...text en vermell...
         text("FI DE PARTIDA!", width/2, (4*height)/5); //...indica que has acabat les vides i finalitzat la partida...
         fill(0); //...torna el text en negre...
         textSize(0.025*height); //...retorna a la mesura de text per defecte... 
         text("Has arribat al nivell: " + nivell, width/2, ((4*height)/5)+0.05*height); //...mostra el nivell màxim obtingut...
         text("Has obtingut " + puntuacio + " punts", width/2, ((4*height)/5)+0.1*height); //...mostra la puntuació final obtinguda...
      }
      
      else if(millis() - tempsInicialResultats >6000)
      { 
         restablirValors(); //...Retorna al Menú Principal
      }
    }
       
    else if(vides>1) //...i et queda més d'una vida...
    {
       
       if(millis() - tempsInicialResultats <=3000) //...i el temps és menor o igual de 3 segons...
       {
         textSize(0.05*height); //...engrandeix el text...
         fill(255,0,0); //...text en vermell...
         text("HAS FALLAT!", width/2, (4*height)/5); //...indica que has fallat, però et resten més vides...
         fill(0); //...torna el text en negre...
         textSize(0.025*height); //...retorna a la mesura de text per defecte... 
         
         if(vides==2) //Si -a falta de restar la de la errada- et queda una sola vida...
         {
           text("Et queda " + (vides-1) + " vida.", width/2, ((4*height)/5)+0.05*height); //...mostra les vides restants si és la darrera en singular...
         }
         
         else //Si -a falta de restar la de la errada- et queda més d'una vida...
         {
           text("Et queden " + (vides-1) + " vides.", width/2, ((4*height)/5)+0.05*height); //...mostra les vides restants si és la darrera en plural...
         }
         text("Per a recuperar una vida\nnecessites " + (vides-1)*3 + " encerts seguits", width/2, ((4*height)/5)+0.1*height); //...mostra els encerts faltants per a una nova vida...
       } 
       
       else if(millis() - tempsInicialResultats >3000) //...i el temps és major de 3 segons...
       { 
         vides--; //...resta una vida
         ratxaEncerts = 0; //...reinicia el control de ratxes.
         posJocX = (int)extremEsqX; //S'estableix la posició inicial
         sentitDreta=true; //S'estableix el sentit cap a la dreta
         estatPartida = comprovarEstat.JUGANT; //Torna a la partida
         jocEnPausa=false; //Treu la pausa
         mostrarResultat=false; //Ja deixen de mostrar-se els resultats.
       }
    }
  }
 
  else if (estatPartida == comprovarEstat.ENCERT && jocEnPausa) //...i ha estat un encert a la partida...
  {
      if(millis() - tempsInicialResultats <=3000) //...i el temps és menor a 5 segons...
      { 
        textSize(0.05*height); //...engrandeix el text...
        fill(0,255,0); //...text en verd...
        text("HAS ENCERTAT!", width/2, (4*height)/5); //...indica que has encertat...
        fill(0); //...torna el text en negre...
        textSize(0.025*height); //...retorna a la mesura de text per defecte...
        
        if((ratxaEncerts+1) >= 3*vides && vides<5) //Comprova si la ratxa permet obtenir vides (1→2 vides = Ratxa 5, 2→3 = 10, 3→4 = 15, 4→5 = 20; Max 5 vides)
        {
          text("Et queden " + (vides+1) + " vides.", width/2, ((4*height)/5)+0.05*height); //...mostra les vides restants amb la que guanya aquesta ronda...
        } 
        
        else //Comprova si no guanya una vida per encerts repetitius.
        { 
        
          if(vides==1) //Si estàs a la teva darrera vida...
          {
            text("Et queda " + vides + " vida.", width/2, ((4*height)/5)+0.05*height); //...mostra les vides restants sense afegir vides en singular...
          }
          
          else //Si tens més d'una vida...
          {
            text("Et queden " + vides + " vides.", width/2, ((4*height)/5)+0.05*height); //...mostra les vides restants sense afegir vides en plural...
          }
        } 
        
        text("Obtens " + (15+(5*(ratxaEncerts+1))) + " punts", width/2, ((4*height)/5)+0.1*height); //...mostra els punts obtinguts...
      } 
      
      else if(millis() - tempsInicialResultats >3000)
      {
        nivell++; //...augmenta un nivell...
        ratxaEncerts++; //...actualitza la ratxa d'encerts...
        puntuacio = puntuacio+15+5*ratxaEncerts; //La puntuació son 15 punts per nivell + 5 punts per cada ratxa d'encerts
        
        if(ratxaEncerts >= 3*vides && vides<5) //Comprova si la ratxa permet obtenir vides (1→2 vides = Ratxa 5, 2→3 = 10, 3→4 = 15, 4→5 = 20; Max 5 vides)
        { 
          sumarVida=true; //Suma una vida si no en tenia ja 5.
          ratxaEncerts = 0; //Reinicia la ratxa.
        } 
      
        posJocX = (int)extremEsqX; //S'estableix la posició inicial
        sentitDreta=true; //S'estableix el sentit cap a la dreta
        estatPartida = comprovarEstat.JUGANT; //Torna a la partida
        jocEnPausa=false; //Treu la pausa
        mostrarResultat=false; //Ja deixen de mostrar-se els resultats.
      } 
  } 
}

/*********************************************************
*************************FUNCIÓ***************************
**********************************************************/

//Funció per a situar el personatge seleccionat a la posició inicial del joc.
void personatgeSelect(int personatge)
{
  if(personatge==1) //Si està seleccionat el personatge amb aparença femenina...
  {
    if(sentitDreta) //Si el personatge és desplaça cap a la dreta...
    {
      personatgeJugable = femDreta; //... assigna com a 'personatgeJugable' la imatge amb aparença femenina mirant a la dreta.
    }
    
    else //Si el personatges és desplaça cap a l'esquerra...
    {
      personatgeJugable = femEsq; //... assigna com a 'personatgeJugable' la imatge amb aparença femenina mirant a l'esquerra.
    }
  }
  
  else if(personatge==2) //Si està seleccionat el personatge amb aparença masculina...
  {  
    if(sentitDreta) //Si el personatge és desplaça cap a la dreta...
    {
      personatgeJugable = masDreta; //... assigna com a 'personatgeJugable' la imatge amb aparença masculina mirant a la dreta.
    }
    
    else //Si el personatges és desplaça cap a l'esquerra...
    {
      personatgeJugable = masEsq; //... assigna com a 'personatgeJugable' la imatge amb aparença masculina mirant a l'esquerra.
    }
  }
  
  else //Si està seleccionat el personatge amb aparença neutra...
  {  
    if(sentitDreta) //Si el personatge és desplaça cap a la dreta...
    {
      personatgeJugable = figDreta; //... assigna com a 'personatgeJugable' la imatge amb aparença neutra mirant a la dreta.
    }
    
    else //Si el personatges és desplaça cap a l'esquerra...
    {
      personatgeJugable = figEsq; //... assigna com a 'personatgeJugable' la imatge amb aparença neutra mirant a l'esquerra.
    }
  }   
}  


/*********************************************************
*************************FUNCIÓ***************************
**********************************************************/

//Funció per a calcular la velocitat de desplaçament en píxels/temps.
void calculMoviment(int nivell)
{
  long diferenciaTemps; //Variable local per a calcular la diferencia entre temps anterior i actual.
  tempsJocActual = millis(); //Assigna a 'tempsActual' el temps que hi ha actualment.
  diferenciaTemps = tempsJocActual-tempsJocAnterior; //Calcula la diferencia de temps.
  tempsJocAnterior = tempsJocActual; //Passa el valor actual al temps anterior per a calcular el proper frame.
  moviment = ((150+50*nivell)*diferenciaTemps)/1000.0; //Velocitat inicial 175px/s + 25px/s cada nivell d'increment, càlcul part proporcional segons temps passat. 
} 

/*********************************************************
*************************FUNCIÓ***************************
**********************************************************/

//Funció per a mostrar el marcador de vides en funció de les vides disponibles.
void marcadorVides(int vides)
{
  if (vides == 5) //Si el comptador de vides és igual a 5...
  {
    image(cincVides, width/2, height/6); //...inserta imatge amb 5 vides.
  }
  
  else if (vides == 4) //Si el comptador de vides és igual a 4...
  {
    image(quatreVides, width/2, height/6); //...inserta imatge amb 4 vides.
  }
  
  else if (vides == 3) //Si el comptador de vides és igual a 3...
  {
    image(tresVides, width/2, height/6); //...inserta imatge amb 3 vides.
  }
  
  else if (vides == 2) //Si el comptador de vides és igual a 2...
  {
    image(dosVides, width/2, height/6); //...inserta imatge amb 2 vides.
  }
  
    else if (vides == 1) //Si el comptador de vides és igual a 1...
  {
    image(unaVida, width/2, height/6); //...inserta imatge amb 1 vida.
  }
}

/*********************************************************
*************************FUNCIÓ***************************
**********************************************************/

//Funció per a controlar si ha encertat al pausar.
void controlEncert()
{
  if(((posJocX >= minXSentitDret && posJocX <= maxXSentitDret) && sentitDreta) || ((posJocX >= minXSentitEsq && posJocX <= maxXSentitEsq) && !sentitDreta)) //Si la posició en X està entre els extrems correctes en el sentit indicat...
  {
    estatPartida = comprovarEstat.ENCERT; //...indica al sistema que ha encertat.
    yuju.play(); //...i reprodueix so d'encert.
  }
  
  else //Si la posició en X està fora del rang correcte en el sentit corresponent...
  {
    estatPartida = comprovarEstat.ERROR; //...indica al sistema que ha errat.
    oops.play(); //...i reprodueix so d'errada.
  }
} 

/*********************************************************
*************************FUNCIÓ***************************
**********************************************************/

//Funció per a restablir totes les variables al valor per defecte.
void restablirValors()
{
  ctrlMenu = 0;
  personatge = 0;
  nivell = 1;
  vides = 5;
  posJocX = (int)extremEsqX;
  ratxaEncerts = 0; 
  puntuacio = 0;
  jocIniciat=false;
  instruccions=false;
  sentitDreta=true;
  jocEnPausa=false;
  mostrarResultat = false;
  estatPartida = comprovarEstat.JUGANT;
} 

      
