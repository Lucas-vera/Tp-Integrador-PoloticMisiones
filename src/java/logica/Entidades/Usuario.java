package logica.Entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Usuario implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_usuario;
    @Basic
    private String usuario;
    private String pass;

    public Usuario() {
    }

    public Usuario(int id_usuario, String user, String pass) {
        this.id_usuario= id_usuario;
        this.usuario = user;
        this.pass = pass;
    }

//------------------------------GETTERS Y SETTERS------------------------------------------------------
    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {    
        this.id_usuario = id_usuario;
    }

    public String getUser() {
        return usuario;
    }

    public void setUser(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }  
}
