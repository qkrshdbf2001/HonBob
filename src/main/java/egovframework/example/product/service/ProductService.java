package egovframework.example.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface ProductService {

	List<EgovMap> allProductList(Map<String, Object> map);

	void saveAdProduct(Map<String, Object> resMap, MultipartFile[] file, MultipartHttpServletRequest muti);

	List<EgovMap> selectProductList(int pageName);

	List<EgovMap> selectImgList();

	EgovMap selectProduct(int pcode);

	List<EgovMap> selectProductImg(int pcode);

	EgovMap productInfo(String pname);

	int addOrder(Map<String, Object> resMap);

	void addProductCheck(int ocode);

	List<EgovMap> selectMyoderList(String ucode);

	void delectOrder(int id);

	void delectProduct(int pcode);

	List<EgovMap> selectReview(int pcode);

	void subProductStock(String pcode);

}
