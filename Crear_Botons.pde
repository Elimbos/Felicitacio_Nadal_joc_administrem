void crearBotons()
{
  /****BOTONS DEL MENÚ PRINCIPAL****/

  //Botó del menú de configuració
  menu.addButton("CONFIGURACIO")
      .setLabel("CONFIGURACIÓ")
      .setColorLabel(color(51, 51, 51))
      .setColorBackground(color(248, 177, 55)) //Color corporatiu Administrem
      .setColorActive(color(79, 164, 255)) //Color complementari
      .setPosition(width/2-((2*height)/10), (height/2)-(0.01*height))
      .setSize((int)((2*height)/5), (int)(0.06*height))
      .setFont(fontBotons)
      .hide();
      
  //Botó del menú del joc
  menu.addButton("JUGAR")
      .setLabel("JUGAR")
      .setColorLabel(color(51, 51, 51))
      .setColorBackground(color(248, 177, 55)) //Color corporatiu Administrem
      .setColorActive(color(79, 164, 255)) //Color complementari
      .setPosition(width/2-((2*height)/10), (height/2)+(0.09*height))
      .setSize((int)((2*height)/5), (int)(0.06*height))
      .setFont(fontBotons)
      .hide();
      
  //Botó del menú de sortir del programa
  menu.addButton("SORTIR")
      .setLabel("SORTIR")
      .setColorLabel(color(51, 51, 51))
      .setColorBackground(color(248, 177, 55)) //Color corporatiu Administrem
      .setColorActive(color(79, 164, 255)) //Color complementari
      .setPosition(width/2-((2*height)/10), (height/2)+(0.19*height))
      .setSize((int)((2*height)/5), (int)(0.06*height))
      .setFont(fontBotons)
      .hide();

  
  /****BOTONS DEL MENÚ CONFIGURACIÓ****/
  
  //Botons per a canviar el fons de pantalla
  menu.addButton("ARBREDENADAL")
      .setLabel("ARBRE DE NADAL")
      .setColorLabel(color(51, 51, 51))
      .setColorBackground(color(248, 177, 55)) //Color corporatiu Administrem
      .setColorActive(color(79, 164, 255)) //Color complementari
      .setPosition(width/2-((2*height)/10), (height/2)-(0.01*height))
      .setSize((int)((2*height)/5), (int)(0.06*height))
      .setFont(fontBotons)
      .hide();
      
    menu.addButton("ESPELMESIARMONIA")
      .setLabel("ESPELMES I ARMONIA")
      .setColorLabel(color(51, 51, 51))
      .setColorBackground(color(248, 177, 55)) //Color corporatiu Administrem
      .setColorActive(color(79, 164, 255)) //Color complementari
      .setPosition(width/2-((2*height)/10), (height/2)-(0.01*height))
      .setSize((int)((2*height)/5), (int)(0.06*height))
      .setFont(fontBotons)
      .hide();
      
  //Botons per a canviar la música
  menu.addButton("CHRISTMAS")
      .setLabel("MAGICAL CHRISTMAS HOLIDAYS")
      .setColorLabel(color(51, 51, 51))
      .setColorBackground(color(248, 177, 55)) //Color corporatiu Administrem
      .setColorActive(color(79, 164, 255)) //Color complementari
      .setPosition(width/2-((2*height)/10), (height/2)+(0.09*height))
      .setSize((int)((2*height)/5), (int)(0.06*height))
      .setFont(fontBotons)
      .hide();
      
  menu.addButton("WINTER")
      .setLabel("WINTER FUN")
      .setColorLabel(color(51, 51, 51))
      .setColorBackground(color(248, 177, 55)) //Color corporatiu Administrem
      .setColorActive(color(79, 164, 255)) //Color complementari
      .setPosition(width/2-((2*height)/10), (height/2)+(0.09*height))
      .setSize((int)((2*height)/5), (int)(0.06*height))
      .setFont(fontBotons)
      .hide();
      
  menu.addButton("NOMUSIC")
      .setLabel("MÚSICA APAGADA")
      .setColorLabel(color(51, 51, 51))
      .setColorBackground(color(248, 177, 55)) //Color corporatiu Administrem
      .setColorActive(color(79, 164, 255)) //Color complementari
      .setPosition(width/2-((2*height)/10), (height/2)+(0.09*height))
      .setSize((int)((2*height)/5), (int)(0.06*height))
      .setFont(fontBotons)
      .hide();
  
  /*** APROFITABLE PER MENÚ CONFIGURACIÓ I JUGAR ***/    
      
  //Botó per a tornar al Menú Principal
  menu.addButton("MENUPRINCIPAL")
      .setLabel("MENÚ PRINCIPAL")
      .setColorLabel(color(51, 51, 51))
      .setColorBackground(color(248, 177, 55)) //Color corporatiu Administrem
      .setColorActive(color(79, 164, 255)) //Color complementari
      .setPosition(width/2-((2*height)/10), (height/2)+(0.19*height))
      .setSize((int)((2*height)/5), (int)(0.06*height))
      .setFont(fontBotons)
      .hide();
      
  /****BOTONS DEL MENÚ JUGAR****/
  
    //Botó per a tornar al Menú Principal
  menu.addButton("INICIARPARTIDA")
      .setLabel("INICIAR PARTIDA")
      .setColorLabel(color(51, 51, 51))
      .setColorBackground(color(248, 177, 55)) //Color corporatiu Administrem
      .setColorActive(color(79, 164, 255)) //Color complementari
      .setPosition(width/2-((2*height)/10), (height/2)+(0.09*height))
      .setSize((int)((2*height)/5), (int)(0.06*height))
      .setFont(fontBotons)
      .hide();
}
