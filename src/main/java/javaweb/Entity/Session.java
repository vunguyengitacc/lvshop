package javaweb.Entity;
// Generated Jul 1, 2021, 2:48:58 PM by Hibernate Tools 5.1.10.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Session generated by hbm2java
 */
@Entity
@Table(name = "session", catalog = "phonedata")
public class Session implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private Date createDate;
	private Byte isSave;
	private Byte isValidate;

	public Session() {
	}

	public Session(String id) {
		this.id = id;
	}

	public Session(String id, Date createDate, Byte isSave, Byte isValidate) {
		this.id = id;
		this.createDate = createDate;
		this.isSave = isSave;
		this.isValidate = isValidate;
	}

	@Id

	@Column(name = "ID", unique = true, nullable = false, length = 100)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_DATE", length = 19)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "IS_SAVE")
	public Byte getIsSave() {
		return this.isSave;
	}

	public void setIsSave(Byte isSave) {
		this.isSave = isSave;
	}

	@Column(name = "IS_VALIDATE")
	public Byte getIsValidate() {
		return this.isValidate;
	}

	public void setIsValidate(Byte isValidate) {
		this.isValidate = isValidate;
	}

}