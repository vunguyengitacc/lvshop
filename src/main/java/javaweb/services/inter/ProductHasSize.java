package javaweb.services.inter;

public interface ProductHasSize {
	//get exist
	public int getAmount(int idProduct, int idSize);

	public javaweb.Entity.ProductHasSize getByIDSizeAndProduct(int idProduct, int idSize);

	//create new
	public boolean postNew(int idProduct, int idSize, int amount);

	//update exist
	public boolean put(int idProduct, int idSize, int amount);

	//delete exist
	public boolean deleteOne(int idProduct, int idSize);
	
	public boolean deleteMany(int idProduct);

}
