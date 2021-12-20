package logica.Entidades;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Servicio implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int codigo_servicio;
    @Basic
    private String nombre;
    private String descripcion_breve;
    private String destino_ser;
    @Temporal(TemporalType.DATE)
    private Date fecha_servicio;
    private double costo_servicio;
    @OneToMany
    private List<Venta> lista_ventasServicio;
    @ManyToMany
    private List<PaqueteTuristico> lista_paquetes;

    public Servicio() {
    }

    public Servicio(int codigo_servicio, String nombre, String descripcion_breve, String destino_ser, LocalDate fecha_servicio, double costo_servicio, List<Venta> lista_ventasServicio, List<PaqueteTuristico> lista_paquetes) {
        this.codigo_servicio = codigo_servicio;
        this.nombre = nombre;
        this.descripcion_breve = descripcion_breve;
        this.destino_ser = destino_ser;
        this.fecha_servicio = Date.from(fecha_servicio.atStartOfDay(ZoneId.systemDefault()).toInstant());
        this.costo_servicio = costo_servicio;
        this.lista_ventasServicio = lista_ventasServicio;
        this.lista_paquetes = lista_paquetes;
    }
    
//------------------------------GETTERS Y SETTERS------------------------------------------------------
    public int getCodigo_servicio() {
        return codigo_servicio;
    }

    public void setCodigo_servicio(int codigo_servicio) {
        this.codigo_servicio = codigo_servicio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion_breve() {
        return descripcion_breve;
    }

    public void setDescripcion_breve(String descripcion_breve) {
        this.descripcion_breve = descripcion_breve;
    }

    public String getDestino_ser() {
        return destino_ser;
    }

    public void setDestino_ser(String destino_ser) {
        this.destino_ser = destino_ser;
    }

    public Date getFecha_servicio() {
        return fecha_servicio;
    }

    public void setFecha_servicio(LocalDate fecha_servicio) {
        this.fecha_servicio = Date.from(fecha_servicio.atStartOfDay(ZoneId.systemDefault()).toInstant());
    }

    public double getCosto_servicio() {
        return costo_servicio;
    }

    public void setCosto_servicio(double costo_servicio) {
        this.costo_servicio = costo_servicio;
    }

    public List<Venta> getLista_ventasServicio() {
        return lista_ventasServicio;
    }

    public void setLista_ventasServicio(List<Venta> lista_ventasServicio) {
        this.lista_ventasServicio = lista_ventasServicio;
    }

    public List<PaqueteTuristico> getLista_paquetes() {
        return lista_paquetes;
    }

    public void setLista_paquetes(List<PaqueteTuristico> lista_paquetes) {
        this.lista_paquetes = lista_paquetes;
    }
//------------------------------METODOS------------------------------------------------------ 
    
    public void agregarVentaAlServicio(Venta venta){
        lista_ventasServicio.add(venta);
    }
    
    public void eliminarVentaAlServicio(int index){
        lista_ventasServicio.remove(index);
    }
    
    public int buscarVentaEnServicio(Venta venta){
        for(int i=0; i<lista_ventasServicio.size() ; i++){
            if(lista_ventasServicio.get(i).getNum_venta()==venta.getNum_venta()){
                return i;
            }
        }
        return -1;
    }
    
    public void agregarPaqueteAlServicio(PaqueteTuristico paqueteTuristico){
        lista_paquetes.add(paqueteTuristico);
    }
    
    public void eliminarPaqueteAlServicio(int index){
        lista_paquetes.remove(index);
    }
    
    public int buscarPaqueteEnServicio(PaqueteTuristico paquete){
        for(int i=0; i<lista_paquetes.size() ; i++){
            if(lista_paquetes.get(i).getCodigo_paquete()==paquete.getCodigo_paquete()){
                return i;
            }
        }
        return -1;
    }
}
