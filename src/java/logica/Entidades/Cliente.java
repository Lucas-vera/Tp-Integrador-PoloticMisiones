package logica.Entidades;


import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
public class Cliente extends Persona implements Serializable{
    
    
    @OneToMany
    private List<Venta> ventas_cliente;

    public Cliente() {
        super();
    }

    public Cliente(int id, String apellido, String celular, String direccion, String dni, String email, LocalDate fecha_nac, String nacionalidad, String nombre) {
        super( id, nombre, apellido, direccion, dni, fecha_nac, nacionalidad, celular, email);
        this.ventas_cliente= new ArrayList<>();
    }
    
//------------------------------GETTERS Y SETTERS------------------------------------------------------    
    public List<Venta> getVentas_cliente() {
        return ventas_cliente;
    }

    public void setVentas_cliente(List<Venta> venta_cliente) {
        this.ventas_cliente= venta_cliente;
    }

//------------------------------METODOS------------------------------------------------------ 
    public String listarVentasCliente(){
        String ventasTotales="";
        for(Venta venta: ventas_cliente){
            ventasTotales += venta.toString()+". ";
        }
        return ventasTotales;
    }
    
    public void agregarVentaAlCliente(Venta venta){
        ventas_cliente.add(venta);
    }
    
    public void eliminarVentaAlCliente(int index){
        ventas_cliente.remove(index);
    }
    
    public int buscarVentaEnCliente(Venta venta){
        for(int i=0; i<ventas_cliente.size() ; i++){
            if(ventas_cliente.get(i).getNum_venta()==venta.getNum_venta()){
                return i;
            }
        }
        return -1;
    }
}
