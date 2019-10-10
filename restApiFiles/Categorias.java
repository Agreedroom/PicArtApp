package restApiFiles;

public class Categorias {
    int id_categoria;
    String name;

    public Categorias(int id_categoria, String name) {
        this.id_categoria = id_categoria;
        this.name = name;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
