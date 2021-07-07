package javaweb.services.inter;

import java.util.List;

public interface Commune {
	public javaweb.Entity.Commune getById(int id);
	public List<javaweb.Entity.Commune> getByWardID(int wardId);
}
