
//Accions a realitzar quan és prem el ratolí
void mousePressed()
{ 

/*********************************************************
 **********************JOC INTERACTIU*********************
 *********************************************************/

 if (ctrlMenu==2) //Si està actiu el menú de del joc interactiu...
 { 
   
   if(!jocIniciat) //...i el joc no està iniciat...
   { 
    
    if(!instruccions) //...i no s'està mirant les instruccions... 
    {  
      
      if((mouseY>(height/2)-(0.19*height)) && (mouseY<(height/2)-(0.19*height)+ampleIMG/3)) //...i el ratolí està entre les coordenades Y de la selecció de personatges...
      { 
        //...mapeja la posició en X del ratoli, que estigui entre inici i final de la selecció de personatges, a aquesta posició els hi assignarà
        //valors entre '1' i '3', convertint-los a enters i els assignarà a la variable 'personatge', això permetrà conèixer el personatge seleccionat per al joc.
        personatge = (int)map(mouseX, extremEsqX, extremDretX, 1, 4);       
      }  
         
      if(mouseX > (width/2+ampleIMG/3) && mouseX < extremDretX) //...i les coordendes X son les de la icona de les instruccions...
      { 
        
        if(mouseY > height-(0.1*height) && mouseY < height) //... i les coordenades Y també son les de la icona de les instruccion...
        { 
          instruccions=true;    //...mostra les instruccions.
        } 
      } 
    } 
    
    else //... però, si sí està mirant les instruccions...
    { 
      instruccions=false; //...llavors les amaga.
    } 
   } 
   
   else //Si el joc SÍ està iniciat (if(jocIniciat))...
   { 
     if(mouseX > (width/2+ampleIMG/3) && mouseX < extremDretX) //...i les coordendes X son les de la icona de sortida...
     { 
        
        if(mouseY > height-(0.1*height) && mouseY < height) //... i les coordenades Y també son les de la icona de sortida...
        { 
          restablirValors(); //...Retorna al Menú Principal
        } 
     }   
     
     else //Si és clica a quaselvol lloc fora de l'icona de la sortida...
     { 
       if(!mostrarResultat) //Si no està mostrant ja el resultat...
       { 
         jocEnPausa=true; //...pausa el joc...
         mostrarResultat=true; //...activa mostrar resultats per a desactivar certes parts que interfereixen...
         controlEncert(); //...comprova si ha estat encert o ha fallat.
         tempsInicialResultats = millis(); //Inicia el control del temps per a controlar els resultats
       } 
     } 
   } 
 } 
} 
