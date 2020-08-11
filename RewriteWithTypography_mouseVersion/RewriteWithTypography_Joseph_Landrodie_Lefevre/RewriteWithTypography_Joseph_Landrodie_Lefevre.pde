
/**************************************************************************************************************************
Ce programme fonctionne initialement à l'aide d'un appareil qui traque la position des yeux en direct. 
Le programme ci-dessous est donc une version secondaire qui utilise la souris à la place du dispositif précédemment présenté.
La souris va remplacer le eye tracker mais cette dernière endossera le même rôle.
**************************************************************************************************************************/

Lettre[] arrayLettre = new Lettre[28]; //Création du tableau de lettre avec la classe Lettre


PFont f;
int startX = 50; //Variable qui initialise la position X
int startY = 50; //Variable qui initialise la position Y

void setup (){

  size(600,600); 
  fill(0);
  stroke(0);
  
  f = createFont("futur.ttf", 50); //ajout de la police
  textFont(f);
  textAlign(CENTER,CENTER);
  
  for(int i=0; i<arrayLettre.length; i++){ //Boucle qui permet de créer la position et couleur de la lettre
    arrayLettre[i] = new Lettre(startX, startY);
    if(startX >= 500){
      startY += 150;
      startX = 50;
    }
    else{
    startX +=80;
    }
  }

  arrayLettre[0].addLettre("W"); //Définition des lettres dans le tableau
  arrayLettre[1].addLettre("R");
  arrayLettre[2].addLettre("I");
  arrayLettre[3].addLettre("T");
  arrayLettre[4].addLettre("I");
  arrayLettre[5].addLettre("N");
  arrayLettre[6].addLettre("G");
  arrayLettre[7].addLettre("T");
  arrayLettre[8].addLettre("H");
  arrayLettre[9].addLettre("E");
  arrayLettre[10].addLettre("H");
  arrayLettre[11].addLettre("I");
  arrayLettre[12].addLettre("S");
  arrayLettre[13].addLettre("T");
  arrayLettre[14].addLettre("O");
  arrayLettre[15].addLettre("R");
  arrayLettre[16].addLettre("Y");
  arrayLettre[17].addLettre("O");
  arrayLettre[18].addLettre("F");
  arrayLettre[19].addLettre("T");
  arrayLettre[20].addLettre("H");
  arrayLettre[21].addLettre("E");
  arrayLettre[22].addLettre("F");
  arrayLettre[23].addLettre("U");
  arrayLettre[24].addLettre("T");
  arrayLettre[25].addLettre("U");
  arrayLettre[26].addLettre("R");
  arrayLettre[27].addLettre("E");
}

void draw (){
  background(255);
  noStroke();
  
  int nouvX = 50; //Variable qui initialise la position X
  int nouvY = 50; //Variable qui initialise la position Y
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      for(int i=0 ; i <arrayLettre.length; i++){
         arrayLettre[i].returningToStart = true;
      }
    }
  }
  if(mousePressed){ // Si on clique, les letres reviennent à leurs positions originales 
     for(int i=0; i<arrayLettre.length; i++){
         arrayLettre[i].x = nouvX;
         arrayLettre[i].y = nouvY;
         
         if(nouvX >= 500){
          nouvY += 150;
          nouvX = 50;
         }
         else{
         nouvX += 80;
         }
       }
     }
  else{
     for(int i=0; i<arrayLettre.length; i++){ //On ajoute aux lettres les méthodes de déplacements et de collisions
       arrayLettre[i].check();
       arrayLettre[i].move();
       arrayLettre[i].collision();
       arrayLettre[i].checkStart();
       if(arrayLettre[i].returningToStart==true){
         arrayLettre[i].returnToStart();
       }
   }
  }
}
