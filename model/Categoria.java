package model;

public class Categoria {
    @Column
    int idCategoria;
    @Column
    String name;

    public Categoria(int idCategoria, String name) {
        this.idCategoria = idCategoria;
        this.name = name;
    }

    public int getidCategoria() {
        return idCategoria;
    }

    public void setidCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
