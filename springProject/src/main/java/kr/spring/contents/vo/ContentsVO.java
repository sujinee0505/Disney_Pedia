package kr.spring.contents.vo;

import java.util.Date;
import java.util.List;

public class ContentsVO {
	private String id;
	private float popularity;
	private String title;
	private String overview;
	private String poster_path;
	private Date release_date;
	private Date first_air_date;
	private float vote_average;
	private String genre;
	private String runtime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public float getPopularity() {
		return popularity;
	}

	public void setPopularity(float f) {
		this.popularity = f;
	}

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
		this.poster_path = "https://image.tmdb.org/t/p/original/" + poster_path;

	}

	public Date getRelease_date() {
		return release_date;
	}

	public void setRelease_date(Date release_date) {
		this.release_date = release_date;
	}

	public Date getFirst_air_date() {
		return first_air_date;
	}

	public void setFirst_air_date(Date first_air_date) {
		this.first_air_date = first_air_date;
	}

	public float getVote_average() {
		return vote_average;
	}

	public void setVote_average(float vote_average) {
		this.vote_average = vote_average;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getRuntime() {
		return runtime;
	}

	public void setRuntime(String runtime) {
		int run_time = Integer.parseInt(runtime);
		int hours = 0;
		int minutes = 0;
		if (run_time < 60) {
			minutes = run_time;
			this.runtime = minutes + "분";
		} else if (run_time % 60 == 0) {
			hours = run_time % 60;
			this.runtime = hours + "시간";
		} else {
			hours = run_time / 60;
			minutes = run_time % 60;
			this.runtime = hours + "시간 " + minutes + "분";
		}

	}

	@Override
	public String toString() {
		return "ContentsVO [id=" + id + ", popularity=" + popularity + ", title=" + title + ", overview=" + overview
				+ ", poster_path=" + poster_path + ", release_date=" + release_date + ", first_air_date="
				+ first_air_date + ", vote_average=" + vote_average + ", genre=" + genre + "]";
	}

}