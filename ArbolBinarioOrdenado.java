package estructuras;

/**
 * Created by Javier Sánchez on 23/11/2016.
 **/
public class ArbolBinarioOrdenado {
    //Nodo de tipo árbol binario donde se encontrará la
    // referencia al nodo raíz del árbol
    private NodoArbolBinario raiz;

    /**
     * Constructor para la clase ArbolBinarioOrdenado
     * que inicializa los valores vacíos.
     **/
    public ArbolBinarioOrdenado() {
        raiz = null;
    }

    /** Constructor para la clase ArbolBinarioOrdenado
     * que inicializa los valore con parametros dados.
     * @param dato que es el dato a insertar en la raíz.**/
    public ArbolBinarioOrdenado(Object dato) {
        raiz = new NodoArbolBinario(dato, null, null);
    }

    /** Método insertar que verifica que se pueda utilizar
     * un procedimiento recursivo para insertar los datos
     * en el árbol binario ordenado.
     * @param dato que es el dato a insertar.**/
    public void insertar(Object dato) {
        //Se crea un nuevo NodoArbolBinario que almacenará el dato a insertar.
        NodoArbolBinario temporal = new NodoArbolBinario(dato, null, null);
        //En caso de que no exista una raíz, el nuevo nodo será la raíz.
        if (raiz == null) {
            raiz = temporal;
            //En caso de haber raíz, se busca un nodo en el que sí pueda insertarse.
        } else {
            //Llamada al método recursivo que buscará donde insertar el nodo.
            insertarRecursivo(temporal, raiz);
        }
    }

    /**
     * Método que inserta de forma recursiva elementos en un arreglo.
     * @param raiz que es el nodo sobre el que se intentarán los datos
     * @param nodoAInsertar que es el nodo con la nueva información a agregar en el árbol.
     **/
    private void insertarRecursivo(NodoArbolBinario nodoAInsertar, NodoArbolBinario raiz) {
        //en caso de que el valor a insertar sea mayor que el contenido en la raíz.
        if ((int) raiz.getDato() < (int) nodoAInsertar.getDato()) {
            //si no hay valor a la derecha, se inserta ahí.
            //Caso base
            if (raiz.getDerecho() == null) {
                raiz.setDerecho(nodoAInsertar);
            } else {
                //caso recursivo
                //Se hace una llamada recursiva con un subárbol a la derecha.
                insertarRecursivo(nodoAInsertar, raiz.getDerecho());
            }
        }
        //En caso de que el valor a insertar sea menor que el contenido en la raíz.
        else {
            //Si no hay valor a la izquierda, se inserta ahí.
            //Caso base.
            if (raiz.getIzquierdo() == null) {
                raiz.setIzquierdo(nodoAInsertar);
            } else {
                //Caso recursivo
                //Se hace una llamada recursiva con un subárbol a la izquierda.
                insertarRecursivo(nodoAInsertar, raiz.getIzquierdo());
            }

        }
    }

    /** Metodo que verifica que el árbol pueda ser recorrido de
     * forma recursiva en modo preorden y después lo recorre.**/
    public void preOrden() {
        //Si el árbol tiene datos, se puede recorrer.
        if (!isEmpty()) {
            preOrdenRecursivo(raiz);
        }
    }

    /** Método que recorre el arbol de forma recursiva en preorden.
     * Primero procesa la raíz, después recorre hacia la izquierda
     * y finalmente, a la derecha.
     * @param raiz que es el subárbol a procesar. **/
    private void preOrdenRecursivo(NodoArbolBinario raiz) {
        //Procesar la raíz.
        System.out.println(raiz.getDato());
        //En caso de que el subárbol actual tenga una referencia
        //válida hacia el nodo izquierdo, se recorre dicho nodo.
        if (raiz.getIzquierdo() != null) {
            preOrdenRecursivo(raiz.getIzquierdo());
        }
        //Se recorre el subárbol a la derecha si y sólo si existe.
        if (raiz.getDerecho() != null) {
            preOrdenRecursivo(raiz.getDerecho());
        }
    }

    /** Método que verifica que sea posible recorrer el
     * árbol en forma recursiva inorden y luego lo recorre.**/
    public void inOrden() {
        if (!isEmpty()) {
            inOrdenRecursivo(raiz);
        }
    }

    /** Método que recorre el árbol en modo inOrden
     * Primeramente resuelve el nodo a la izquierda,
     * luego la raíz y finalmente, el nodo a la derecha.
     * @param raiz que la raíz del subárbol a procesar.**/
    private void inOrdenRecursivo(NodoArbolBinario raiz) {
        //En caso de que el subárbol actual tenga una referencia
        //válida hacia el nodo izquierdo, se recorre dicho nodo.
        if (raiz.getIzquierdo() != null) {
            inOrdenRecursivo(raiz.getIzquierdo());
        }
        //Procesar la raíz.
        System.out.println(raiz.getDato());
        //Se recorre el subárbol a la derecha si y sólo si existe.
        if (raiz.getDerecho() != null) {
            inOrdenRecursivo(raiz.getDerecho());
        }
    }

    /** Método público que se encarga de verificar que el
     * método recursivo postOrdenRecursivo pueda procesar
     * el árbol que se le ha enviado. **/
    public void postOrden() {
        if (!isEmpty()) {
            postOrdenRecursivo(raiz);
        }
    }

    /** Método que recorre el árbol binario procesando primero
     * los nodos a la izquierda, después los de la derecha y
     * finalmente la raíz. Es una función recursiva así que,
     * en realidad, sólo procesa un subárbol a la vez.
     * @param raiz que será la raíz del árbol a procesar.**/
    private void postOrdenRecursivo(NodoArbolBinario raiz) {
        //En caso de que el subárbol actual tenga una referencia
        //válida hacia el nodo izquierdo, se recorre dicho nodo.
        if (raiz.getIzquierdo() != null) {
            postOrdenRecursivo(raiz.getIzquierdo());
        }
        //Se recorre el subárbol a la derecha si y sólo si existe.
        if (raiz.getDerecho() != null) {
            postOrdenRecursivo(raiz.getDerecho());
        }
        //Procesar la raíz.
        System.out.println(raiz.getDato());
    }

    /** Método isEmpty que informa si el árbol está vacío.
     * @return true en caso de que la raíz no haya sido establecida. **/
    public boolean isEmpty() {
        return raiz == null;
    }
}
