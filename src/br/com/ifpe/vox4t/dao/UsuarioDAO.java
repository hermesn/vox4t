package br.com.ifpe.vox4t.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

import br.com.ifpe.vox4t.model.Usuario;
import twitter4j.Status;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

/**
 * @Author: henrique
 */

public class UsuarioDAO {
	
	private EntityManagerFactory factory = null;
	private EntityManager manager = null;
	private static final String PERSISTENCE_UNIT = "vox4t";
	
	public UsuarioDAO(){
		 this.factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		 this.manager = this.factory.createEntityManager();
	}


	public void salvar(Usuario usuario) {
		
	   
		this.manager.getTransaction().begin();
		this.manager.persist(usuario);
		this.manager.getTransaction().commit();
		
		
	}


	public boolean logar(String emailUsuario, String senhaUsuario) {
		
		Query query = null;
		query = manager.createQuery("FROM Usuario WHERE email = :paramEmail AND senha = :paramSenha");
		query.setParameter("paramEmail", emailUsuario);
		query.setParameter("paramSenha", senhaUsuario);
		@SuppressWarnings("unchecked")
		List<Usuario> lista = query.getResultList();
		
		
		if (lista.size() > 0) {
			System.out.println("Encontrou");
			return true;
		} else {
			System.out.println("Não encontrou");
			return false;
		}
		
	}
	
	public Usuario buscarPorEmail(String email) {

		Usuario obj = null;

		
		Query query = null;
		query = manager.createQuery("FROM Usuario WHERE email = :paramEmail");
		query.setParameter("paramEmail", email);
		
		try {
			obj = (Usuario) query.getSingleResult();
		}catch(NoResultException nre) {
			return null;
		}
		
		return obj;

	    }

	//ESTE METODO VAI PRA CLASSE TWITTER FUTURAMENTE
	public List<Status> testeTwitter() throws TwitterException {
		
		ConfigurationBuilder cb = new ConfigurationBuilder();
		
				cb.setDebugEnabled(true)
					.setOAuthConsumerKey("Wc1xqD1ZXDFD1M2xoPJSwU687")
					.setOAuthConsumerSecret("REiwyUuT8RkI580qxQ9L6qz4XsI6WSLssR1UtjnuX4uMEe8KF8")
					.setOAuthAccessToken("987757693040545797-wlQva0FLSy6ZQPcrqt6KxiFNnArhms1")
					.setOAuthAccessTokenSecret("55j6SRHL31KKFC8CC4HH2QdISyMZJs9q8hsch9zF41Fuz")
					.setTweetModeExtended(true);
				
		TwitterFactory tf = new TwitterFactory(cb.build());
		twitter4j.Twitter twitter = tf.getInstance();
		
		
		List<Status> status = twitter.getUserTimeline("@jctransito");
		
		return status;
	}
	
	public void fecharConexao() {
		this.manager.close();
		this.factory.close();
	}


}
