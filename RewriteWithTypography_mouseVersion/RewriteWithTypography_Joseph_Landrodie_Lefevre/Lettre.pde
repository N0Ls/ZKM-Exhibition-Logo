class Lettre{ //definition de la classe

  float x;
  float y;

  float xIni;
  float yIni;
  
  color[] tabcolor = {color(255,0,0), color(0,255,0), color(0,0,255), color(255,69,0), color(255,255,0), color(255,0,255)}; //tableau comprenant des couleurs (6) qui seront sélectionnées aléatoirement
  //rouge, vert, bleu, orange, jaune, violet
  
  int couleur = tabcolor[(int) random(0,tabcolor.length)]; //sélection aléatoire de la couleur de la lettre
  String charac;
  
  float vitX = 0;
  float vitY = 0;
  
  boolean returningToStart= false;
  
  Lettre(float _x, float _y){ //Constructeur de la lettre posX, posY
    x = _x;
    y = _y;
    
    
    xIni = _x;
    yIni = _y;
  }
  
  
    void addLettre(String _charac){ //création du charactère
    charac = _charac;
  }
  
 
  
  float distance(){ //fonction qui calcule la distance entre la position des yeux ou du curseur de la souris avec la lettre
    return sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y));
  }
    
  void check(){
    if(distance() < 15){
       PVector direction = PVector.fromAngle(random(2*PI)); //Cette ligne permet de créer un vecteur qui fera office de ligne directrice, c'est à dire que la lettre suivra le tracé du vecteur, ici le vecteur à une direction random (360) pour que le movement soit aléatoire
       float acc = random(1,10); //on prend une valeur random qui va nous servir comme valeur d'accélération
       direction.mult(acc); //on ajoute une accélération au mouvement pour que le mouvement ne soit pas toujours linéaire, on utilise .mult car on manipule des vertex donc on ne peut pas utiliser * (fois) pour multuplier
       vitX = direction.x; 
       vitY = direction.y;
       fill(couleur); //On dessine la lettre
       text(charac,x, y);
    }else{
      fill(couleur);
      text(charac,x, y);
    }
   }
  
  void move(){ //fonction qui permet le mvt
    x += vitX; // on ajoute la vitesse sur X
    y += vitY; // on ajoute la vitesse sur Y
    vitX *= 0.9; // on va ajoute des frottements pour que le mouvement s'arrête de façon fluide et continue 
    vitY *= 0.9;
  }  
  
   void collision() {
    //Si la lettre touche l'une des extrémités on la fait rebondir
    if (x > width-20 || x < 20) {
      vitX *= -1;
    }
    if (y > height-2|| y < 20) {
      vitY *= -1;
    }
  }
  
  void checkStart(){
     if((int) abs(x-xIni) <= 1  && (int) abs(y-yIni) <= 1 && returningToStart==true){
        returningToStart = false;
     }
  }
  
  void returnToStart(){
      if(x-xIni < 0 && y-yIni < 0){
        x++;
        y++;
      }
      if(x-xIni > 0 && y-yIni < 0){
        x--;
        y++;
      }
      if(x-xIni < 0 && y-yIni > 0){
        x++;
        y--;
      }
      if(x-xIni > 0 && y-yIni > 0){
        x--;
        y--;
      }
  }
 
 }
