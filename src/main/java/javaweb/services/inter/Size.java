package javaweb.services.inter;

public interface Size {
	public javaweb.Entity.Size getByID(int id);
	public javaweb.Entity.Size postNew(String newColorName);
}
