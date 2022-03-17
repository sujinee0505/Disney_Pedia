package kr.spring.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import kr.spring.contents.vo.ContentsVO;

public class GetInfoUtil {

	// TMDB API KEY
	private final String KEY = "d4bdd7b053d3ab0a1ed909424e2bb707";
	// API를 통해 추출한 json형태의 결과값을 저장할 변수 result
	private String result = "";

	// 페이지 단위로 데이터를 제공하기 때문에 총 페이지 수를 알기 위한 메소드
	public int getPages(String type) {
		int page = 0;

		try {

			// 데이터를 받아오기 위한 API 호출 URL, type (영화인지 시리즈인지에 따라 결과 값이 달라짐)
			URL url = new URL("https://api.themoviedb.org/3/discover/" + type + "?api_key=" + KEY
					+ "&with_watch_providers=337&watch_region=KR&language=ko");
			// URL 객체를 통해서 url을 연결한 후 API가 제공하는 원본데이터를 가져와서 버퍼에 저장
			BufferedReader bf;

			/*
			 * BufferedReader는 속성에 Reader 클래스가 와야하는데, URL에서 제공되는 메소드인 openStream() 사용하기 위해
			 * InputStreamReader를 속성으로 사용. 한글이 깨지는 경우가 있어서 UTF-8을 추가.
			 */
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

			// 읽어온 Buffer 데이터를 readLine() 메소드를 사용해서 한줄씩 읽어 result변수에 저장
			result = bf.readLine();

			/*
			 * 현재까지는 result에 저장되어 있는 값은 String타입이므로 json타입으로 인식하도록 바꾸기 위해서 JSON 관련 라이브러리를 사용
			 * JSONParser를 사용해서 String 값을 json 객체로 만들어준다.
			 */
			JSONParser jsonParser = new JSONParser();

			// 만들어진 JSON 객체는 JSONObject 사용해서 저장
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);

			// 만들어진 JSONObject에서 key가 total_pages인 value를 추출하기 위해서 get() 사용
			String pages = jsonObject.get("total_pages").toString();

			page = Integer.parseInt(pages);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return page;
	}

	// 컨텐츠 상세 정보 추출 메소드
	public List<ContentsVO> getInfoList(String type) {
		int pages = getPages(type);

		List<ContentsVO> infoList = null;
		try {
			// 페이지 마다 루트를 돌며 값 추출 및 저장
			for (int i = 1; i <= 1; i++) {
				String apiURL = "https://api.themoviedb.org/3/discover/" + type + "?api_key=" + KEY
						+ "&with_watch_providers=337&watch_region=KR&language=ko&page=" + i;
				URL url = new URL(apiURL);

				BufferedReader bf;

				bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

				result = bf.readLine();

				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
				JSONArray list = (JSONArray) jsonObject.get("results");
				infoList = new ArrayList<ContentsVO>();
				for (int j = 0; j < list.size(); j++) {
					ContentsVO contents = new ContentsVO();
					JSONObject movie = (JSONObject) list.get(j);
					if (movie.get("id") != null) {
						contents.setId(movie.get("id").toString());
					} else if (movie.get("id") == null) {
						contents.setId("정보가 없습니다.");
					}
					if (movie.get("popularity") != null) {
						contents.setPopularity(movie.get("popularity").toString());
					} else if (movie.get("popularity") != null) {
						contents.setPopularity("정보가 없습니다");
					}
					if (movie.get("overview") != null) {
						contents.setOverview(movie.get("overview").toString());
					} else if (movie.get("overview") == null || movie.get("overview").equals("")) {
						contents.setOverview("정보가 없습니다");
					}
					if (movie.get("poster_path") != null) {
						contents.setPoster_path(movie.get("poster_path").toString());
					} else if (movie.get("poster_path") == null) {
						contents.setPoster_path("");
					}
					if (movie.get("release_date") != null) {
						contents.setRelease_date(movie.get("release_date").toString());
					} else if (movie.get("release_date") == null) {
						contents.setRelease_date("정보가 없습니다");
					}
					if (movie.get("title") != null) {
						contents.setTitle(movie.get("title").toString());
					} else if (movie.get("title") == null) {
						contents.setTitle("정보가 없습니다");
					}
					if (movie.get("vote_average") != null) {
						contents.setVote_average(movie.get("vote_average").toString());
					} else if (movie.get("vote_average") != null) {
						contents.setVote_average("정보가 없습니다");
					}
					infoList.add(contents);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return infoList;
	}

}