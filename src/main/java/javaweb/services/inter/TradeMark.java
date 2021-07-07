package javaweb.services.inter;

import java.util.List;

import javaweb.Entity.Trademark;

public interface TradeMark {
	public List<Trademark> getAll();
	public Trademark getByID(int ID);
	public Trademark postNew(String name);
}
