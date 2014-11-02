package com.books.model;

public class Component {

	// SQL query to get all components:
	public static final String GET_ALL_COMPONENTS = "SELECT itemid, itemname, category, basequantity, baseunitofmeasure, "
			+ " calories, carbs, protein, fiber, sugar, sodium, fat, image, cholesterol"
			+ " FROM basecomponent";
	
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
}
