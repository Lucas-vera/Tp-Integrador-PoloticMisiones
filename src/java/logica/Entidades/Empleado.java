package logica.Entidades;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Empleado extends Persona implements Serializable{
    
    @Basic
    private String cargo;
    private double sueldo;
    
    @OneToMany
    private List<Venta> ventas_empleado;
    
    @OneToOne
    private Usuario usuario_empleado;

    public Empleado() {
        super();
    }

    public Empleado(int id_empleado, String cargo, double sueldo, List<Venta> ventas_empleado, Usuario usuario_empleado, String nombre, String apellido, String direccion, String dni, LocalDate fecha_nac, String nacionalidad, String celular, String email) {
        super(id_empleado, nombre, apellido, direccion, dni, fecha_nac, nacionalidad, celular, email);
        this.cargo = cargo;
        this.sueldo = sueldo;
        this.ventas_empleado = ventas_empleado;
        this.usuario_empleado = usuario_empleado;
    }


//------------------------------GETTERS Y SETTERS------------------------------------------------------
    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public List<Venta> getVentas_empleado() {
        return ventas_empleado;
    }

    public void setVentas_empleado(List<Venta> ventas_empleado) {
        this.ventas_empleado = ventas_empleado;
    }

    public Usuario getUsuario_empleado() {
        return usuario_empleado;
    }

    public void setUsuario_empleado(Usuario usuario_empleado) {
        this.usuario_empleado = usuario_empleado;
    }
//------------------------------METODOS------------------------------------------------------ 

    public void agregarVentaAlEmpleado(Venta venta){
        ventas_empleado.add(venta);
    }
    
    public void eliminarVentaAlEmpleado(int index){
        ventas_empleado.remove(index);
    }
    
    public int buscarVentaEnEmpleado(Venta venta){
        for(int i=0; i<ventas_empleado.size() ; i++){
            if(ventas_empleado.get(i).getNum_venta()==venta.getNum_venta()){
                return i;
            }
        }
        return -1;
    }
    
}
