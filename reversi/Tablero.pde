class Tablero {
  int[][] tablero;
  int tamano;
  int alto ;
  int ancho;
  /**
   * Constructor de Tablero
   */
  Tablero(int x, int y, int tamano) {
    alto  = x; 
    ancho = y ;
    this.tamano = tamano; 
    tablero = new int[alto][ancho];
    inicializar();
  }
  void setup(){
  tablero = new int[alto][ancho];
}
  int getFicha(int x,int y){
    return tablero[x][y];
  }
  void setFicha(int x, int y, int ficha) {
    tablero[x][y] = ficha;
  }
  Tablero copiaTablero() {
    Tablero copia = new Tablero(alto, ancho, tamano);
    for (int i = 0; i<alto; i++) {
      for (int j =0; j<ancho; ancho++) {
        copia.setFicha(i, j, tablero[i][j]);
      }
    }
    return copia;
  }
  int getTamano() {
    return tamano;
  }
  int getAlto() {
    return alto;
  }
  int getAncho() {
    return ancho;
  }
  void inicializar() {
    tablero[(alto/2)-1][(ancho/2)-1]=2;
    tablero[(alto/2)-1][ancho/2]=1;
    tablero[alto/2][ancho/2]=2;
    tablero[alto/2][(ancho/2)-1]=1;
  }
  void display() {
    noStroke();
    for (int i = 0; i < tablero.length; i++) {
      for (int j = 0; j < tablero.length; j++) {
        if (tablero[i][j] == 2) {
          fill(0);
          ellipse((j*tamano)+(tamano/2), (i*tamano)+(tamano/2), tamano/2, tamano/2);
          continue;
        }
        if (tablero[i][j]== 1) {
          fill(255);
          ellipse((j*tamano)+(tamano/2), (i*tamano)+(tamano/2), tamano/2, tamano/2);
        }
      }
    }
  }
}