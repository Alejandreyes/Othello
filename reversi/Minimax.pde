
class Minimax {
  ConfiguracionTablero configuracion;
  Minimax(Tablero inicial) {
  }
  /**
   function minimax(node, depth, maximizingPlayer)
   if depth = 0 or node is a terminal node
   return the heuristic value of node
   if maximizingPlayer
   bestValue := −∞
   for each child of node
   v := minimax(child, depth − 1, FALSE)
   bestValue := max(bestValue, v)
   return bestValue
   else (* minimizing player *)
   bestValue := +∞
   for each child of node
   v := minimax(child, depth − 1, TRUE)
   bestValue := min(bestValue, v)
   return bestValue
   */
  /**
   *
   */
  public int minimax(Node<Tablero> nodo, int depth, boolean maximizingPlayer) {
    if (depth == 0 || nodo.isLeaf()) {
      return configuracion.valorUtilidad(nodo);
    }
    if (maximizingPlayer) {
    }
    return 0 ;
  }
}

class ConfiguracionTablero {
  private Node<Tablero> configuracion;
  public ConfiguracionTablero (Tablero tablero) {
    configuracion = new Node<Tablero>(tablero);
  }
  public int valorUtilidad(Node<Tablero> nodo) {
    Tablero tab = nodo.getData();
    int utilidad = 0 ; 
    for (int i = 0; i< tablero.getAlto(); i++) {
      for (int j = 0; j < tablero.getAncho(); j++) {
        if(i == 0 && i==j){
          
        }
      }
    }
    return utilidad ;
  }
  void crearConfiguracionesTablero(int jugadorActual){
    Tablero tab = configuracion.getData();
    JugadaTablero jugadaValida = new JugadaTablero();
    
    for(int i = 0; i<tab.getAlto();i++){
     for(int j = 0 ; j<tab.getAncho();j++){
      if(jugadaValida.jugadaValida(i,j,jugadorActual,tab)){
        Tablero hijo = tab.copiaTablero();
        jugadaValida.swap(i,j,hijo,jugadorActual);
        configuracion.addChild(hijo);
      }
     }
    }
  }
  
  
}