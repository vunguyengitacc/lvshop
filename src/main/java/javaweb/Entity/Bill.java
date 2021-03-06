package javaweb.Entity;
// Generated Jul 1, 2021, 2:48:58 PM by Hibernate Tools 5.1.10.Final

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Bill generated by hbm2java
 */
@Entity
@Table(name = "bill", catalog = "phonedata")
public class Bill implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Account account;
	private Commune commune;
	private BigDecimal totalValue;
	private byte status;
	private Date createDate;
	private Set<BillHasProductHasSize> billHasProductHasSizes = new HashSet<BillHasProductHasSize>(0);

	public Bill() {
	}

	public Bill(Account account, Commune commune, BigDecimal totalValue, byte status) {
		this.account = account;
		this.commune = commune;
		this.totalValue = totalValue;
		this.status = status;
	}

	public Bill(Account account, Commune commune, BigDecimal totalValue, byte status, Date createDate,
			Set<BillHasProductHasSize> billHasProductHasSizes) {
		this.account = account;
		this.commune = commune;
		this.totalValue = totalValue;
		this.status = status;
		this.createDate = createDate;
		this.billHasProductHasSizes = billHasProductHasSizes;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ACCOUNT_USERNAME", nullable = false)
	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "COMMUNE_ID", nullable = false)
	public Commune getCommune() {
		return this.commune;
	}

	public void setCommune(Commune commune) {
		this.commune = commune;
	}

	@Column(name = "TOTAL_VALUE", nullable = false, precision = 20)
	public BigDecimal getTotalValue() {
		return this.totalValue;
	}

	public void setTotalValue(BigDecimal totalValue) {
		this.totalValue = totalValue;
	}

	@Column(name = "STATUS", nullable = false)
	public byte getStatus() {
		return this.status;
	}

	public void setStatus(byte status) {
		this.status = status;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_DATE", length = 19)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "bill")
	public Set<BillHasProductHasSize> getBillHasProductHasSizes() {
		return this.billHasProductHasSizes;
	}

	public void setBillHasProductHasSizes(Set<BillHasProductHasSize> billHasProductHasSizes) {
		this.billHasProductHasSizes = billHasProductHasSizes;
	}

}
