class Lettre{ //definition de la classe

  float x;
  float y;

  float xIni;
  float yIni;
  
  color[] tabcolor = {color(#73C1FF), color(#B38B4D), color(#89C555), color(#B34D74), color(#FFCC54), color(#78251C)}; //tableau comprenant des couleurs (6) qui seront sélectionnées aléatoirement
  
  int couleur = tabcolor[(int) random(0,tabcolor.length)]; //sélection aléatoire de la couleur de la lettre
  String charac;
  
  float vitX = 0;
  float vitY = 0;
  
  boolean returningToStart= false;
  
  float curseurX;
  float curseurY;
  
  Lettre(float _x, float _y){ //Constructeur de la lettre posX, posY
    x = _x;
    y = _y;
    
    
    xIni = _x;
    yIni = _y;
  }
  
  
    void addLettre(String _charac){ //création du charactère
    charac = _charac;
  }
  
 
  
  float distance(float xCtrl, float yCtrl){ //fonction qui calcule la distance entre la position du curseur de la souris et de la position du carré
        return sqrt((xCtrl-x)*(xCtrl-x)+(yCtrl-y)*(yCtrl-y)); 
  }
    
  void check(){
    if(distance(curseurX,curseurY) < 30){
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
