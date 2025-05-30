/********LLIBRERIA DE SONS*********/
import processing.sound.*;

/********LLIBRERIA DE CONTROLP5*********/
import controlP5.*;
ControlP5 menu;



/********FONTS********/
PFont fontNormal, fontBlack;
ControlFont fontBotons;

/********IMATGES*********/

//Variables de les imatges
PImage feliArbre, feliVeles, fonsArbre, fonsVeles, fonsJoc, despArbre, despVeles;

//Variables de les imatges dels personatges del joc
PImage femDreta, femSelect, femEsq, masDreta, masSelect, masEsq, figDreta, figSelect, figEsq;

//Variable de la imatges d'opcions del joc
PImage exit, instruccionsIMG;

//Variable per a assignar imatge al fons
PImage imgFons;

//Variable per al personatge jugable
PImage personatgeJugable;

//Variables de les vides restants
PImage unaVida, dosVides, tresVides, quatreVides, cincVides;

/********SONS*********/
//Variables dels sons de musica ambient.
SoundFile christmas, winter;

//Variables d'efectes de so del joc.
SoundFile yuju, oops;

/********ENTERS*********/



//Declaro variable per a controlar quin és el menú actiu: 0 = Principal || 1 = Config || 2 = Run || 3 = Exit, finalitzaria el programa.
int ctrlMenu = 0;

//Declaro variable per a controlar quina música sona: 0 = 'Magical Christmas holidays' || 1 = 'Winter fun' || 2 = Music OFF.
int ctrlMusic = 0;

//Declaro variable per a guardar el valor del personatge seleccionat: 0 = No assignat (per a evitar errors) 1 = Aparença femenina || 2 = Masculí || 3 = Figura de pal.
int personatge = 0;

//Declara una variable per a poder calcular l'alçada de la imatge per a la selecció de personatge.
int alcadaPers, alcadaPersSelect;

//Declara una variable per a poder calcular les dimensions de les imatges d'opcions del Joc
int ampleOpcions, ampleVides;

//Variable per a saber a quin nivell del joc s'està jugant, per defecte comença a nivell 1.
int nivell = 1;

//Variable per al comptador de vides, per defecte sempre comença amb 5 vides.
int vides = 5;

//Variable per a saber a saber la ubicació a l'eix X del personatge del joc.
int posJocX; 

//Variable per a controlar la ratxa d'encerts per a recuperar vides.
int ratxaEncerts = 0; 

/********LLARGS*********/

//Variables per a controlar el temps dintre del joc, aquestes son per a CONTROLA EL TEMPS RELATIU PER A AL VELOCITAT.
long tempsJocAnterior, tempsJocActual;

//Variables per a controlar el temps dintre del joc, aquestes son per a CONTROLA EL TEMPS ABSOLUT DE DURADA DE PARTIDA.
long tempsInicialJoc, tempsJoc;

//Variables per a controlar el temps de mostra dels resultats.
long tempsInicialResultats;

//Variable per a controlar la puntuació:
long puntuacio = 0;

/********BOOLEÀ*********/

//Declaro variable booleana per a intercanviar entre ambdúes imatges
boolean imgFonsOpcio=true;

//Variable per a saber si el joc està iniciat o no per si ha de mostrar la selecció de personatges.
boolean jocIniciat=false;

//Variable per a saber si les instruccions estan actives o no
boolean instruccions=false;

//Variable per a saber el sentit de desplaçament durant el joc
boolean sentitDreta=true;

//Variable per a saber si el joc està en pausa
boolean jocEnPausa=false;

//Variable per controlar el temps quan és mostra el resultat de la ronda.
boolean mostrarResultat = false;

//Variable per controlar la suma de les vides.
boolean sumarVida = false;

/********FLOAT*********/

//Declaro variable per a controlar el temps inicial per a calcular els 5s
float tempsInicial;

//Declaro variable per a controlar el temps actual, que servirà de referència per a saber si han passat 5s des de tempsInicial
float tempsActual;

// Declaro les variables dels botons de les opcions del menú
float ampleIMG;

//S'utilitzava molt aquest extrem per a situar elements, per tant és simplifica per a facilitar el codi, s'assignarà posteriorment el valor ja que encaran o hi ha valors assignats.
float extremDretX;
float extremEsqX;


float x= extremEsqX;
float y= 0.1*height;


//Variable amb la qual s'anirà movent el personatge del joc
float moviment;

//Variable que controla els límits de la porta, on és considera un encert.
float minXSentitDret, maxXSentitDret, minXSentitEsq, maxXSentitEsq;

/********ENUM*********/

enum comprovarEstat {
  JUGANT,
  ERROR,
  ENCERT
}

//Per a simplificar s'utilitzarà un ENUM, de manera que amb aquesta variable pugui comprovar-se si aquell cicle encara juga, o bé, si s'ha pausat i per tant s'ha de verificar l'encert.
comprovarEstat estatPartida = comprovarEstat.JUGANT;

void setup()
{
  //Pantalla completa
  fullScreen();
  
  ampleIMG = height*(1125.0/2436.0);
  
  extremDretX = width/2+ampleIMG/2;
  extremEsqX = width/2-ampleIMG/2;
  
  println(height, width, ampleIMG);
  /****** GESTIÓ DE LES FONTS ******/
  
  //Font Arial per a textos generals
  fontNormal = createFont("Arial", (int)(0.01*height));
  
  //Font Arial Black per a botons
  fontBlack = createFont("Arial Black", (int)(0.02*height));
  fontBotons = new ControlFont(fontBlack, (int)(0.02*height));

  /**** GESTIÓ DE CONTROLP5 *****/
  menu = new ControlP5(this);
 
  strokeWeight(2); //Amplada del gruix de línia
  
  //És creen els botons que quedaran ocults pel moment
  crearBotons();
  
  //S'assigna el valor a l'alçada de la imatge per a la selecció de personatges.
  alcadaPers = (int)(2*ampleIMG)/10; //Els requadres tenen una alçada d'AmpleIMG/3 (33,33%), aquesta operació garanteix una alçada del 20%, inferior però responsiva amb qualsevol dispositiu.
  alcadaPersSelect = (int)(3*ampleIMG)/10; //Els requadres tenen una alçada d'AmpleIMG/3 (33,33%), aquesta operació garanteix una alçada del 30%, lleugerament inferior però responsiva amb qualsevol dispositiu.
  
  //S'assigna el valor de l'amplada de les imatges d'opcions del joc (instruccions i sortir)
  ampleOpcions = (int)(0.1*ampleIMG);
  
  //S'assigna el valor per a controlar els límits de la porta, on és considera un encert, és fa responsiu per a que funcioni en qualsevol dispositiu.
  minXSentitDret = width/2-0.045*ampleIMG;
  maxXSentitDret = width/2+0.035*ampleIMG;
  minXSentitEsq = width/2-0.015*ampleIMG;
  maxXSentitEsq = width/2+0.07*ampleIMG;
  
  posJocX = (int)extremEsqX; //S'estableix la posició inicial
  
  //S'assigna a les imatges a les respectives variables d'imatge
  feliArbre = loadImage("Felicitacio_arbre.png");
  feliVeles = loadImage("Felicitacio_veles.png");
  fonsArbre = loadImage("Fons_arbre.png");
  fonsVeles = loadImage("Fons_veles.png");
  fonsJoc = loadImage("Fons_joc.png");
  despArbre = loadImage("Despedida_arbre.png");
  despVeles = loadImage("Despedida_veles.png");
  
  //S'assigna a les imatges als personatges del joc
  femDreta = loadImage("Femeni_dreta.png");
  femEsq = loadImage("Femeni_esquerra.png");
  masDreta = loadImage("Masculi_dreta.png");
  masEsq = loadImage("Masculi_esquerra.png");
  figDreta = loadImage("Figura_dreta.png");
  figEsq = loadImage("Figura_esquerra.png");
  
  //S'assigna a les imatges dels personatges seleccionats
  femSelect = loadImage("Femeni_dreta_select.png");
  masSelect = loadImage("Masculi_dreta_select.png");
  figSelect = loadImage("Figura_dreta_select.png");
  
  //S'assigna a les imatges de funcions addiconals del joc
  exit = loadImage("exit.png");
  instruccionsIMG = loadImage("instruccions.png");

  //S'assigna a les imatges de les vides restants al joc
  unaVida = loadImage("un_cor.png");
  dosVides = loadImage("dos_cors.png");
  tresVides = loadImage("tres_cors.png");
  quatreVides = loadImage("quatre_cors.png");
  cincVides = loadImage("cinc_cors.png");

  //Es redimensionen totes les imatges en funció de les dimensions de la pantalla, el que les farà responsives, aquestes és mantindran durant tota l'execució.
  femDreta.resize(0, alcadaPers);
  femEsq.resize(0, alcadaPers);
  femSelect.resize(0, alcadaPersSelect);
  
  masDreta.resize(0, alcadaPers);
  masEsq.resize(0, alcadaPers);
  masSelect.resize(0, alcadaPersSelect);
  
  figDreta.resize(0, alcadaPers);
  figEsq.resize(0, alcadaPers);
  figSelect.resize(0, alcadaPersSelect);
  
  instruccionsIMG.resize(ampleOpcions, 0);
  exit.resize(ampleOpcions, 0);
  
  cincVides.resize((int)ampleIMG/2, 0);
  quatreVides.resize((int)ampleIMG/2, 0);
  tresVides.resize((int)ampleIMG/2, 0);
  dosVides.resize((int)ampleIMG/2, 0);
  unaVida.resize((int)ampleIMG/2, 0);
  
  //És centra la imatge
  imageMode(CENTER);
  
  /****** GESTIÓ DELS SONS ******/    
    
  //S'assignen els sons a les respectives variables de so
  christmas = new SoundFile(this, "magical-christmas-holidays.wav");
  winter = new SoundFile(this, "winter-fun.wav");
  yuju = new SoundFile(this, "yuju.mp3");
  oops = new SoundFile(this, "oops.wav");
  
  //Engega la música, per defecte 'christmas".
  christmas.play();
  christmas.loop();

  /****** GESTIÓ DEL TEMPS ******/
    
  //S'assigna el valor de millis() a tempsInicial
  tempsInicial = millis();
  /*NOTA: Inicialment la declarava al prinicpi amb valor 0.0, però he comprovat mitjançant un println, que durant el procés de càrrega
  és perdien certs mil·lisegons, en concret uns 2300ms aprox (2.3s) a l'ordinador utilitzat, per tant, assignar el valor al final de setup() amb el valor de 
  millis() fa que realment la imatge inicial sí estigui 5 segons complets i no només uns 2.7 segons.*/
  
  //println(tempsInicial);   //Deixo anotat com a comentari la prova que he realitzat per si és vol comprovar
  
}


void draw()
{  
  tempsActual = controlTemps(); //S'executa la funció controlTemps() que anirà verificant el pas del temps i assigno el valor a tempsActual
  
  fill(0);
  textAlign(CENTER); //...és centren tots els textos.
  
  hoover(); //És crida la funció per a fer hoover al ratolí quan pertoca
  
  //Neteja del fons.
  background(255);
  
  if (ctrlMenu==3) //Si s'ha seleccionat el botó 'Sortir' al Menú Principal...
  {
    if (tempsActual-tempsInicial <= 5000.0) //...i el temps entre tempsInicial i tempsActual hi ha 5 segons o menys de diferència...
        {
          mostrarDespedida(); //...mostarà el missatge de despedida.
        }
    else if (tempsActual-tempsInicial > 5000.0) //...en canvi, si el temps entre tempsInicial i tempsActual hi ha més de 5 segons de diferència...
    {
      exit(); //...tanca el programa.
    }
  }
  else //En canvi, si no s'ha seleccionat el botó 'Sortir' al Menú Principal...
  {
    if (tempsActual-tempsInicial <= 5000.0) //...i el temps entre tempsInicial i tempsActual hi ha 5 segons o menys de diferència...
    {
      mostrarFelicitacio(); //...mostrarà el missatge de felicitació.
    }
    else if (tempsActual-tempsInicial > 5000.0) //...en canvi, si el temps entre tempsInicial i tempsActual hi ha més de 5 segons de diferència...
    
    //...executarà el programa a continuació.
    {
      if (imgFonsOpcio) imgFons = fonsArbre; //Si 'imgFonsOpcio == true'... assigna la imatge de l'arbre a la variable del fons.
      
      else imgFons = fonsVeles; //En canvi, si és falsa... assigna la imatge de les veles a la variable de fons.
  
      centrarImatge(imgFons); //Executa la funció centrarImatge que situa la imatge de fons i la centra per a que s'adapti de manera responsiva als diferents dispositius.

      //A través d'un switch, és controla quin menú serà visible en aquell moment segons el valor de ctrlMenu, el codi de cada està en funcions separades per a facilitat entesa   
      switch(ctrlMenu)
      {
        //Si el valor és '0' accedeix al Menú Principal
        case 0:
         menuPrincipal();
         break;
     
        //Si el valor és '1' accedeix al Menú Configuració
        case 1:
         menuConfig();
         break;  
       
        //Si el valor és '2' accedeix al Joc interactiu
        case 2:
         menuJoc();
         break;
      }
    }
  }
}
