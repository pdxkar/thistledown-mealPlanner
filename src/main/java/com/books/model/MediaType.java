package com.books.model;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public enum MediaType {

	CD("CD", 1), 
	DVD("DVD", 2), 
	BOOKLET("BOOKLET", 3),
	UNKNOWN ("UNKNOWN", 999);


	private static final Map<Integer, MediaType> VALUE_LOOKUP = new HashMap<Integer, MediaType>();
	private static final List<MediaType> MEDIA_TYPES = new ArrayList<MediaType>();

	/**
	 * Set Map<MediaType> valuelookup for retrieval of OrderType by Integer
	 * (value)
	 */
	static {
		for (MediaType s : EnumSet.allOf(MediaType.class)) {
			VALUE_LOOKUP.put(s.getValue(), s);
		}
	}

	/**
	 * List all media types
	 */
	static {
		for (MediaType s : EnumSet.allOf(MediaType.class)) {
			MEDIA_TYPES.add(s);
		}
	}

	private int value;
	private String stringValue;

	/**
	 * Construct a MediaType with given values
	 * 
	 * @param action
	 * @param value
	 */
	private MediaType(String stringValue, int value) {
		this.value = value;
		this.stringValue = stringValue;
	}

	/**
	 * @return int value of Mediatype
	 */
	public int getValue() {
		return value;
	}
	
	public String getStringValue() {
		return stringValue;
	}

	/**
	 * @param value
	 * @return Mediatype corresponding to value
	 */
	public static MediaType get(int value) {
		return VALUE_LOOKUP.containsKey(value) ? VALUE_LOOKUP.get(value) : UNKNOWN;
	}

	/**
	 * 
	 * @return List of Mediatype
	 */
	public static List<MediaType> getMediaTypes() {
		return MEDIA_TYPES;
	}
}
