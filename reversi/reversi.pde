int jugadorActual = 1;
int alto = 8;
int ancho = 8;
int tamano = 75 ;
Tablero tablero;
void settings() {
  size(tamano*8, tamano*8);
}
void setup() {
  tablero = new Tablero(alto, ancho, tamano);
  background(0, 153, 51);
  stroke(181, 242, 192);
  for (int i = 0; i<alto; i++) {
    line(tamano*i, 0, tamano*i, tamano*8);
    line(0, tamano*i, tamano*8, tamano*i);
  }
}

void turno(){
 if(jugadorActual == 2){
    Minimax jugada = new Minimax();
    ConfiguracionTablero configuracion = ConfiguracionTablero.getInstance();
    jugada.minimax(null,Integer.MAX_VALUE,true);
  }else{
    
  }
}

void draw() {
  tablero.display();  
}
void mouseClicked() {
  JugadaTablero jugada = new JugadaTablero(tablero, jugadorActual);
  if (jugada.jugadaValida((mouseY/tamano), (mouseX/tamano)) ) {
    tablero.setFicha((mouseY/tamano), (mouseX/tamano), jugadorActual);
    jugada.swap((mouseY/tamano), (mouseX/tamano));
    jugadorActual = (jugadorActual == 1)?2: 1;
  }
}