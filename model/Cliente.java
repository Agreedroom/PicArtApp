package model;

public class Cliente {
    @Column
    int idCliente;
    @Column
    String nombre;
    @Column
    long telefono;
    @Column
    String correoElectronico;
    @Column
    long matricula;
    @Column
    String curp;
    @Column
    String facebook;
    @Column
    String nombreAval;
    @Column
    String telefonoAval;

    public Cliente(int idCliente, String nombre, long telefono, String correoElectronico, long matricula, String curp, String facebook, String nombreAval, String telefonoAval) {
        this.idCliente = idCliente;
        this.nombre = nombre;
        this.telefono = telefono;
        this.correoElectronico = correoElectronico;
        this.matricula = matricula;
        this.curp = curp;
        this.facebook = facebook;
        this.nombreAval = nombreAval;
        this.telefonoAval = telefonoAval;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public long getTelefono() {
        return telefono;
    }

    public void setTelefono(long telefono) {
        this.telefono = telefono;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public long getMatricula() {
        return matricula;
    }

    public void setMatricula(long matricula) {
        this.matricula = matricula;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getNombreAval() {
        return nombreAval;
    }

    public void setNombreAval(String nombreAval) {
        this.nombreAval = nombreAval;
    }

    public String getTelefonoAval() {
        return telefonoAval;
    }

    public void setTelefonoAval(String telefonoAval) {
        this.telefonoAval = telefonoAval;
    }
}
