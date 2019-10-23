package egovframework.example.cmmn.customtag.groupcode.service;

/**
 * 
 * Group Code VO
 *
 */
public class GroupCodeVO {
	private String cmCdGrp		= "";
	private String cmCdGrpNm	= "";
	private String cmCd			= "";
	private String cmCdNm		= "";
	private String cmCdGrpDsc	= "";
	private String cmCdDsc		= "";
	private String useYn		= "Y";
	private int sortSeq			= 0;
	
	
	public String getCmCdGrp() {
		return cmCdGrp;
	}
	public void setCmCdGrp(String cmCdGrp) {
		this.cmCdGrp = cmCdGrp;
	}
	public String getCmCdGrpNm() {
		return cmCdGrpNm;
	}
	public void setCmCdGrpNm(String cmCdGrpNm) {
		this.cmCdGrpNm = cmCdGrpNm;
	}
	public String getCmCd() {
		return cmCd;
	}
	public void setCmCd(String cmCd) {
		this.cmCd = cmCd;
	}
	public String getCmCdNm() {
		return cmCdNm;
	}
	public void setCmCdNm(String cmCdNm) {
		this.cmCdNm = cmCdNm;
	}
	public String getCmCdGrpDsc() {
		return cmCdGrpDsc;
	}
	public void setCmCdGrpDsc(String cmCdGrpDsc) {
		this.cmCdGrpDsc = cmCdGrpDsc;
	}
	public String getCmCdDsc() {
		return cmCdDsc;
	}
	public void setCmCdDsc(String cmCdDsc) {
		this.cmCdDsc = cmCdDsc;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public int getSortSeq() {
		return sortSeq;
	}
	public void setSortSeq(int sortSeq) {
		this.sortSeq = sortSeq;
	}

}
