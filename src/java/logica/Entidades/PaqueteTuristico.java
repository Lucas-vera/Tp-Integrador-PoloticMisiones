package logica.Entidades;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class PaqueteTuristico implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int codigo_paquete;
    @Basic
    private double costo_paquete;
    @ManyToMany
    private List<Servicio> lista_servicios;
    @OneToMany
    private List<Venta> venta_paquete;

    public PaqueteTuristico() {
    }

    public PaqueteTuristico(int codigo_paquete, double costo_paquete, List<Servicio> lista_servcios, List<Venta> venta_paquete) {
        this.codigo_paquete = codigo_paquete;
        this.costo_paquete = costo_paquete;
        this.lista_servicios = lista_servcios;
        this.venta_paquete = venta_paquete;
    }

//------------------------------GETTERS Y SETTERS------------------------------------------------------
    public int getCodigo_paquete() {
        return codigo_paquete;
    }

    public void setCodigo_paquete(int codigo_paquete) {
        this.codigo_paquete = codigo_paquete;
    }

    public double getCosto_paquete() {
        return costo_paquete;
    }

    public void setCosto_paquete(double costo_paquete) {
        this.costo_paquete = costo_paquete;
    }

    public List<Servicio> getLista_servicios() {
        return lista_servicios;
    }

    public void setLista_servicios(List<Servicio> lista_servcios) {
        this.lista_servicios = lista_servcios;
    }

    public List<Venta> getVenta_paquete() {
        return venta_paquete;
    }

    public void setVenta_paquete(List<Venta> venta_paquete) {
        this.venta_paquete = venta_paquete;
    }
//------------------------------------------------------------------------------------------------------
//-------------------------------------METODOS----------------------------------------------------------
    public void agregarServicioAlPaquete(Servicio servicio){
        lista_servicios.add(servicio);
    }
    
    public void eliminarServicioAlPaquete(int index){
        lista_servicios.remove(index);
    }
    
    public int buscarServicioEnPaquete(Servicio servicio){                      //Retorna el indice para luego eliminarlo si se requiere.
        for(int i=0; i<lista_servicios.size() ; i++){
            if(lista_servicios.get(i).getCodigo_servicio()==servicio.getCodigo_servicio()){
                return i;
            }
        }
        return -1;
    }
    
    public void agregarVentaAlPaquete(Venta venta){
        venta_paquete.add(venta);
    }
    
    public void eliminarVentaAlPaquete(int index){
        venta_paquete.remove(index);
    }
    
    public int buscarVentaEnPaquete(Venta venta){
        for(int i=0; i<venta_paquete.size() ; i++){
            if(venta_paquete.get(i).getNum_venta()==venta.getNum_venta()){
                return i;
            }
        }
        return -1;
    }
}
