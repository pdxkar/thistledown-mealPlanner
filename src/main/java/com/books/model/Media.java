package com.books.model;

/**
 * 
 * Media - A PhysicalBook contains a list of Media objects. Media describes the
 * auxiliary materials that can come with a book, such as CDs, DVDs, or test
 * materials.
 * 
 */
public class Media {

	// SQL query to get all media objects for a given physicalbook:
	public static final String GET_ALL_MEDIA_FOR_PHYSICALBOOK = 
			"SELECT description, status, physicalmediaid, mediatype "
			+ "FROM media "
			+ "JOIN physicalmedia "
			+ "ON media.mediaid = physicalmedia.mediaid "
			+ "WHERE physicalbookid = ?";

	private String mediaType;
	private String mediaDescription;
	private int physicalMediaId;
	private String status;
	

	public Media() {

	}

	public String getMediaType() {
		return mediaType;
	}

	public void setMediaType(String mediaType) {
		
		//this.mediaType = MediaType.valueOf(mediaType).toString();
		this.mediaType = mediaType;

	}

	public String getMediaDescription() {
		return mediaDescription;
	}

	public void setMediaDescription(String mediaDescription) {
		this.mediaDescription = mediaDescription;
	}

	public int getPhysicalMediaId() {
		return physicalMediaId;
	}

	public void setPhysicalMediaId(int physicalMediaId) {
		this.physicalMediaId = physicalMediaId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
