package kr.spring.contents.vo;

public class ContentsVO {
	private String id;
	private String popularity;
	private String title;
	private String overview;
	private String poster_path;
	private String release_date;
	private String vote_average;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public String getPoster_path() {
		return poster_path;
	}

	public void setPoster_path(String poster_path) {
		if (poster_path != null) {
			this.poster_path = "https://image.tmdb.org/t/p/original/" + poster_path;
		} else {
			this.poster_path = poster_path;
		}

	}

	public String getRelease_date() {
		return release_date;
	}

	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPopularity() {
		return popularity;
	}

	public void setPopularity(String popularity) {
		this.popularity = popularity;
	}

	public String getVote_average() {
		return vote_average;
	}

	public void setVote_average(String vote_average) {
		this.vote_average = vote_average;
	}

	@Override
	public String toString() {
		return "TestVO [id=" + id + ", popularity=" + popularity + ", title=" + title + ", overview=" + overview
				+ ", poster_path=" + poster_path + ", release_date=" + release_date + ", vote_average=" + vote_average
				+ "]";
	}
}
