package javaweb.services.inter;

import java.util.List;

public interface District {
	public List<javaweb.Entity.District> getAll();
	public javaweb.Entity.District getByWardID(int wardId);
}
