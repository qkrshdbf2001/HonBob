package egovframework.example.product.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("productMapper")
public interface ProductMapper {

	List<EgovMap> allProductList(Map<String, Object> map);

	void insertProduct(Map<String, Object> resMap);

	void insertProductImage(Map<String, Object> dtlmap);

	List<EgovMap> selectProductList(int pageName);

	List<EgovMap> selectImgList();

	EgovMap selectProduct(int pcode);

	List<EgovMap> selectProductImg(int pcode);

	EgovMap productSelect(String pname);

	void addOrder(Map<String, Object> resMap);

	void addOrderDetail(Map<String, Object> resMap);

	void addOaderdetail(Map<String, Object> resMap);

	void addProductCheck(int ocode);

	List<EgovMap> selectOrderList(String ucode);

	void delectOrders(int id);

	List<EgovMap> selectReview(int pcode);

	void delectProduct(int pcode);

	void updateProduct(Map<String, Object> resMap);
	void updateProductImage(Map<String, Object> resMap);
	void delectProductImage(Map<String, Object> resMap);

	void updateProductStock(String pcode);

}
