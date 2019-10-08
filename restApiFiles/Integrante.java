package restApiFiles;

public class Integrante {
    int idIntegrante;
    String nombre;
    String contrasena;
    String usuario;

    public Integrante(int idIntegrante, String nombre, String contrasena, String usuario) {
        this.idIntegrante = idIntegrante;
        this.nombre = nombre;
        this.contrasena = contrasena;
        this.usuario = usuario;
    }

    public int getIdIntegrante() {
        return idIntegrante;
    }

    public void setIdIntegrante(int idIntegrante) {
        this.idIntegrante = idIntegrante;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
}
