
class JugadaTablero {
  Tablero tablero; 
  int jugadorActivo ; 
  private int numFichasDiagonalSI, numFichasDiagonalSD, numFichasDiagonalII, numFichasDiagonalID, numFichasVerticalS, numFichasVerticalI, numFichasIzquierda, numFichasDerecha; 


  JugadaTablero(Tablero tablero, int jugador) {
    this.tablero = tablero;
    jugadorActivo = jugador;
  }
  /**
   * Metodo que sirve para indicar si una jugada es valida
   */
  boolean jugadaValida(int x, int y) {
    int jugadorOpuesto = (jugadorActivo==1)?2:1;
    int numFichasReversibles = 0; 
    if(tablero.getFicha(x,y) != 0){
     return false ; 
    }
    if ((x-1)>=0) { // REvisamos si existe una fila antes de esta 
      if ((y-1)>=0) { // Izquierda
        numFichasDiagonalSI = diagonalSuperiorIzq(x-1, y-1, jugadorOpuesto); // Revisada esta bien 
        numFichasReversibles+=numFichasDiagonalSI;
        if (numFichasDiagonalSI>0)
          println("DSI");
      }
      if ((y+1)<tablero.getAncho()) { // Revisamos derecha 
        numFichasDiagonalSD = diagonalSuperiorDer(x-1, y+1, jugadorOpuesto);
        numFichasReversibles+=numFichasDiagonalSD; // bien 
        if (numFichasDiagonalSD>0)
          println("DSD");
      }
      numFichasVerticalS =lineaVerticalSuperior(x-1, y, jugadorOpuesto); // vertical superior bien
      numFichasReversibles+=numFichasVerticalS;
      if (numFichasVerticalS>0)
        println("VerticalS");
    }
    if ((x+1)< tablero.getAlto()) { // Revisamos si existe nivel inferior
      if ((y-1)>=0) { // Revisamos si existe una diagonal inferior Izquierda
        numFichasDiagonalII =diagonalInferiorIzq(x+1, y-1, jugadorOpuesto);
        numFichasReversibles+=numFichasDiagonalII; // bien
        if (numFichasDiagonalII>0)
          println("DII");
      }
      if ((y+1)<tablero.getAncho()) { // Revisamos si existe una diagonal inferior Derecha
        numFichasDiagonalID =diagonalInferiorDer(x+1, y+1, jugadorOpuesto);
        numFichasReversibles+=numFichasDiagonalID;
        if (numFichasDiagonalID>0){ 
          println("DID");
        }
      }
      numFichasVerticalI =lineaVerticalInferior(x+1, y, jugadorOpuesto); // bien 
      numFichasReversibles+=numFichasVerticalI;
      if (numFichasVerticalI>0)
        println("VerticalI");
    }
    if ((y-1)>=0) {
      numFichasIzquierda =lineaHorizontalIzq(x, y-1, jugadorOpuesto);
      numFichasReversibles+=numFichasIzquierda;
      if (numFichasIzquierda>0)
        println("Izquierda");
    }
    if ((y+1)<tablero.getAncho()) {
      numFichasDerecha =lineaHorizontalDer(x, y+1, jugadorOpuesto);
      numFichasReversibles+=numFichasDerecha;
      if (numFichasDerecha>0)
        println("Derecha");
    }

    return (numFichasReversibles > 0);
  }
  int diagonalSuperiorIzq(int x, int y, int jugadorOpuesto) {
    int numFichasReversibles = 0 ;
    boolean jugadaValida = false;
    for (int i= x, j =y; i>=0&&j>=0; i--, j--) {
      if (tablero.getFicha(i, j) == jugadorOpuesto) {
        numFichasReversibles++;
        jugadaValida = true;
      }
      if (tablero.getFicha(i, j) == jugadorActivo && jugadaValida ) {
        return numFichasReversibles;
      }
      if (tablero.getFicha(i, j) == jugadorActivo && !jugadaValida ) {
        return  0;
      }
      if (tablero.getFicha(i, j) == 0) {
        return  0;
      }
    }
    return  0;
  }
  int diagonalSuperiorDer(int x, int y, int jugadorOpuesto) {
    int numFichasReversibles = 0 ;
    boolean jugadaValida = false;
    for (int i= x, j =y; i>=0 && j<tablero.getAncho(); i--, j++) {
      if (tablero.getFicha(i, j) == jugadorOpuesto) {
        numFichasReversibles++;
        jugadaValida = true;
      }
      if (tablero.getFicha(i, j) == jugadorActivo && jugadaValida ) {
        return numFichasReversibles;
      }
      if (tablero.getFicha(i, j) == jugadorActivo && !jugadaValida ) {
        return  0;
      }
      if (tablero.getFicha(i, j) == 0) {
        return  0;
      }
    }
    return  0;
  }
  int diagonalInferiorIzq(int x, int y, int jugadorOpuesto) {
    int numFichasReversibles = 0 ;
    boolean jugadaValida = false;
    
    for (int i= x, j =y; i<tablero.getAlto()&&j>=0; i++, j--) {
      
      if (tablero.getFicha(i, j) == jugadorOpuesto) {
        numFichasReversibles++;
        jugadaValida = true;
      }
      if (tablero.getFicha(i, j) == jugadorActivo && jugadaValida ) {
        return numFichasReversibles;
      }
      if (tablero.getFicha(i, j) == jugadorActivo && !jugadaValida ) {
        return  0;
      }
      if (tablero.getFicha(i, j) == 0) {
        return  0;
      }
    }
    return  0;
  }
  int diagonalInferiorDer(int x, int y, int jugadorOpuesto) {
    int numFichasReversibles = 0 ;
    boolean jugadaValida = false;
    for (int i= x, j =y; i<tablero.getAncho()&&j<tablero.getAlto(); i++, j++) {
      if (tablero.getFicha(i, j) == jugadorOpuesto) {
        numFichasReversibles++;
        jugadaValida = true;
      }
      if (tablero.getFicha(i, j) == jugadorActivo && jugadaValida ) {
        return numFichasReversibles;
      }
      if (tablero.getFicha(i, j) == jugadorActivo && !jugadaValida ) {
        return  0;
      }
      if (tablero.getFicha(i, j) == 0) {
        return  0;
      }
    }
    return  0;
  }
  int lineaVerticalSuperior(int x, int y, int jugadorOpuesto) {
    int numFichasReversibles = 0 ;
    boolean jugadaValida = false;
    for (int  j =x; j>=0; j--) {
      if (tablero.getFicha(j, y) == jugadorOpuesto) {
        numFichasReversibles++;
        jugadaValida = true;
      }
      if (tablero.getFicha(j, y) == jugadorActivo && jugadaValida ) {
        return numFichasReversibles;
      }
      if (tablero.getFicha(j, y) == jugadorActivo && !jugadaValida ) {
        return  0;
      }
      if (tablero.getFicha(j, y) == 0) {
        return  0;
      }
    }
    return  0;
  }
  int lineaVerticalInferior(int x, int y, int jugadorOpuesto) {
    int numFichasReversibles = 0 ;
    boolean jugadaValida = false;
    for (int  j =x; j<tablero.getAlto(); j++) {
      if (tablero.getFicha(j, y) == jugadorOpuesto) {
        numFichasReversibles++;
        jugadaValida = true;
      }
      if (tablero.getFicha(j, y) == jugadorActivo && jugadaValida ) {
        return numFichasReversibles;
      }
      if (tablero.getFicha(j, y) == jugadorActivo && !jugadaValida ) {
        return  0;
      }
      if (tablero.getFicha(j, y) == 0) {
        return  0;
      }
    }
    return  0;
  }
  int lineaHorizontalIzq(int x, int y, int jugadorOpuesto) {
    int numFichasReversibles = 0 ;
    boolean jugadaValida = false;
    for (int  j =y; j>=0; j--) {
      if (tablero.getFicha(x, j) == jugadorOpuesto) {
        numFichasReversibles++;
        jugadaValida = true;
      }
      if (tablero.getFicha(x, j) == jugadorActivo && jugadaValida ) {
        return numFichasReversibles;
      }
      if (tablero.getFicha(x, j) == jugadorActivo && !jugadaValida ) {
        return  0;
      }
      if (tablero.getFicha(x, j) == 0) {
        return  0;
      }
    }
    return  0;
  }
  int lineaHorizontalDer(int x, int y, int jugadorOpuesto) {
    int numFichasReversibles = 0 ;
    boolean jugadaValida = false;
    for (int  j =y; j<tablero.getAncho(); j++) {
      if (tablero.getFicha(x, j) == jugadorOpuesto) {
        numFichasReversibles++;
        jugadaValida = true;
      }
      if (tablero.getFicha(x, j) == jugadorActivo && jugadaValida ) {
        return numFichasReversibles;
      }
      if (tablero.getFicha(x, j) == jugadorActivo && !jugadaValida ) {
        return  0;
      }
      if (tablero.getFicha(x, j) == 0) {
        return  0;
      }
    }
    return  0;
  }
  void swap(int x, int y) {

    if (numFichasDiagonalSI >0) {
      cambiarDiagonalSupIzq(x-1, y-1);
    }  
    if (numFichasDiagonalSD>0) {
      cambiarDiagonalSupDer(x-1, y+1);
    }

    if (numFichasDiagonalII>0) {
      cambiarDiagonalInfIzq(x+1, y-1);
    }
    if (numFichasDiagonalID>0) {
      cambiarDiagonalInfDer(x+1, y+1);
    }

    if (numFichasVerticalS>0) {
      cambiarLineaVerticalS(x-1, y);
    }

    if (numFichasVerticalI>0) {
      cambiarLineaVerticalI(x+1, y);
    }

    if (numFichasIzquierda>0) {
      cambiarLineaHorizontalIzq(x, y-1);
    }

    if (numFichasDerecha>0) {
      cambiarLineaHorizontalDer(x, y+1);
    }
  }
  void cambiarDiagonalSupIzq(int x, int y) {
    for (int i = 0; i<numFichasDiagonalSI; i++) {
      tablero.setFicha(x, y, jugadorActual);  
      x--;
      y--;
    }
  }
  void cambiarDiagonalSupDer(int x, int y) {
    for (int i = 0; i<numFichasDiagonalSD; i++) {
      tablero.setFicha(x, y, jugadorActual);  
      x--;
      y++;
    }
  }
  void cambiarDiagonalInfIzq(int x, int y) {
    for (int i = 0; i<numFichasDiagonalII; i++) {
      tablero.setFicha(x, y, jugadorActual);  
      x++;
      y--;
    }
  }
  void cambiarDiagonalInfDer(int x, int y) {
    for (int i = 0; i<numFichasDiagonalID; i++) {
      tablero.setFicha(x, y, jugadorActual);  
      x++;
      y++;
    }
  }
  void cambiarLineaVerticalS(int x, int y) {
    for (int i = 0; i<numFichasVerticalS; i++) {
      tablero.setFicha(x, y, jugadorActual);  
      x--;
    }
  }
  void cambiarLineaVerticalI(int x, int y) {
    for (int i = 0; i<numFichasVerticalI; i++) {
      tablero.setFicha(x, y, jugadorActual);  
      x++;
    }
  }
  void cambiarLineaHorizontalIzq(int x, int y) {
    for (int i = 0; i<numFichasIzquierda; i++) {
      tablero.setFicha(x, y, jugadorActual);  
      y--;
    }
  }
  void cambiarLineaHorizontalDer(int x, int y) {
    for (int i = 0; i<numFichasDerecha; i++) {
      tablero.setFicha(x, y, jugadorActual);  
      y++;
    }
  }
}