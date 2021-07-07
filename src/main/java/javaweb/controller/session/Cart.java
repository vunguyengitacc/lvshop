package javaweb.controller.session;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@JsonInclude(Include.NON_EMPTY)
public class Cart {

	public Cart(List<CartItem> lstItem, BigDecimal totalValue) {
		super();
		this.lstItem = lstItem;
		this.totalValue = totalValue.setScale(2);				
	}

	private List<CartItem> lstItem;
	private BigDecimal totalValue;

	public Cart() {
		super();
		this.lstItem = new ArrayList<CartItem>();
		this.totalValue = new BigDecimal("0.00");						
	}

	public Cart(CartItem item, BigDecimal value) {
		super();
		this.lstItem = new ArrayList<CartItem>();
		this.lstItem.add(item);
		this.totalValue = new BigDecimal("0.00");
		this.totalValue = this.totalValue.add(value).setScale(2);						
	}

	public List<CartItem> getLstItem() {
		return lstItem;
	}

	public void setLstItem(List<CartItem> lstItem) {
		this.lstItem = lstItem;
		this.totalValue = lstItem.stream().map(item -> item.getValue())
				.reduce(BigDecimal.ZERO.setScale(2), BigDecimal::add).setScale(2);
	}

	public BigDecimal getTotalValue() {
		return totalValue;
	}

	public void setTotalValue(BigDecimal totalValue) {
		this.totalValue = totalValue.setScale(2);
	}

	public void addLstItem(CartItem newItem, BigDecimal newValue) {
		this.getLstItem().add(newItem);
		this.totalValue = this.totalValue.add(newValue).setScale(2);		
	}

	public void removeItem(CartItem newItem) {
		this.lstItem.remove(newItem);
		this.totalValue = this.totalValue.subtract(newItem.getValue()).setScale(2);		
	}

}
