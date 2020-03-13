package com.clh.util;

import java.util.*;

import com.clh.bean.Car;

public class CarComparator implements Comparator{
	
	public int compare(Object o1,Object o2) {
		double price1 = ((Car)o1).getPrice();
		double price2 = ((Car)o2).getPrice();

		if(price1>price2) {
			return 1;
		}else if(price1<price2) {
			return -1;
		}else {
			return 0;
		}
	}
}
