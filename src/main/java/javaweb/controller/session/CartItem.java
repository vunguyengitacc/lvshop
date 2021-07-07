package javaweb.controller.session;

import java.math.BigDecimal;

import javaweb.Entity.Product;
import javaweb.Entity.Size;

public class CartItem {
	public Product pro;
	public Size size;
	public int amount;
	public BigDecimal value;

	public Product getPro() {
		return pro;
	}

	public void setPro(Product pro) {
		this.pro = pro;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public BigDecimal getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = new BigDecimal(value);
	}

	public void addAmount(int newAmount) {
		this.amount += newAmount;
	}

	public void refreshValue() {
		BigDecimal amountDecimal = new BigDecimal(this.amount);
		BigDecimal priceToCalc = this.getPro().getPromotionPrice();
		if(priceToCalc.compareTo(new BigDecimal(0))==0)
			priceToCalc = this.getPro().getPrice();
		this.setValue(priceToCalc.multiply(amountDecimal).toString());
	}

	public Size getSize() {
		return size;
	}

	public void setSize(Size size) {
		this.size = size;
	}

}
