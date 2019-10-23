package egovframework.example.cmmn.customtag.groupcode;

import java.util.Comparator;

import egovframework.example.cmmn.customtag.groupcode.service.GroupCodeVO;

public class CodeComparator implements Comparator<GroupCodeVO> {

	@Override
	public int compare(GroupCodeVO o1, GroupCodeVO o2) {
		
		int sortOrder1 = o1.getSortSeq();
		int sortOrder2 = o2.getSortSeq();

		if (sortOrder1 > sortOrder2) {
			return 1;
		} else if (sortOrder1 < sortOrder2) {
			return -1;
		} else {
			return 0;
		}
	}
}
