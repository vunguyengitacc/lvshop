package javaweb.services.inter;

import java.util.List;

public interface Ward {
	public List<javaweb.Entity.Ward> getByDistrictID(int districtId);
	public javaweb.Entity.Ward getByCommuntID(int communeId);
}
