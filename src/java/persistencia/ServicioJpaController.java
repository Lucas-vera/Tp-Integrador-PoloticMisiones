/*
 * 
 * 
 * 
 */
package persistencia;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.Entidades.PaqueteTuristico;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import logica.Entidades.Servicio;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author chuky
 */
public class ServicioJpaController implements Serializable {

    public ServicioJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public ServicioJpaController() {
        emf= Persistence.createEntityManagerFactory("TPO_INTEGRADOR_1PU");
    }
    
    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Servicio servicio) {
        if (servicio.getLista_paquetes() == null) {
            servicio.setLista_paquetes(new ArrayList<PaqueteTuristico>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<PaqueteTuristico> attachedLista_paquetes = new ArrayList<PaqueteTuristico>();
            for (PaqueteTuristico lista_paquetesPaqueteTuristicoToAttach : servicio.getLista_paquetes()) {
                lista_paquetesPaqueteTuristicoToAttach = em.getReference(lista_paquetesPaqueteTuristicoToAttach.getClass(), lista_paquetesPaqueteTuristicoToAttach.getCodigo_paquete());
                attachedLista_paquetes.add(lista_paquetesPaqueteTuristicoToAttach);
            }
            servicio.setLista_paquetes(attachedLista_paquetes);
            em.persist(servicio);
            for (PaqueteTuristico lista_paquetesPaqueteTuristico : servicio.getLista_paquetes()) {
                lista_paquetesPaqueteTuristico.getLista_servicios().add(servicio);
                lista_paquetesPaqueteTuristico = em.merge(lista_paquetesPaqueteTuristico);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Servicio servicio) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Servicio persistentServicio = em.find(Servicio.class, servicio.getCodigo_servicio());
            List<PaqueteTuristico> lista_paquetesOld = persistentServicio.getLista_paquetes();
            List<PaqueteTuristico> lista_paquetesNew = servicio.getLista_paquetes();
            List<PaqueteTuristico> attachedLista_paquetesNew = new ArrayList<PaqueteTuristico>();
            for (PaqueteTuristico lista_paquetesNewPaqueteTuristicoToAttach : lista_paquetesNew) {
                lista_paquetesNewPaqueteTuristicoToAttach = em.getReference(lista_paquetesNewPaqueteTuristicoToAttach.getClass(), lista_paquetesNewPaqueteTuristicoToAttach.getCodigo_paquete());
                attachedLista_paquetesNew.add(lista_paquetesNewPaqueteTuristicoToAttach);
            }
            lista_paquetesNew = attachedLista_paquetesNew;
            servicio.setLista_paquetes(lista_paquetesNew);
            servicio = em.merge(servicio);
            for (PaqueteTuristico lista_paquetesOldPaqueteTuristico : lista_paquetesOld) {
                if (!lista_paquetesNew.contains(lista_paquetesOldPaqueteTuristico)) {
                    lista_paquetesOldPaqueteTuristico.getLista_servicios().remove(servicio);
                    lista_paquetesOldPaqueteTuristico = em.merge(lista_paquetesOldPaqueteTuristico);
                }
            }
            for (PaqueteTuristico lista_paquetesNewPaqueteTuristico : lista_paquetesNew) {
                if (!lista_paquetesOld.contains(lista_paquetesNewPaqueteTuristico)) {
                    lista_paquetesNewPaqueteTuristico.getLista_servicios().add(servicio);
                    lista_paquetesNewPaqueteTuristico = em.merge(lista_paquetesNewPaqueteTuristico);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = servicio.getCodigo_servicio();
                if (findServicio(id) == null) {
                    throw new NonexistentEntityException("The servicio with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Servicio servicio;
            try {
                servicio = em.getReference(Servicio.class, id);
                servicio.getCodigo_servicio();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The servicio with id " + id + " no longer exists.", enfe);
            }
            List<PaqueteTuristico> lista_paquetes = servicio.getLista_paquetes();
            for (PaqueteTuristico lista_paquetesPaqueteTuristico : lista_paquetes) {
                lista_paquetesPaqueteTuristico.getLista_servicios().remove(servicio);
                lista_paquetesPaqueteTuristico = em.merge(lista_paquetesPaqueteTuristico);
            }
            em.remove(servicio);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Servicio> findServicioEntities() {
        return findServicioEntities(true, -1, -1);
    }

    public List<Servicio> findServicioEntities(int maxResults, int firstResult) {
        return findServicioEntities(false, maxResults, firstResult);
    }

    private List<Servicio> findServicioEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Servicio.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Servicio findServicio(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Servicio.class, id);
        } finally {
            em.close();
        }
    }

    public int getServicioCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Servicio> rt = cq.from(Servicio.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
