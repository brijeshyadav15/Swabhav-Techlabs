package com.techlabs.collections.test;

import java.util.*;

import com.techlabs.collections.*;
@SuppressWarnings({ "rawtypes", "unchecked" })
public class TestLineItem {
	public static void main(String[] args) {
		//casestudyone();
		casestudytwo();
	}

	public static void casestudyone() { //NOT Type safe
		List items = new ArrayList();
		items.add(new LineItem(1, "Product1", 5, 10));
		items.add(new LineItem(2, "Product2", 8, 12));
		items.add(new LineItem(3, "Product3", 10, 15));
		items.add("Brijesh");

		for (Object item : items) {
			System.out.println("Total Price of "
					+ ((LineItem) item).getProduct() + "is:"
					+ ((LineItem) item).calcTotal());
		}

	}
	
	public static void casestudytwo() { //Generic case
		List<LineItem> items = new ArrayList<LineItem>();
		items.add(new LineItem(1, "Product1", 5, 10));
		items.add(new LineItem(2, "Product2", 8, 12));
		items.add(new LineItem(3, "Product3", 10, 15));
		//items.add("Brijesh");

		for (LineItem item : items) {
			System.out.println("Total Price of "
					+  item.getProduct() + "is:"
					+  item.calcTotal());
		}

	}

}
