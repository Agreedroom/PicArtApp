package restApiFiles;

public class RentaDetalle {
    //spring@column
    int idRentaDetalle;
    //spring@column
    int cantidad;
    //spring@column
    int importe;
    //spring@JoinColumn("idRenta")
    Renta renta;
    //spring@JoinColumn("idProducto")
    Producto producto;

    public RentaDetalle(int idRentaDetalle, int cantidad, int importe, Renta renta, Producto producto) {
        this.idRentaDetalle = idRentaDetalle;
        this.cantidad = cantidad;
        this.importe = importe;
        this.renta = renta;
        this.producto = producto;
    }

    public int getIdRentaDetalle() {
        return idRentaDetalle;
    }

    public void setIdRentaDetalle(int idRentaDetalle) {
        this.idRentaDetalle = idRentaDetalle;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getImporte() {
        return importe;
    }

    public void setImporte(int importe) {
        this.importe = importe;
    }

    public Renta getRenta() {
        return renta;
    }

    public void setRenta(Renta renta) {
        this.renta = renta;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }
}
