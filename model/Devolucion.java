package model;

public class Devolucion {
    @JoinColumn("idRenta");
    Renta renta;
    @Column
    private int idDevolucion;
    @Column
    private String fecha;
    @Column
    private int diasExtra;
    @Column
    private int montoCobrado;
    @Column
    private String observaciones;


    public Devolucion(int idDevolucion, String fecha, int diasExtra, int montoCobrado, String observaciones, Renta renta) {
        this.idDevolucion = idDevolucion;
        this.fecha = fecha;
        this.diasExtra = diasExtra;
        this.montoCobrado = montoCobrado;
        this.observaciones = observaciones;
        this.renta = renta;
    }

    public int getIdDevolucion() {
        return idDevolucion;
    }

    public void setIdDevolucion(int idDevolucion) {
        this.idDevolucion = idDevolucion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getdiasExtra() {
        return diasExtra;
    }

    public void setdiasExtra(int diasExtra) {
        this.diasExtra = diasExtra;
    }

    public int getMontoCobrado() {
        return montoCobrado;
    }

    public void setMontoCobrado(int montoCobrado) {
        this.montoCobrado = montoCobrado;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Renta getRenta() {
        return renta;
    }

    public void setRenta(Renta renta) {
        this.renta = renta;
    }
}
