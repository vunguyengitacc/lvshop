package javaweb.Entity;
// Generated Jul 1, 2021, 2:48:58 PM by Hibernate Tools 5.1.10.Final

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * ProductHasSizeId generated by hbm2java
 */
@Embeddable
public class ProductHasSizeId implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int productId;
	private int sizeId;

	public ProductHasSizeId() {
	}

	public ProductHasSizeId(int productId, int sizeId) {
		this.productId = productId;
		this.sizeId = sizeId;
	}

	@Column(name = "PRODUCT_ID", nullable = false)
	public int getProductId() {
		return this.productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	@Column(name = "SIZE_ID", nullable = false)
	public int getSizeId() {
		return this.sizeId;
	}

	public void setSizeId(int sizeId) {
		this.sizeId = sizeId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof ProductHasSizeId))
			return false;
		ProductHasSizeId castOther = (ProductHasSizeId) other;

		return (this.getProductId() == castOther.getProductId()) && (this.getSizeId() == castOther.getSizeId());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getProductId();
		result = 37 * result + this.getSizeId();
		return result;
	}

}
