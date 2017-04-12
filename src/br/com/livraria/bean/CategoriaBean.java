package br.com.livraria.bean;

import javax.faces.bean.ManagedBean;

import br.com.livraria.bo.Categoria;
import br.com.livraria.jdbc.dao.CategoriaDAO;

@ManagedBean
public class CategoriaBean {
	
	private Categoria categoria = new Categoria();
	
	public Categoria getCategoria() {
		return categoria;
	}
	
	public void gravar(){
		CategoriaDAO dao = new CategoriaDAO();
		dao.setCategoria(categoria);
		dao.close();
	}
}
