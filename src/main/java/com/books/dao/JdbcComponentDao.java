package com.books.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import com.books.model.Component;
import com.books.rowmapper.ComponentRowMapper;

/**

 * 
 */
public class JdbcComponentDao extends JdbcDaoSupport implements ComponentDao {
	
	@Autowired
	private NamedParameterJdbcTemplate namedJdbcTemplate;
	
	private KeyHolder holderForComponentId;
	
	//The spelling of "itemid" has to match the spelling of the column in the database
	public static final String COMPONENTID = "itemid";
	
	/**
	 * @param
	 * @return list of all components
	 */
	public List<Component> getListOfComponents() {
		return getJdbcTemplate().query(Component.GET_ALL_COMPONENTS, new ComponentRowMapper());
	}

//	public void addComponent(final String itemName, final Integer baseQuantity, final String baseUnitOfMeasure, final Integer calories){
		public void addComponent(final String itemName, final Integer baseQuantity, final String baseUnitOfMeasure, final Integer calories, final Boolean isFavorite){

			MapSqlParameterSource componentMap = new MapSqlParameterSource();
			
			holderForComponentId = this.getHolderForUserId();
			
			//component stuff
			componentMap.addValue("ITEMNAME", itemName);
			componentMap.addValue("BASEQUANTITY", baseQuantity);
			componentMap.addValue("BASEUNITOFMEASURE", baseUnitOfMeasure);
			componentMap.addValue("CALORIES", calories);
			componentMap.addValue("ISFAVORITE", isFavorite);
			
			//This adds the component to the component table in the database
			namedJdbcTemplate.update(Component.ADD_COMPONENT, componentMap, holderForComponentId, new String[] { COMPONENTID });
			
			//This gets the newly created book's id
			int addedBookId = holderForComponentId.getKey().intValue();
			
	}
	
	/**
	 * 
	 * gets a generatedkeyholder - if there is no keyholder, it makes a new one
	 * and sets it
	 * 
	 */
	public KeyHolder getHolderForUserId() {
		if (holderForComponentId == null) {
			this.setHolderForComponentId(new GeneratedKeyHolder());
		}
		return holderForComponentId;
	}
	
	/**
	 * @param holderForUserId
	 *            the holderForUserId to set
	 */
	public void setHolderForComponentId(KeyHolder holderforUserId) {
		this.holderForComponentId = holderforUserId;
	}
}