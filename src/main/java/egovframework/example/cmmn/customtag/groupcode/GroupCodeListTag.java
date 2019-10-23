package egovframework.example.cmmn.customtag.groupcode;

import java.util.Collections;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.jsoup.nodes.Element;

import egovframework.example.cmmn.customtag.groupcode.service.GroupCodeVO;
import egovframework.example.cmmn.StringUtil;

/**
 * JSP에서 groupCodeList Tag 생성시 호출되는  Class.
 */

public class GroupCodeListTag extends TagSupport {
	private static final long serialVersionUID = 1L;

	private String pageCode;
	private String groupId;
	private String codeIds;
	private String objectType;
	private String objectId;
	private String objectClass;
	private String objectName;
	private String objectValue;
	private String allTagYn;
	private String allTagText = "ALL";
	private String isEditable = "Y";
	private String useYn;
	private String sortOrderYn;

	public String getPageCode() {
		return pageCode;
	}

	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getCodeIds() {
		return codeIds;
	}

	public void setCodeIds(String codeIds) {
		this.codeIds = codeIds;
	}

	public String getObjectType() {
		return objectType;
	}

	public void setObjectType(String objectType) {
		this.objectType = objectType;
	}

	public String getObjectId() {
		return objectId;
	}

	public void setObjectId(String objectId) {
		this.objectId = objectId;
	}

	public String getObjectClass() {
		return objectClass;
	}

	public void setObjectClass(String objectClass) {
		this.objectClass = objectClass;
	}

	public String getObjectName() {
		return objectName;
	}

	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}

	public String getObjectValue() {
		return objectValue;
	}

	public void setObjectValue(String objectValue) {
		this.objectValue = objectValue;
	}

	public String getAllTagYn() {
		return allTagYn;
	}

	public void setAllTagYn(String allTagYn) {
		this.allTagYn = allTagYn;
	}

	public String getAllTagText() {
		return allTagText;
	}

	public void setAllTagText(String allTagText) {
		this.allTagText = allTagText;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getSortOrderYn() {
		return sortOrderYn;
	}

	public void setSortOrderYn(String sortOrderYn) {
		this.sortOrderYn = sortOrderYn;
	}
	
	public String getIsEditable() {
		return isEditable;
	}

	public void setIsEditable(String isEditable) {
		this.isEditable = isEditable;
	}

	@Override
	public int doStartTag() throws JspException {
		GroupCodeVO groupCodeVO = new GroupCodeVO();

		groupCodeVO.setCmCdGrp(this.groupId);
		groupCodeVO.setCmCd(this.codeIds);

		List<GroupCodeVO> groupCodeVOList = GroupCodeHandler.instance().getCodeList(groupCodeVO);

		//sort 하기
		if ("Y".equals(sortOrderYn)) {
			CodeComparator comp = new CodeComparator();
			
			Collections.sort(groupCodeVOList, comp);
		}

		StringBuffer html = new StringBuffer();

		JspWriter out = pageContext.getOut();
		
		try {

			String result = makeHtmlStr(groupCodeVOList);

			html.append(result.toString());

			out.print(html.toString());
		} catch (Exception e) {
			throw new JspException(e);
		}

		return SKIP_BODY; // no body processing
	}

	private String makeHtmlStr(List<GroupCodeVO> groupCodeVOList) {
		
		if (groupCodeVOList == null ) {
			return null;
		}

		String objectType = getObjectType();
		
		if ("select".equals(objectType)) {
			Element div = new Element("select");

			div.attr("id", 			StringUtil.nvl(getPageCode(), "") + "_" + StringUtil.nvl(getObjectId(), ""));
			div.attr("name", 		StringUtil.nvl(getObjectName(), ""));
			div.attr("class", 		StringUtil.nvl(getObjectClass(), ""));
			div.attr("data-col-nm",	StringUtil.nvl(getObjectId(), ""));
			
			if ("N".equals(getIsEditable())) {
				div.attr("disabled", "true");
			}

			if ("Y".equals(getAllTagYn())) {
				Element option = new Element("option");
				
				option.attr("value", "");
				option.text(getAllTagText());

				if (getObjectValue() != null && this.getObjectValue().isEmpty()) {
					option.attr("selected", "true");
				}

				div.appendChild(option);
			}

			for (GroupCodeVO groupCodeVO : groupCodeVOList) {
				Element option = new Element("option");
				
				option.attr("value", StringUtil.nvl(groupCodeVO.getCmCd(), ""));
				option.text(StringUtil.nvl(groupCodeVO.getCmCdNm(), ""));

				if (getObjectValue() != null && 
						this.getObjectValue().equals(groupCodeVO.getCmCd())) {
					option.attr("selected", "true");
				}

				div.appendChild(option);
			}

			return div.toString();
		} else if("radio".equals(objectType)) {
			StringBuffer stringbuf = new StringBuffer();
			int cnt = 0;

			Element ul = new Element("ul");

			ul.attr("class", "ui-radio");

			if ("Y".equals(getAllTagYn())) {
				Element li = new Element("li");
				Element label = new Element("label");
				Element span = new Element("span");
				Element input = new Element("input");

				input.attr("id", StringUtil.nvl(getPageCode(), "") + "_" + StringUtil.nvl(getObjectId(), "") + "_" + cnt);
				input.attr("type", StringUtil.nvl(getObjectType(), ""));
				input.attr("name", StringUtil.nvl(getObjectName(), ""));
				input.attr("class", StringUtil.nvl(getObjectClass(), ""));
				input.attr("value", "");
				input.attr("data-col-nm",StringUtil.nvl(getObjectId(), ""));
				
				if ("N".equals(getIsEditable())) {
					input.attr("disabled", "true");
				}

				if (getObjectValue() != null && this.getObjectValue().isEmpty()) {
					input.attr("checked", "true");
				}

				span.appendText(getAllTagText());

				label.attr("for", StringUtil.nvl(getPageCode(), "") + "_" + StringUtil.nvl(getObjectId(), "") + "_" + cnt);

				label.appendChild(span);

				li.appendChild(input);
				li.appendChild(label);

				ul.appendChild(li);
			}

			for (GroupCodeVO groupCodeVO : groupCodeVOList) {
				++cnt;
				
				Element li = new Element("li");
				Element label = new Element("label");
				Element span = new Element("span");
				Element input = new Element("input");

				input.attr("id", StringUtil.nvl(getPageCode(), "") + "_" + StringUtil.nvl(getObjectId(), "") + "_" + cnt);
				input.attr("type", StringUtil.nvl(getObjectType(), ""));
				input.attr("name", StringUtil.nvl(getObjectName(), ""));
				input.attr("class", StringUtil.nvl(getObjectClass(), ""));
				input.attr("value", groupCodeVO.getCmCd());
				input.attr("data-col-nm",StringUtil.nvl(getObjectId(), ""));
				
				if ("N".equals(getIsEditable())) {
					input.attr("disabled", "true");
				}


				if (getObjectValue() != null && this.getObjectValue().equals(groupCodeVO.getCmCd())) {
					input.attr("checked", "true");
				}

				span.appendText(groupCodeVO.getCmCdNm());

				label.attr("for", StringUtil.nvl(getPageCode(), "") + "_" + StringUtil.nvl(getObjectId(), "") + "_" + cnt);

				label.appendChild(span);

				li.appendChild(input);
				li.appendChild(label);

				ul.appendChild(li);
			}

			stringbuf.append(ul.toString());

			return stringbuf.toString();
		}

		return null;
	}
}
