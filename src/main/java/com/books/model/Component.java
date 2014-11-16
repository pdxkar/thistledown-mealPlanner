package com.books.model;

//import org.apache.log4j.Logger;

public class Component {
//	 static Logger log4j = Logger.getLogger("com.books.model.Component");
	 
	// SQL query to get all components:
	public static final String GET_ALL_COMPONENTS = "SELECT itemid, itemname, category, basequantity, baseunitofmeasure, "
			+ " calories, carbs, protein, fiber, sugar, sodium, fat, image, cholesterol, isfavorite"
			+ " FROM basecomponent";
	
	public static final String GET_ALL_COMPONENTS_IN_A_DAYMENU = 
			"SELECT basecomponent.itemid, itemname, category, basequantity, baseunitofmeasure, calories, carbs, protein, fiber, sugar, fat, image, cholesterol, isfavorite "
			+"FROM basecomponent "
			+"JOIN basecomponent_daymenu "
			+"ON basecomponent.itemid = basecomponent_daymenu.componentid "
			+"WHERE basecomponent_daymenu.daymenuid = ?";
	//			+"WHERE basecomponent_daymenu.daymenuid = ?";
	
	//SQL query to get a specific daymenu with components attached
//	public static final String GET_DAYMENU_BY_DAYMENUID = "select itemname from basecomponent, basecomponent_daymenu "
//	+ " where basecomponent_daymenu.daymenuid = 1 "
//	+ " and basecomponent_daymenu.componentid = basecomponent.itemid";
	
	//private variables
	private int itemid; 
	private String itemname;
	private int category;
	private float basequantity;
	private String baseunitofmeasure;
	private int calories;
	private float carbs;
	private int protein;
	private float fiber;
	private float sugar;
	private int sodium;
	private float fat;
	private String image;
	private float cholesterol;
	private boolean isFavorite;
	
	//empty constructor
	public Component(){
		
	}

	//getters and setters
	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public float getBasequantity() {
		return basequantity;
	}

	public void setBasequantity(float basequantity) {
		this.basequantity = basequantity;
	}

	public String getBaseunitofmeasure() {
		return baseunitofmeasure;
	}

	public void setBaseunitofmeasure(String baseunitofmeasure) {
		this.baseunitofmeasure = baseunitofmeasure;
	}

	public int getCalories() {
		return calories;
	}

	public void setCalories(int calories) {
		this.calories = calories;
	}

	public float getCarbs() {
		return carbs;
	}

	public void setCarbs(float carbs) {
		this.carbs = carbs;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public float getFiber() {
		return fiber;
	}

	public void setFiber(float fiber) {
		this.fiber = fiber;
	}

	public float getSugar() {
		return sugar;
	}

	public void setSugar(float sugar) {
		this.sugar = sugar;
	}

	public int getSodium() {
		return sodium;
	}

	public void setSodium(int sodium) {
		this.sodium = sodium;
	}

	public float getFat() {
		return fat;
	}

	public void setFat(float fat) {
		this.fat = fat;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public float getCholesterol() {
		return cholesterol;
	}

	public void setCholesterol(float cholesterol) {
		this.cholesterol = cholesterol;
	}

	public boolean isFavorite() {
		return isFavorite;
	}

	public void setIsFavorite(boolean isFavorite) {
		this.isFavorite = isFavorite;
	}
}
