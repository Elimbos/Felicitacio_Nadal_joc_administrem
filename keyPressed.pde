void keyPressed()
{
  if(jocIniciat)
  {
    if(key==32)
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
