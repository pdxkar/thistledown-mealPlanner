package com.books.model;

public class Component {

	// SQL query to get all components:
	public static final String GET_ALL_COMPONENTS = "SELECT itemid, itemname, category, basequantity, baseunitofmeasure, "
			+ " calories, carbs, protein, fiber, sugar, sodium, fat, image, cholesterol, isfavorite"
			+ " FROM basecomponent";
	
	//SQL query to get QuickList from DB (isFavorite = TRUE)
	//this is going to have to soon take a "category" or something so that the favorites can be
	//allocated between the "breakfast" section, "dinner" section etc.
	//this will have to eventually take a userId because every user has a different quicklist
/*	public static final String GET_QUICK_LIST = "SELECT itemid, itemname, basequantity, baseunitofmeasure, "
			+ " calories"
			+ " FROM basecomponent"
			+ " WHERE isFavorite = ?";*/
	//*****we're pretending that "carbs" are actually "gram equivalents just until we can re-work the db
	public static final String GET_QUICK_LIST = "SELECT itemid, itemname, category, basequantity, baseunitofmeasure, "
			+ " calories, carbs, protein, fiber, sugar, sodium, fat, image, cholesterol, isfavorite"
			+ " FROM basecomponent"
			+ " WHERE isFavorite = ?";
	
	//SQL query to add a component
	public static final String ADD_COMPONENT = "INSERT INTO basecomponent ("
			+ " itemName"
			+ ", category"			
			+ ", baseQuantity"
			+ ", baseUnitOfMeasure"
			+ ", calories"
			+ ", isFavorite"
			+ ") VALUES ("
			+ "  :ITEMNAME"
			+ " ,:CATEGORY"			
			+ " ,:BASEQUANTITY"			
			+ " ,:BASEUNITOFMEASURE"
			+ " ,:CALORIES"
			+ " ,:ISFAVORITE"
			+ ")";
	
	//"UPDATE Registration " +
   // "SET age = 30 WHERE id in (100, 101)";
	
	public static final String UPDATE_COMPONENT = "UPDATE basecomponent "
			+ " SET baseQuantity = :BASEQUANTITY "
			+ " WHERE itemId = :ITEMID";
	
/*	public static final String UPDATE_COMPONENT = "UPDATE basecomponent "
			+ " SET baseQuantity = 300 "
			+ " WHERE itemId = 243";*/
	
/*	public static final String UPDATE_COMPONENT = "UPDATE basecomponent ("		
			+ " itemName"
			+ ", category"			
			+ ", baseQuantity"
			+ ", baseUnitOfMeasure"
			+ ", calories"
			+ ", isFavorite"
			+ ") VALUES ("
			+ "  :ITEMNAME"
			+ " ,:CATEGORY"			
			+ " ,:BASEQUANTITY"			
			+ " ,:BASEUNITOFMEASURE"
			+ " ,:CALORIES"
			+ " ,:ISFAVORITE"
			+ ")"
			+ " WHERE itemId = '240'";*/
	
	//private variables
	private int itemid; 
	private String itemname;
	private int category;
	private Double basequantity;
	private String baseunitofmeasure;
	private Double calories;
	//*****let's pretend that "carbs" are actually "gram equivalents just until we can re-work the db?
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

	public Double getBasequantity() {
		return basequantity;
	}

	public void setBasequantity(Double basequantity) {
		this.basequantity = basequantity;
	}

	public String getBaseunitofmeasure() {
		return baseunitofmeasure;
	}

	public void setBaseunitofmeasure(String baseunitofmeasure) {
		this.baseunitofmeasure = baseunitofmeasure;
	}

	public Double getCalories() {
		return calories;
	}

	public void setCalories(Double calories) {
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
