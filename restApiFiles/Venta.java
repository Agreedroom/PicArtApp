package restApiFiles;

public class Venta {
    //spring@column
    int idVenta;
    //spring@column
    String fecha;
    //spring@column
    int monto_total;
    //spring@JoinColumn("idCliente")
    Cliente cliente;
    //spring@JoinColumn("idIntegrante")
    Integrante integrante;

    public Venta(int idVenta, String fecha, int monto_total, Cliente cliente, Integrante integrante) {
        this.idVenta = idVenta;
        this.fecha = fecha;
        this.monto_total = monto_total;
        this.cliente = cliente;
        this.integrante = integrante;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getMonto_total() {
        return monto_total;
    }

    public void setMonto_total(int monto_total) {
        this.monto_total = monto_total;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Integrante getIntegrante() {
        return integrante;
    }

    public void setIntegrante(Integrante integrante) {
        this.integrante = integrante;
    }
}
