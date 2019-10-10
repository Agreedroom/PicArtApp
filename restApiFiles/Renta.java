package restApiFiles;

public class Renta {
    int idRenta;
    String fecha;
    String fechaDevolucionAcordada;
    int montoAcordado;
    int Integrante_idIntegrante;
    int Cliente_idCliente;

    public Renta(int idRenta, String fecha, String fechaDevolucionAcordada, int montoAcordado, Integrante integrante) {
        this.idRenta = idRenta;
        this.fecha = fecha;
        this.fechaDevolucionAcordada = fechaDevolucionAcordada;
        this.montoAcordado = montoAcordado;
        Integrante_idIntegrante = integrante.getIdIntegrante();
        //Cliente_idCliente = cliente_idCliente;
    }

    public int getIdRenta() {
        return idRenta;
    }

    public void setIdRenta(int idRenta) {
        this.idRenta = idRenta;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getFechaDevolucionAcordada() {
        return fechaDevolucionAcordada;
    }

    public void setFechaDevolucionAcordada(String fechaDevolucionAcordada) {
        this.fechaDevolucionAcordada = fechaDevolucionAcordada;
    }

    public int getMontoAcordado() {
        return montoAcordado;
    }

    public void setMontoAcordado(int montoAcordado) {
        this.montoAcordado = montoAcordado;
    }

    public int getIntegrante_idIntegrante() {
        return Integrante_idIntegrante;
    }

    public void setIntegrante_idIntegrante(int integrante_idIntegrante) {
        Integrante_idIntegrante = integrante_idIntegrante;
    }

    public int getCliente_idCliente() {
        return Cliente_idCliente;
    }

    public void setCliente_idCliente(int cliente_idCliente) {
        Cliente_idCliente = cliente_idCliente;
    }
}
