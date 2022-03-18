package kr.spring.util;

import java.util.Comparator;
import java.util.List;
import kr.spring.util.GetInfoUtil;
import kr.spring.contents.vo.ContentsVO;

public class ListComparator implements Comparator<ContentsVO> {

	@Override
	public int compare(ContentsVO o1, ContentsVO o2) {
		List<ContentsVO> list = null;
		GetInfoUtil util = new GetInfoUtil();
		list = util.getInfoList("movie");

		float first = o1.getVote_average();
		float second = o2.getVote_average();
		if (first < second) {
			return 1;
		} else if (first > second) {
			return -1;
		} else {
			return 0;
		}

	}

}
