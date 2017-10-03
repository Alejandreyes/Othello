int jugadorActual = 1;
int alto = 8;
int ancho = 8;
int tamano = 75 ;
Tablero tablero;
ConfiguracionTablero configuracion;
JugadaTablero jugada;
void settings() {
  size(tamano*8, tamano*8);
}
void setup() {
  tablero = new Tablero(alto, ancho, tamano);
  configuracion = new ConfiguracionTablero(tablero);
  jugada = new JugadaTablero();
  background(0, 153, 51);
  stroke(181, 242, 192);
  for (int i = 0; i<alto; i++) {
    line(tamano*i, 0, tamano*i, tamano*8);
    line(0, tamano*i, tamano*8, tamano*i);
  }
}

void turno() {
  if (jugadorActual == 2) {
    //Minimax jugada = new Minimax();
    //jugada.minimax(null,Integer.MAX_VALUE,true);
    //jugadorActual = 1;
    
    if (jugada.jugadaValida((mouseY/tamano), (mouseX/tamano) ,jugadorActual,tablero)){
      tablero.setFicha((mouseY/tamano), (mouseX/tamano), jugadorActual);
      jugada.swap((mouseY/tamano), (mouseX/tamano),tablero,jugadorActual);
      jugadorActual = 1;
    }
  } else {
    
    if (jugada.jugadaValida((mouseY/tamano), (mouseX/tamano) ,jugadorActual,tablero)){
      tablero.setFicha((mouseY/tamano), (mouseX/tamano), jugadorActual);
      jugada.swap((mouseY/tamano), (mouseX/tamano),tablero,jugadorActual);
      jugadorActual = 2;
    }
  }
}

void draw() {
  tablero.display();
}
void mouseClicked() {
  turno();
}