package com.books.model;

public class TagCount {
	/**
	 * @return list of tag counts, including tags not referenced by a book (return as 0 count)
	 */
	public static final String GET_ALL_TAG_COUNTS =
			"SELECT t.tagid, t.tagname, count (bt.tagid) " +
				"FROM (SELECT DISTINCT tagid, tagname from tag) AS t " +
				"LEFT OUTER JOIN booktag AS bt on t.tagid = bt.tagid " +
				"GROUP BY t.tagid, t.tagname ORDER BY count(bt.tagid) DESC";
	/**
	 * @return list of referenced tag counts (only tags referenced by one or more book)
	 */
	public static final String GET_TAG_COUNTS =
			"SELECT bt.tagid, t.tagname, COUNT(bt.tagid) FROM tag AS t " + 
				"JOIN booktag AS bt ON bt.tagid = t.tagid " + 
				"GROUP BY bt.tagid, t.tagname ORDER BY COUNT(bt.tagid) DESC";
	
	private int tagCount;
	private Tag tag;
	
	public TagCount() {}
	public TagCount(int tagCount, Tag tag) { this.tagCount = tagCount; this.tag = tag;}
	
	public int getTagCount() { return tagCount;}
	public Tag getTag() { return tag;}
	
	public void setTagCount(int tagCount) { this.tagCount = tagCount;}
	public void setTag(Tag tag) { this.tag = tag;}
}
