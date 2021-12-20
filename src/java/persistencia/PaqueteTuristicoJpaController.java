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
import logica.Entidades.Servicio;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import logica.Entidades.PaqueteTuristico;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author chuky
 */
public class PaqueteTuristicoJpaController implements Serializable {

    public PaqueteTuristicoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public PaqueteTuristicoJpaController() {
        emf= Persistence.createEntityManagerFactory("TPO_INTEGRADOR_1PU");
    }
    
    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(PaqueteTuristico paqueteTuristico) {
        if (paqueteTuristico.getLista_servicios() == null) {
            paqueteTuristico.setLista_servicios(new ArrayList<Servicio>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Servicio> attachedLista_servicios = new ArrayList<Servicio>();
            for (Servicio lista_serviciosServicioToAttach : paqueteTuristico.getLista_servicios()) {
                lista_serviciosServicioToAttach = em.getReference(lista_serviciosServicioToAttach.getClass(), lista_serviciosServicioToAttach.getCodigo_servicio());
                attachedLista_servicios.add(lista_serviciosServicioToAttach);
            }
            paqueteTuristico.setLista_servicios(attachedLista_servicios);
            em.persist(paqueteTuristico);
            for (Servicio lista_serviciosServicio : paqueteTuristico.getLista_servicios()) {
                lista_serviciosServicio.getLista_paquetes().add(paqueteTuristico);
                lista_serviciosServicio = em.merge(lista_serviciosServicio);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(PaqueteTuristico paqueteTuristico) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            PaqueteTuristico persistentPaqueteTuristico = em.find(PaqueteTuristico.class, paqueteTuristico.getCodigo_paquete());
            List<Servicio> lista_serviciosOld = persistentPaqueteTuristico.getLista_servicios();
            List<Servicio> lista_serviciosNew = paqueteTuristico.getLista_servicios();
            List<Servicio> attachedLista_serviciosNew = new ArrayList<Servicio>();
            for (Servicio lista_serviciosNewServicioToAttach : lista_serviciosNew) {
                lista_serviciosNewServicioToAttach = em.getReference(lista_serviciosNewServicioToAttach.getClass(), lista_serviciosNewServicioToAttach.getCodigo_servicio());
                attachedLista_serviciosNew.add(lista_serviciosNewServicioToAttach);
            }
            lista_serviciosNew = attachedLista_serviciosNew;
            paqueteTuristico.setLista_servicios(lista_serviciosNew);
            paqueteTuristico = em.merge(paqueteTuristico);
            for (Servicio lista_serviciosOldServicio : lista_serviciosOld) {
                if (!lista_serviciosNew.contains(lista_serviciosOldServicio)) {
                    lista_serviciosOldServicio.getLista_paquetes().remove(paqueteTuristico);
                    lista_serviciosOldServicio = em.merge(lista_serviciosOldServicio);
                }
            }
            for (Servicio lista_serviciosNewServicio : lista_serviciosNew) {
                if (!lista_serviciosOld.contains(lista_serviciosNewServicio)) {
                    lista_serviciosNewServicio.getLista_paquetes().add(paqueteTuristico);
                    lista_serviciosNewServicio = em.merge(lista_serviciosNewServicio);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = paqueteTuristico.getCodigo_paquete();
                if (findPaqueteTuristico(id) == null) {
                    throw new NonexistentEntityException("The paqueteTuristico with id " + id + " no longer exists.");
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
            PaqueteTuristico paqueteTuristico;
            try {
                paqueteTuristico = em.getReference(PaqueteTuristico.class, id);
                paqueteTuristico.getCodigo_paquete();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The paqueteTuristico with id " + id + " no longer exists.", enfe);
            }
            List<Servicio> lista_servicios = paqueteTuristico.getLista_servicios();
            for (Servicio lista_serviciosServicio : lista_servicios) {
                lista_serviciosServicio.getLista_paquetes().remove(paqueteTuristico);
                lista_serviciosServicio = em.merge(lista_serviciosServicio);
            }
            em.remove(paqueteTuristico);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<PaqueteTuristico> findPaqueteTuristicoEntities() {
        return findPaqueteTuristicoEntities(true, -1, -1);
    }

    public List<PaqueteTuristico> findPaqueteTuristicoEntities(int maxResults, int firstResult) {
        return findPaqueteTuristicoEntities(false, maxResults, firstResult);
    }

    private List<PaqueteTuristico> findPaqueteTuristicoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(PaqueteTuristico.class));
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

    public PaqueteTuristico findPaqueteTuristico(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(PaqueteTuristico.class, id);
        } finally {
            em.close();
        }
    }

    public int getPaqueteTuristicoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<PaqueteTuristico> rt = cq.from(PaqueteTuristico.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
