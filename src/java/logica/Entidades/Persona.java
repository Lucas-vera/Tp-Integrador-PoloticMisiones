package logica.Entidades;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Inheritance( strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Persona implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String nombre;
    private String apellido;
    private String direccion;
    private String dni;
    @Temporal(TemporalType.DATE)
    private Date fecha_nac;
    private String nacionalidad;
    private String celular;
    private String email;

    public Persona() {
    }

    public Persona(int id, String nombre, String apellido, String direccion, String dni, LocalDate fecha_nac, String nacionalidad, String celular, String email) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.dni = dni;
        this.fecha_nac = Date.from(fecha_nac.atStartOfDay(ZoneId.systemDefault()).toInstant());;
        this.nacionalidad = nacionalidad;
        this.celular = celular;
        this.email = email;
    }
 
//------------------------------GETTERS Y SETTERS------------------------------------------------------
    public int getId() {
        return id;
    }

    public void setId(int id) {    
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public Date getFecha_nac() {
        return fecha_nac;
    }

    public void setFecha_nac(LocalDate fecha_nac) {
        this.fecha_nac = Date.from(fecha_nac.atStartOfDay(ZoneId.systemDefault()).toInstant());
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
//------------------------------METODOS------------------------------------------------------   

    @Override
    public String toString() {
        return "Persona{" + "id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", direccion=" + direccion + ", dni=" + dni + ", fecha_nac=" + fecha_nac + ", nacionalidad=" + nacionalidad + ", celular=" + celular + ", email=" + email + '}';
    }
    
}
