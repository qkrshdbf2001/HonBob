package egovframework.example.product.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.cmmn.FileUpload;
import egovframework.example.product.service.ProductService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("productService")
public class ProductServiceImpl implements ProductService{

	@Resource(name="productMapper")
	private ProductMapper productMapper;
	
	@Autowired
	private FileUpload fileupload;
	
	@Override
	public List<EgovMap> allProductList(Map<String, Object> map) {
		return productMapper.allProductList(map);
	}

	@Override
	public void saveAdProduct(Map<String, Object> resMap, MultipartFile[] file, MultipartHttpServletRequest muti) {
		String[] fileName= fileupload.fileUpload(file, muti);
		Map<String, Object> dtlmap = new HashMap<String, Object>();
		
		if (resMap.get("editType").equals("insert")) {
			productMapper.insertProduct(resMap);
			
			System.out.println("삽입");
			for (int i=0; i< fileName.length; i++) {
				dtlmap.clear();
				dtlmap.put("pcode", resMap.get("pcode"));
				dtlmap.put("fileName", fileName[i]);
				productMapper.insertProductImage(dtlmap);
				System.out.println(dtlmap);
				
			}
		} else if (resMap.get("editType").equals("update")) {
			System.out.println("수정");
			productMapper.updateProduct(resMap);
			
			for (int i=0; i< fileName.length; i++) {
				dtlmap.clear();
				dtlmap.put("pcode", resMap.get("pcode"));
				dtlmap.put("fileName", fileName[i]);
				dtlmap.put("pcode", resMap.get("pcode"));
				
				productMapper.updateProductImage(dtlmap);
			}
			
			resMap.put("fileCount", fileName.length);
			productMapper.delectProductImage(resMap);
		}
	}

	@Override
	public List<EgovMap> selectProductList(int pageName) {

		return productMapper.selectProductList(pageName);
	}

	@Override
	public List<EgovMap> selectImgList() {
		return productMapper.selectImgList();
	}

	@Override
	public EgovMap selectProduct(int pcode) {
		return productMapper.selectProduct(pcode);
	}

	@Override
	public List<EgovMap> selectProductImg(int pcode) {
		return productMapper.selectProductImg(pcode);
	}

	@Override
	public EgovMap productInfo(String pname) {
		return productMapper.productSelect(pname);
	}

	@Override
	public int addOrder(Map<String, Object> resMap) {
		productMapper.addOrder(resMap);
		productMapper.addOrderDetail(resMap);
		productMapper.addOaderdetail(resMap);
		return (int) resMap.get("ocode");
	}

	@Override
	public void addProductCheck(int ocode) {
		productMapper.addProductCheck(ocode);
	}

	@Override
	public List<EgovMap> selectMyoderList(String ucode) {
		return productMapper.selectOrderList(ucode);
	}

	@Override
	public void delectOrder(int id) {
		productMapper.delectOrders(id);
	}

	@Override
	public void delectProduct(int pcode) {
		productMapper.delectProduct(pcode);
	}

	@Override
	public List<EgovMap> selectReview(int pcode) {
		return productMapper.selectReview(pcode);
	}

	@Override
	public void subProductStock(String pcode) {
		productMapper.updateProductStock(pcode);
	}

}
