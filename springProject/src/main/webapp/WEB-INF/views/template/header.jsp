<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>


<!-- Google Tag Manager -->
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>왓챠피디아 - 영화, 책, TV 프로그램 추천 및 평가 서비스</title>
<style data-emotion-css="1xm32e0">
.css-1xm32e0 {
	position: relative;
	width: 100%;
}
</style>
<style data-emotion-css="6k8tqb">
.css-6k8tqb {
	display: none;
	position: fixed;
	top: 0px;
	left: 0;
	z-index: 51;
	background: #fff;
	color: #fff;
	text-align: center;
	width: 100%;
	height: 62px;
	box-shadow: 0 1px 0 0 rgba(0, 0, 0, 0.08);
	-webkit-transition: background-color 200ms;
	transition: background-color 200ms;
}

@media ( min-width :720px) {
	.css-6k8tqb {
		display: block;
	}
}
</style>
<style data-emotion-css="1djzg97">
.css-1djzg97 {
	max-width: 1320px;
	margin-right: 20px;
	margin-left: 20px;
}

@media ( min-width :600px) {
	.css-1djzg97 {
		margin-right: 20px;
		margin-left: 20px;
	}
}

@media ( min-width :760px) {
	.css-1djzg97 {
		margin: 0 3.5%;
	}
}

@media ( min-width :1100px) {
	.css-1djzg97 {
		margin: 0 60px;
	}
}

@media ( min-width :1440px) {
	.css-1djzg97 {
		margin-right: auto;
		margin-left: auto;
	}
}
</style>
<style data-emotion-css="6v7b8v-VisualUl">
.css-6v7b8v-VisualUl {
	list-style: none;
	padding: 0;
	margin: 0;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	overflow: hidden;
}

@media ( max-width :719px) {
	.css-6v7b8v-VisualUl {
		height: 100%;
		overflow: unset;
	}
}
</style>
<!-- <style data-emotion-css="t686xv">
.css-t686xv {
	margin: 15px 15px 0 0;
}
</style> -->
<style data-emotion-css="12v09xw">
.css-12v09xw {
	width: 151px;
	height: 29px;
}
</style>
<style data-emotion-css="bj71cw">
.css-bj71cw {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	height: 62px;
	margin: 0 0 0 24px;
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0;
}

.css-bj71cw.categories {
	margin: 0 0 0 18px;
}

@media ( min-width :860px) {
	.css-bj71cw.categories {
		margin: 0 0 0 24px;
	}
}

.css-bj71cw>a {
	-webkit-text-decoration: none;
	text-decoration: none;
}
</style>
<style data-emotion-css="x6oby2-StylelessButton">
.css-x6oby2-StylelessButton {
	background: none;
	padding: 0;
	border: none;
	margin: 0;
	cursor: pointer;
	color: #353535;
	font-size: 15px;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
}

.css-x6oby2-StylelessButton:focus {
	outline: none;
}
</style>
<style data-emotion-css="q65tx9-StylelessButton">
.css-q65tx9-StylelessButton {
	background: none;
	padding: 0;
	border: none;
	margin: 0;
	cursor: pointer;
	color: #7e7e7e;
	font-size: 15px;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
}

.css-q65tx9-StylelessButton:focus {
	outline: none;
}
</style>
<style data-emotion-css="8az14u">
.css-8az14u {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	height: 62px;
	margin: 0 0 0 24px;
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0;
}

.css-8az14u.categories {
	margin: 0 0 0 18px;
}

@media ( min-width :860px) {
	.css-8az14u.categories {
		margin: 0 0 0 24px;
	}
}

@media ( min-width :860px) {
	.css-8az14u {
		margin-right: 20px !important;
	}
}

.css-8az14u>a {
	-webkit-text-decoration: none;
	text-decoration: none;
}
</style>
<style data-emotion-css="1c3wwgb">
.css-1c3wwgb {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	height: 62px;
	margin: 0 0 0 24px;
	-webkit-flex-shrink: 1;
	-ms-flex-negative: 1;
	flex-shrink: 1;
	margin: 0 0 0 auto;
	-webkit-transition: all 0.5s;
	transition: all 0.5s;
}

.css-1c3wwgb.categories {
	margin: 0 0 0 18px;
}

@media ( max-width :859px) {
	.css-1c3wwgb {
		width: 28px;
	}
	.css-1c3wwgb label {
		background-color: transparent;
		padding-left: 30px;
		border: none;
		cursor: pointer;
	}
}

@media ( min-width :860px) {
	.css-1c3wwgb {
		width: 300px;
	}
}

@media ( min-width :860px) {
	.css-1c3wwgb.categories {
		margin: 0 0 0 24px;
	}
}

.css-1c3wwgb>a {
	-webkit-text-decoration: none;
	text-decoration: none;
}
</style>
<!-- <style data-emotion-css="1okeg7p">
.css-1okeg7p {
	margin: 12px 0;
}
</style> -->
<style data-emotion-css="kyr608">
.css-kyr608 {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	background: #f5f5f7
		url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMiIgaGVpZ2h0PSIyMiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICAgIDxwYXRoIGZpbGw9IiNCQUJBQzMiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTkuODE0IDE1LjczNWMtMy4yMDcgMC01LjgxNy0yLjYzLTUuODE3LTUuODYxIDAtMy4yMzMgMi42MS01Ljg2MiA1LjgxNy01Ljg2MiAzLjIwNyAwIDUuODE4IDIuNjMgNS44MTggNS44NjJzLTIuNjEgNS44Ni01LjgxOCA1Ljg2bTkuODQxIDIuNTRsLTMuNjYtMy43MDRjLjk4LTEuMzEgMS41NzEtMi45MzIgMS41NzEtNC42OTYgMC00LjMwOC0zLjQ3OC03LjgxMi03Ljc1Mi03LjgxMi00LjI3NCAwLTcuNzUyIDMuNTA0LTcuNzUyIDcuODEyIDAgNC4zMDcgMy40NzggNy44MSA3Ljc1MiA3LjgxIDEuODI5IDAgMy41MDctLjY0NCA0LjgzNC0xLjcxNGwzLjYzNyAzLjY4Yy4xODIuMTg2LjQyNi4yODguNjg1LjI4OC4yNTcgMCAuNS0uMS42ODMtLjI4NC4xODItLjE4NC4yODQtLjQzLjI4NS0uNjkgMC0uMjYtLjEtLjUwNS0uMjgzLS42OSIvPgo8L3N2Zz4K)
		no-repeat 9px 8px;
	box-sizing: border-box;
	width: 100%;
	height: 38px;
	padding: 7px 10px 8px 36px;
	border-radius: 2px;
}

@media ( min-width :860px) {
	.css-kyr608 {
		background: #f5f5f7
			url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iMTZweCIgaGVpZ2h0PSIxNnB4IiB2aWV3Qm94PSIwIDAgMTYgMTYiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8dGl0bGU+SWNvbiAvIEljVGFiQmFyIC8gSWNTZWFyY2hBbmQ8L3RpdGxlPgogICAgPGcgaWQ9IlVJLS0t7ZmILS8t6rKA7IOJIiBzdHJva2U9Im5vbmUiIHN0cm9rZS13aWR0aD0iMSIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBmaWxsLW9wYWNpdHk9IjAuNzYiPgogICAgICAgIDxnIGlkPSJfR2xvYmFsLS8tTmF2aWdhdGlvbkJhci0vLUl0ZW1zLS8tU2VhcmNoLS8tRW1wdHkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0xMS4wMDAwMDAsIC0xMS4wMDAwMDApIiBmaWxsPSIjN0U3RTdFIj4KICAgICAgICAgICAgPGcgaWQ9Ikdyb3VwLTEzIj4KICAgICAgICAgICAgICAgIDxnIGlkPSJJY29uLS8tSWNUYWJCYXItLy1JY1NlYXJjaEFuZCIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTAuMDAwMDAwLCAxMC4wMDAwMDApIj4KICAgICAgICAgICAgICAgICAgICA8cGF0aCBkPSJNOC4wMjk5ODQxNSwxMi44NzM5OTc5IEM1LjQwNjA4MTEyLDEyLjg3Mzk5NzkgMy4yNzA1NDg1OCwxMC43MjI4NDAzIDMuMjcwNTQ4NTgsOC4wNzg3NTkgQzMuMjcwNTQ4NTgsNS40MzM4ODAwNyA1LjQwNjA4MTEyLDMuMjgyNzIyNTEgOC4wMjk5ODQxNSwzLjI4MjcyMjUxIEMxMC42NTM4ODcyLDMuMjgyNzIyNTEgMTIuNzg5NDE5Nyw1LjQzMzg4MDA3IDEyLjc4OTQxOTcsOC4wNzg3NTkgQzEyLjc4OTQxOTcsMTAuNzIyODQwMyAxMC42NTM4ODcyLDEyLjg3Mzk5NzkgOC4wMjk5ODQxNSwxMi44NzM5OTc5IE0xNi4wODEzNjkzLDE0Ljk1MTc3NTIgTDEzLjA4NjI0MTMsMTEuOTIwODUyNCBDMTMuODg4ODQ3LDEwLjg0OTY2MDUgMTQuMzcyNDY4Myw5LjUyMTYzNzc2IDE0LjM3MjQ2ODMsOC4wNzg3NTkgQzE0LjM3MjQ2ODMsNC41NTQxMTQ4NiAxMS41MjY5Mzg1LDEuNjg3NSA4LjAyOTk4NDE1LDEuNjg3NSBDNC41MzMwMjk4MywxLjY4NzUgMS42ODc1LDQuNTU0MTE0ODYgMS42ODc1LDguMDc4NzU5IEMxLjY4NzUsMTEuNjAyNjA1NSA0LjUzMzAyOTgzLDE0LjQ2OTIyMDQgOC4wMjk5ODQxNSwxNC40NjkyMjA0IEM5LjUyNTk2NTA2LDE0LjQ2OTIyMDQgMTAuODk5MjU5NywxMy45NDE5OTkzIDExLjk4NDQzOTUsMTMuMDY2MjIyMiBMMTQuOTYwNTcwOSwxNi4wNzgwMDIzIEMxNS4xMDkzNzc0LDE2LjIyOTU0ODQgMTUuMzA4ODQxNSwxNi4zMTI1IDE1LjUyMDk3MDEsMTYuMzEyNSBDMTUuNzMxNTE1NSwxNi4zMTI1IDE1LjkyOTM5NjYsMTYuMjMwMzQ2IDE2LjA3OTc4NjIsMTYuMDgwMzk1MSBDMTYuMjI4NTkyOCwxNS45Mjk2NDY2IDE2LjMxMTcwMjgsMTUuNzI5NDQ2MiAxNi4zMTI1LDE1LjUxNjQ4NCBDMTYuMzEzMjg1OSwxNS4zMDM1MjE4IDE2LjIzMDk2NzMsMTUuMTAyNTIzNyAxNi4wODEzNjkzLDE0Ljk1MTc3NTIiIGlkPSJGaWxsLTEiIGZpbGw9IiNCQUJBQzMiPjwvcGF0aD4KICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+)
			no-repeat 10px 10px;
	}
}
</style>
<style data-emotion-css="13i5xe6">
.css-13i5xe6 {
	font-size: 14px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 23px;
	background: transparent;
	width: 100%;
	padding: 0;
	padding-bottom: 1px;
	border: 0;
	overflow: hidden;
	text-overflow: ellipsis;
	caret-color: #353535;
}

.css-13i5xe6::-moz-placeholder {
	color: #74747b;
}

.css-13i5xe6:focus {
	outline: none;
}

.css-13i5xe6::-webkit-input-placeholder {
	color: #74747b;
}

.css-13i5xe6::-moz-placeholder {
	color: #74747b;
}

.css-13i5xe6:-ms-input-placeholder {
	color: #74747b;
}

.css-13i5xe6::placeholder {
	color: #74747b;
}
</style>
<style data-emotion-css="ikj5sk">
.css-ikj5sk {
	display: none;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	width: 22px;
	height: 100%;
}

@media ( min-width :860px) {
	.css-ikj5sk {
		display: none;
	}
}
</style>
<style data-emotion-css="14vwb0g">
.css-14vwb0g {
	display: inline-block;
	background:
		url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiNBMEEwQTAiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEyLjIwOCAxMS40TDkuMzggOC41N2wtLjgwOS44MDkgMi44MjkgMi44MjgtMi44MjkgMi44MjguODA5LjgwOSAyLjgyOC0yLjgyOSAyLjgyOCAyLjgyOS44MDktLjgwOS0yLjgyOS0yLjgyOCAyLjgyOS0yLjgyOC0uODA5LS44MDktMi44MjggMi44Mjl6TTEyIDIwYTggOCAwIDEgMSAwLTE2IDggOCAwIDAgMSAwIDE2eiIvPgo8L3N2Zz4K)
		no-repeat center;
	background-size: cover;
	width: 22px;
	height: 22px;
	cursor: pointer;
}
</style>
<style data-emotion-css="1kqg656">
.css-1kqg656 {
	display: none;
	color: #74747b;
	font-size: 14px;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
}

@media ( min-width :860px) {
	.css-1kqg656 {
		display: inline;
	}
}
</style>
<style data-emotion-css="1r8hvvw">
.css-1r8hvvw {
	display: inline;
}

@media ( min-width :860px) {
	.css-1r8hvvw {
		display: none;
	}
}
</style>
<style data-emotion-css="94q8z7">
.css-94q8z7 {
	vertical-align: top;
	width: 22px;
	height: 22px;
	display: inline;
}

.css-94q8z7 .fillTarget {
	fill: #74747b;
	opacity: 0.66;
	-webkit-transition: fill 300ms;
	transition: fill 300ms;
}

@media ( min-width :860px) {
	.css-94q8z7 {
		display: none;
	}
}
</style>
<style data-emotion-css="ps9ul3">
.css-ps9ul3 {
	width: 28px;
	height: 28px;
	cursor: pointer;
}
</style>
<style data-emotion-css="ipiine">
.css-ipiine {
	display: block;
	border: solid 1px rgba(0, 0, 0, 0.08);
	border-radius: 50%;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	position: relative;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	width: 56px;
	height: 56px;
	overflow: hidden;
	width: 32px;
	height: 32px; -webkit-undefined; -ms-flex-undefined; undefined;
	width: 28px;
	height: 28px;
	cursor: pointer;
}
</style>
<style data-emotion-css="1wkpkpw-ProfilePhotoImage">
.css-1wkpkpw-ProfilePhotoImage {
	position: relative;
	z-index: 1;
	background: url("사진 주소") no-repeat center;
	background-size: cover;
	width: 100%;
	height: 100%;
}
</style>
<style data-emotion-css="1xl5dyt">
.css-1xl5dyt {
	display: block;
	position: fixed;
	top: 0px;
	left: 0;
	z-index: 51;
	background-color: #fff;
	text-align: center;
	width: 100%;
	height: 71px;
	overflow: scroll;
	-webkit-transition: all 700ms;
	transition: all 700ms;
	-webkit-scrollbar-width: none;
	-moz-scrollbar-width: none;
	-ms-scrollbar-width: none;
	scrollbar-width: none;
}

.css-1xl5dyt>ul>li {
	padding-top: 27px;
	padding-bottom: 15px;
}

.css-1xl5dyt::-webkit-scrollbar {
	display: none !important;
}

@media ( min-width :720px) {
	.css-1xl5dyt {
		display: none;
	}
}
</style>
<style data-emotion-css="ysxfln">
.css-ysxfln {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	position: relative;
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	box-sizing: border-box;
	height: 100%;
	margin: 0 15px;
}

.css-ysxfln:not(:last-child)::after {
	content: "";
	display: inline-block;
	position: relative;
	left: 15px;
	background: #d1d1d2;
	vertical-align: top;
	width: 1px;
	height: 13px;
}
</style>
<style data-emotion-css="q3jh7f-StylelessButton">
.css-q3jh7f-StylelessButton {
	background: none;
	padding: 0;
	border: none;
	margin: 0;
	cursor: pointer;
	color: #292a32;
	font-size: 27px;
	font-weight: bold;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
}

.css-q3jh7f-StylelessButton:focus {
	outline: none;
}
</style>
<style data-emotion-css="1ezx7y8-StylelessButton">
.css-1ezx7y8-StylelessButton {
	background: none;
	padding: 0;
	border: none;
	margin: 0;
	cursor: pointer;
	color: #a5a5aa;
	font-size: 27px;
	font-weight: bold;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
}

.css-1ezx7y8-StylelessButton:focus {
	outline: none;
}
</style>
<style data-emotion-css="99klbh">
.css-99klbh {
	padding-top: 0px;
	padding-bottom: 56px;
}

@media ( min-width :719px) {
	.css-99klbh {
		padding-top: 0px;
		padding-bottom: unset;
	}
}
</style>
<style data-emotion-css="k23wfl">
.css-k23wfl {
	position: relative;
}

@media ( min-width :719px) {
	.css-k23wfl {
		display: -webkit-box;
		display: -webkit-flex;
		display: -ms-flexbox;
		display: flex;
		-webkit-flex-direction: column;
		-ms-flex-direction: column;
		flex-direction: column;
		min-height: calc(100vh - 0px);
	}
}
</style>
<style data-emotion-css="7klu3x">
.css-7klu3x {
	min-height: calc(100vh - 136px);
	margin-top: 74px;
}

@media ( max-width :720px) {
	.css-7klu3x {
		margin-top: 75px;
	}
}

@media ( min-width :600px) {
	.css-7klu3x {
		min-height: calc(100vh - 343px);
		margin-top: 74px;
	}
}

@media ( min-width :760px) {
	.css-7klu3x {
		margin-top: 80px;
	}
}

@media ( min-width :1100px) {
	.css-7klu3x {
		margin-top: 86px;
	}
}
</style>
<style data-emotion-css="lufi3b">
.css-lufi3b {
	margin-bottom: 20px;
}

@media ( min-width :719px) {
	.css-lufi3b {
		margin-bottom: 30px;
	}
}

@media ( min-width :1100px) {
	.css-lufi3b {
		margin-bottom: 42px;
	}
}

.css-lufi3b .arrow_button {
	opacity: 1 !important;
}
</style>
<style data-emotion-css="pbseb6-StyledHomeListTitleRow">
.css-pbseb6-StyledHomeListTitleRow {
	white-space: nowrap;
	max-width: 1320px;
	padding: 12px 0 14px;
	margin-right: 15px;
	margin-left: 15px;
	max-height: 60px;
	line-height: 30px;
}

@media ( max-width :720px) {
	.css-pbseb6-StyledHomeListTitleRow {
		line-height: 29px;
		max-height: 58px;
		padding: 4px 20px 9px 0;
	}
}

@media ( min-width :719px) {
	.css-pbseb6-StyledHomeListTitleRow {
		margin-right: 20px;
		margin-left: 20px;
	}
}

@media ( min-width :760px) {
	.css-pbseb6-StyledHomeListTitleRow {
		margin: 0 3.5%;
	}
}

@media ( min-width :1100px) {
	.css-pbseb6-StyledHomeListTitleRow {
		margin: 0 60px;
	}
}

@media ( min-width :1440px) {
	.css-pbseb6-StyledHomeListTitleRow {
		margin-right: auto;
		margin-left: auto;
	}
}
</style>
<style data-emotion-css="16qa0p7">
.css-16qa0p7 {
	color: #292a32;
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: 22px;
	font-weight: 700;
	-webkit-letter-spacing: -0.4px;
	-moz-letter-spacing: -0.4px;
	-ms-letter-spacing: -0.4px;
	letter-spacing: -0.4px;
	line-height: 30px;
}

@media ( max-width :720px) {
	.css-16qa0p7 {
		line-height: 29px;
	}
}

@media ( max-width :720px) {
	.css-16qa0p7 {
		display: -webkit-box;
		white-space: normal;
		overflow: hidden;
		text-overflow: ellipsis;
		max-height: 60px;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
	}
}
</style>
<style data-emotion-css="1qq59e8">
.css-1qq59e8 {
	max-width: 1320px;
}

@media ( min-width :760px) {
	.css-1qq59e8 {
		margin: 0 3.5%;
	}
}

@media ( min-width :1100px) {
	.css-1qq59e8 {
		margin: 0 60px;
	}
}

@media ( min-width :1440px) {
	.css-1qq59e8 {
		margin-right: auto;
		margin-left: auto;
	}
}

.css-1qq59e8 .arrow_button {
	-webkit-align-items: flex-start;
	-webkit-box-align: flex-start;
	-ms-flex-align: flex-start;
	align-items: flex-start;
}

@media ( min-width :760px) {
	.css-1qq59e8 .arrow_button>div {
		margin-top: calc(( 100vw - 60px)* 157/108/2/4- 17px);
	}
}

@media ( min-width :1100px) {
	.css-1qq59e8 .arrow_button>div {
		margin-top: calc(( 100vw - 120px)* 157/108/2/5- 17px);
	}
}

@media ( min-width :1440px) {
	.css-1qq59e8 .arrow_button>div {
		margin-top: calc(1320px * 157/ 108/ 2/ 5 - 17px);
	}
}
</style>
<style data-emotion-css="usdi1z">
.css-usdi1z {
	position: relative;
	-webkit-transform: translate3d(0, 0, 0);
	-ms-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
}

.css-usdi1z:hover .arrow_button {
	opacity: 1;
}
</style>
<style data-emotion-css="9dnzub">
.css-9dnzub {
	overflow-x: hidden;
	overflow-y: hidden;
	-webkit-overflow-scrolling: touch;
	-webkit-scrollbar-width: none;
	-moz-scrollbar-width: none;
	-ms-scrollbar-width: none;
	scrollbar-width: none;
}

.css-9dnzub::-webkit-scrollbar {
	display: none !important;
}
</style>
<style data-emotion-css="174lxc3">
.css-174lxc3 {
	-webkit-transition: 500ms;
	transition: 500ms;
}
</style>
<style data-emotion-css="119xxd7">
.css-119xxd7 {
	margin-right: 20px;
	margin-left: 15px;
}

@media ( min-width :719px) {
	.css-119xxd7 {
		margin-right: 28px;
		margin-left: 20px;
	}
}

@media ( min-width :760px) {
	.css-119xxd7 {
		margin-right: 0;
		margin-left: 0;
	}
}
</style>
<style data-emotion-css="1awbvhv">
.css-1awbvhv {
	margin: 0;
}

.css-1awbvhv>li {
	width: 33.333333333333336%;
	padding: 0 5px;
	margin-bottom: 0;
}

@media ( min-width :600px) {
	.css-1awbvhv>li {
		width: 33.333333333333336%;
	}
}

@media ( min-width :760px) {
	.css-1awbvhv>li {
		width: 25%;
		padding: 0 5px;
	}
}

@media ( min-width :1100px) {
	.css-1awbvhv>li {
		width: 20%;
		padding: 0 8px;
	}
}

.css-1awbvhv::after {
	content: none !important;
}
</style>
<style data-emotion-css="yqjebm-VisualUl">
.css-yqjebm-VisualUl {
	list-style: none;
	padding: 0;
	margin: 0;
	white-space: nowrap;
	margin-right: -4px !important;
	margin-left: -4px !important;
	margin: 14px 0 0;
	margin: 0;
}

.css-yqjebm-VisualUl::after {
	content: "";
	display: inline-block;
	width: 20px;
	height: 100%;
}

.css-yqjebm-VisualUl>li {
	padding: 0 4px !important;
}

.css-yqjebm-VisualUl>li:last-of-type {
	vertical-align: middle;
}

@media ( min-width :520px) {
	.css-yqjebm-VisualUl>li {
		width: 25%;
	}
}

@media ( min-width :680px) {
	.css-yqjebm-VisualUl>li {
		width: 20%;
	}
}

@media ( min-width :840px) {
	.css-yqjebm-VisualUl>li {
		width: 16.666666666666668%;
	}
}

@media ( min-width :960px) {
	.css-yqjebm-VisualUl>li {
		width: 14.285714285714286%;
	}
}

@media ( min-width :1100px) {
	.css-yqjebm-VisualUl>li {
		width: 12.5%;
	}
}

@media ( min-width :1200px) {
	.css-yqjebm-VisualUl>li {
		width: 11.11111111111111%;
	}
}

@media ( min-width :1360px) {
	.css-yqjebm-VisualUl>li {
		width: 10%;
	}
}

@media ( min-width :1600px) {
	.css-yqjebm-VisualUl>li {
		width: 9.090909090909092%;
	}
}

@media ( min-width :1750px) {
	.css-yqjebm-VisualUl>li {
		width: 8.333333333333334%;
	}
}

@media ( min-width :1920px) {
	.css-yqjebm-VisualUl>li {
		width: 7.6923076923076925%;
	}
}

@media ( min-width :2080px) {
	.css-yqjebm-VisualUl>li {
		width: 7.142857142857143%;
	}
}

@media ( min-width :2220px) {
	.css-yqjebm-VisualUl>li {
		width: 6.666666666666667%;
	}
}

@media ( min-width :2380px) {
	.css-yqjebm-VisualUl>li {
		width: 6.25%;
	}
}

.css-yqjebm-VisualUl>li {
	width: 33.333333333333336%;
	padding: 0 5px;
	margin-bottom: 0;
}

@media ( min-width :600px) {
	.css-yqjebm-VisualUl>li {
		width: 33.333333333333336%;
	}
}

@media ( min-width :760px) {
	.css-yqjebm-VisualUl>li {
		width: 25%;
		padding: 0 5px;
	}
}

@media ( min-width :1100px) {
	.css-yqjebm-VisualUl>li {
		width: 20%;
		padding: 0 8px;
	}
}

.css-yqjebm-VisualUl::after {
	content: none !important;
}
</style>
<style data-emotion-css="8y23cj">
.css-8y23cj {
	display: inline-block;
	vertical-align: top;
	box-sizing: border-box;
	width: 33.333333333333336%;
	padding: 0 5px;
	margin: 0 0 24px;
}

.css-8y23cj>a {
	display: inline-block;
	-webkit-text-decoration: none;
	text-decoration: none;
	width: 100%;
}
</style>
<style data-emotion-css="1qmeemv">
.css-1qmeemv {
	position: relative;
	width: 100%;
	height: 0;
	padding-bottom: 145.37037037037038%;
}
</style>
<style data-emotion-css="16q7aeu">
.css-16q7aeu {
	background: #f8f8f8;
	-webkit-transition: 300ms;
	transition: 300ms;
}
</style>
<style data-emotion-css="1rdb949-StyledLazyLoadingImage">
.css-1rdb949-StyledLazyLoadingImage {
	position: relative;
	overflow: hidden;
	position: absolute;
	top: 0;
	left: 0;
	box-sizing: border-box;
	width: 100%;
	height: 100%;
	border: 1px solid #eae9e8;
	border-radius: 5px;
	background: #f8f8f8;
	-webkit-transition: 300ms;
	transition: 300ms;
}
</style>
<style data-emotion-css="pvl49n-StyledImg">
.css-pvl49n-StyledImg {
	vertical-align: top;
	width: 100%;
	height: 100%;
	min-height: 1px;
	opacity: 0;
	object-fit: cover;
	-webkit-transition: opacity 420ms;
	transition: opacity 420ms;
}
</style>
<style data-emotion-css="csn5n">
.css-csn5n {
	position: absolute;
	bottom: 3px;
	left: 3px;
	background-color: rgba(0, 0, 0, 0.77);
	color: #fff;
	font-size: 16px;
	font-weight: 700;
	-webkit-letter-spacing: normal;
	-moz-letter-spacing: normal;
	-ms-letter-spacing: normal;
	letter-spacing: normal;
	line-height: normal;
	font-size: 14px;
	line-height: 22px;
	text-align: center;
	width: 24px;
	height: 24px;
	border-radius: 4px;
	opacity: 0;
	-webkit-transition: opacity 300ms;
	transition: opacity 300ms;
}

@media ( min-width :460px) {
	.css-csn5n {
		font-size: 16px;
	}
}

@media ( min-width :460px) {
	.css-csn5n {
		bottom: 6px;
		left: 6px;
	}
}

@media ( min-width :719px) {
	.css-csn5n {
		top: 6px;
		left: 6px;
		width: 28px;
		height: 28px;
		line-height: 27px;
	}
}
</style>
<style data-emotion-css="ixy093">
.css-ixy093 {
	text-align: left;
	width: calc(100% - 10px);
	margin: 5px 10px 0 0;
}

@media ( max-width :720px) {
	.css-ixy093 {
		height: 55px;
		margin: 6px 5px 0 0;
	}
}
</style>
<style data-emotion-css="5yuqaa">
.css-5yuqaa {
	color: #292a32;
	font-size: 15px;
	font-weight: 400;
	-webkit-letter-spacing: -0.5px;
	-moz-letter-spacing: -0.5px;
	-ms-letter-spacing: -0.5px;
	letter-spacing: -0.5px;
	line-height: 20px;
	font-size: 16px;
	font-weight: 500;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin-bottom: 3px;
}

@media ( max-width :720px) {
	.css-5yuqaa {
		display: -webkit-box;
		font-size: 15px;
		font-weight: 400;
		-webkit-letter-spacing: -0.2px;
		-moz-letter-spacing: -0.2px;
		-ms-letter-spacing: -0.2px;
		letter-spacing: -0.2px;
		line-height: 18px;
		white-space: normal;
		max-height: 36px;
		margin-bottom: 4px;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
	}
}
</style>
<style data-emotion-css="1rxwuxd">
.css-1rxwuxd {
	display: none;
	color: #292a32;
	padding-bottom: 1px;
	font-size: 14px;
	font-weight: 400;
	-webkit-letter-spacing: normal;
	-moz-letter-spacing: normal;
	-ms-letter-spacing: normal;
	letter-spacing: normal;
	line-height: 21px;
}

@media ( min-width :719px) {
	.css-1rxwuxd {
		display: block;
	}
}
</style>
<style data-emotion-css="xgmur2">
.css-xgmur2 {
	color: #787878;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.2px;
	-moz-letter-spacing: -0.2px;
	-ms-letter-spacing: -0.2px;
	letter-spacing: -0.2px;
	line-height: 18px;
	white-space: nowrap;
	height: 18px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	font-size: 14px;
	-webkit-letter-spacing: 0;
	-moz-letter-spacing: 0;
	-ms-letter-spacing: 0;
	letter-spacing: 0;
	line-height: 14px;
	height: 15px;
}

@media ( min-width :719px) {
	.css-xgmur2 {
		margin-top: 2px;
	}
}

.css-xgmur2>span {
	height: 15px;
}

.css-xgmur2.rated {
	color: #f88b08;
}

.css-xgmur2.predicted {
	color: #ff0558;
}

.css-xgmur2.average {
	color: #555765;
}

.css-xgmur2>svg {
	margin-top: 2px;
}
</style>
<style data-emotion-css="1g90l0x">
.css-1g90l0x {
	vertical-align: middle;
	width: 12px;
	height: 10px;
	margin-right: 1px;
	margin-left: 1px;
	fill: #555765;
}
</style>
<style data-emotion-css="u4moi6">
.css-u4moi6 {
	display: none;
	color: #74747b;
	white-space: normal;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 18px;
	margin-top: 5px;
}

@media ( min-width :719px) {
	.css-u4moi6 {
		display: block;
	}
}
</style>
<style data-emotion-css="q6vg6q">
.css-q6vg6q {
	vertical-align: middle;
	width: 12px;
	height: 10px;
	margin-right: 1px;
	margin-left: 1px;
	fill: #ff0558;
}
</style>
<style data-emotion-css="ml096x">
.css-ml096x {
	display: inline-block;
	margin: 0;
}
</style>
<style data-emotion-css="a89h8a">
.css-a89h8a {
	display: none;
	position: absolute;
	top: 0;
	z-index: 1;
	left: 0;
	width: 0;
	height: 100%;
}
</style>
<style data-emotion-css="1qgb5vh">
.css-1qgb5vh {
	display: none;
	position: absolute;
	top: 0;
	z-index: 1;
	right: 0;
	width: 0;
	height: 100%;
}
</style>
<style data-emotion-css="ldjtut">
.css-ldjtut {
	position: relative;
	float: right;
	background: #fff no-repeat
		url(https://an2-img.amz.wtchn.net/image/v2/33c15d90f101414a351372f19172859f.png?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKd1lYUm9Jam9pTDNZeUwzTjBiM0psTDNWcGJXRm5aUzh4TmpFeE1qQXdNVGN3T1RZd05qWTVNRE0xSW4wLlFwWFc3MERPaF9GR3ZMWVVzSUFCOFdLNWhLRjE3Ym5za1Z1bVFEN0lsSkU)
		center/17px;
	box-sizing: border-box;
	width: 24px;
	height: 24px;
	padding: 4px 3px 3px 4px;
	border: 1px solid rgba(0, 0, 0, 0.07);
	border-radius: 50%;
	opacity: 0;
	opacity: 0;
	-webkit-transition: opacity 300ms;
	transition: opacity 300ms;
}

.css-ldjtut.ottBadge {
	margin: 4px 4px 0 0;
}

.css-ldjtut.ottBadge ~ .ottBadge {
	margin: 4px 3px 0 0;
}

@media ( min-width :719px) {
	.css-ldjtut {
		background-size: 20px;
		width: 30px;
		height: 30px;
		padding: 4px;
	}
	.css-ldjtut.ottBadge {
		margin: 6px 6px 0 0;
	}
	.css-ldjtut.ottBadge ~ .ottBadge {
		margin: 6px 4px 0 0;
	}
}
</style>
<style data-emotion-css="1f1guhr">
.css-1f1guhr {
	vertical-align: middle;
	width: 12px;
	height: 10px;
	margin-right: 1px;
	margin-left: 1px;
	fill: #f88b08;
}
</style>
<style data-emotion-css="4l99gx">
.css-4l99gx {
	position: relative;
	float: right;
	background: #fff no-repeat
		url(https://an2-img.amz.wtchn.net/image/v1/updatable_images/2571/original/42e70f1bc34d7af54478a311983ecf6d3601eefa.png)
		center/17px;
	box-sizing: border-box;
	width: 24px;
	height: 24px;
	padding: 4px 3px 3px 4px;
	border: 1px solid rgba(0, 0, 0, 0.07);
	border-radius: 50%;
	opacity: 0;
	opacity: 0;
	-webkit-transition: opacity 300ms;
	transition: opacity 300ms;
}

.css-4l99gx.ottBadge {
	margin: 4px 4px 0 0;
}

.css-4l99gx.ottBadge ~ .ottBadge {
	margin: 4px 3px 0 0;
}

@media ( min-width :719px) {
	.css-4l99gx {
		background-size: 20px;
		width: 30px;
		height: 30px;
		padding: 4px;
	}
	.css-4l99gx.ottBadge {
		margin: 6px 6px 0 0;
	}
	.css-4l99gx.ottBadge ~ .ottBadge {
		margin: 6px 4px 0 0;
	}
}
</style>
<style data-emotion-css="11hq7l1">
.css-11hq7l1 {
	background: #fff;
	padding: 10px 0;
	margin: 0;
}
</style>
<style data-emotion-css="9kkems-StyledInfinityScroll">
.css-9kkems-StyledInfinityScroll {
	display: block;
	text-align: center;
	height: 1px;
	margin: 0 auto;
	min-height: 1px;
	background: #fff;
	padding: 10px 0;
	margin: 0;
}
</style>
<style data-emotion-css="wfb65d-Self">
.css-wfb65d-Self {
	display: none;
}

@media ( min-width :719px) {
	.css-wfb65d-Self {
		display: block;
		box-sizing: border-box;
		width: 100%;
	}
}
</style>
<style data-emotion-css="1iuqns0-StyledFooterTopSection">
.css-1iuqns0-StyledFooterTopSection {
	background-color: #101113;
	line-height: 62px;
	text-align: center;
	width: 100%;
	height: 62px;
}
</style>
<style data-emotion-css="z9tuc7-StyledRatingSummary">
.css-z9tuc7-StyledRatingSummary {
	color: #d1d1d2;
	font-size: 19px;
	font-weight: 500;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
}

.css-z9tuc7-StyledRatingSummary>em {
	color: #ff0558;
}
</style>
<style data-emotion-css="1k1hgyy-FooterSection">
.css-1k1hgyy-FooterSection {
	background-color: #1c1d1f;
	padding: 20px 0 38px;
}

.css-1k1hgyy-FooterSection>div {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
}
</style>
<style data-emotion-css="7sb2y7-FooterLeft">
.css-7sb2y7-FooterLeft {
	-webkit-flex: 1;
	-ms-flex: 1;
	flex: 1;
}
</style>
<style data-emotion-css="r41819-VisualUl-StyledTermsAndPolicy">
.css-r41819-VisualUl-StyledTermsAndPolicy {
	list-style: none;
	padding: 0;
	margin: 0;
	color: #a5a5a7;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
}
</style>
<style
	data-emotion-css="1i0sjqh-StyledTermsAndPolicyList-StyledTermsAndPolicyList">
.css-1i0sjqh-StyledTermsAndPolicyList-StyledTermsAndPolicyList {
	display: inline-block;
	color: #a5a5a7;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
	vertical-align: top;
	cursor: pointer;
}

.css-1i0sjqh-StyledTermsAndPolicyList-StyledTermsAndPolicyList::after {
	content: "";
	display: inline-block;
	background: #848485;
	vertical-align: top;
	width: 1px;
	height: 12px;
	margin: 5px 8px 0;
}
</style>
<style
	data-emotion-css="5qs3nd-StyledTermsAndPolicyList-StyledTermsAndPolicyList">
.css-5qs3nd-StyledTermsAndPolicyList-StyledTermsAndPolicyList {
	display: inline-block;
	color: #a5a5a7;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
	vertical-align: top;
	font-size: 13px;
	font-weight: 500;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
	cursor: pointer;
}

.css-5qs3nd-StyledTermsAndPolicyList-StyledTermsAndPolicyList::after {
	content: "";
	display: inline-block;
	background: #848485;
	vertical-align: top;
	width: 1px;
	height: 12px;
	margin: 5px 8px 0;
}
</style>
<style
	data-emotion-css="8093ho-StylelessHref-StyledMailLink-StyledTextLink">
.css-8093ho-StylelessHref-StyledMailLink-StyledTextLink {
	color: #000;
	-webkit-text-decoration: none;
	text-decoration: none;
	color: #a5a5a7;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
	-webkit-text-decoration: none;
	text-decoration: none;
}
</style>
<style data-emotion-css="lixodn-VisualUl-StyledTermsAndPolicy-StyledCS">
.css-lixodn-VisualUl-StyledTermsAndPolicy-StyledCS {
	list-style: none;
	padding: 0;
	margin: 0;
	color: #a5a5a7;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
	margin-top: 12px;
}
</style>
<style
	data-emotion-css="18lsujb-StyledTermsAndPolicyList-StyledTermsAndPolicyList-StyledCSList">
.css-18lsujb-StyledTermsAndPolicyList-StyledTermsAndPolicyList-StyledCSList
	{
	display: inline-block;
	color: #a5a5a7;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
	vertical-align: top;
	cursor: pointer;
	cursor: auto;
}

.css-18lsujb-StyledTermsAndPolicyList-StyledTermsAndPolicyList-StyledCSList::after
	{
	content: "";
	display: inline-block;
	background: #848485;
	vertical-align: top;
	width: 1px;
	height: 12px;
	margin: 5px 8px 0;
}
</style>
<style data-emotion-css="1bz3wqq-StyledTermsAndPolicyList-StyledCSList">
.css-1bz3wqq-StyledTermsAndPolicyList-StyledCSList {
	display: inline-block;
	color: #a5a5a7;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
	vertical-align: top;
	cursor: pointer;
	cursor: auto;
}
</style>
<style data-emotion-css="gb6obi-StylelessHref-StyledMailLink">
.css-gb6obi-StylelessHref-StyledMailLink {
	color: #000;
	-webkit-text-decoration: none;
	text-decoration: none;
	color: #a5a5a7;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
	-webkit-text-decoration: none;
	text-decoration: none;
}
</style>
<style
	data-emotion-css="8niyb4-VisualUl-StyledTermsAndPolicy-StyledCoWork">
.css-8niyb4-VisualUl-StyledTermsAndPolicy-StyledCoWork {
	list-style: none;
	padding: 0;
	margin: 0;
	color: #a5a5a7;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
}
</style>
<style
	data-emotion-css="1kk9xna-StyledTermsAndPolicyList-StyledTermsAndPolicyList-StyledCoWorkList">
.css-1kk9xna-StyledTermsAndPolicyList-StyledTermsAndPolicyList-StyledCoWorkList
	{
	display: inline-block;
	color: #a5a5a7;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
	vertical-align: top;
	cursor: pointer;
	cursor: auto;
}

.css-1kk9xna-StyledTermsAndPolicyList-StyledTermsAndPolicyList-StyledCoWorkList::after
	{
	content: "";
	display: inline-block;
	background: #848485;
	vertical-align: top;
	width: 1px;
	height: 12px;
	margin: 5px 8px 0;
}
</style>
<style
	data-emotion-css="dbeq2k-StyledTermsAndPolicyList-StyledCoWorkList">
.css-dbeq2k-StyledTermsAndPolicyList-StyledCoWorkList {
	display: inline-block;
	color: #a5a5a7;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
	vertical-align: top;
	cursor: pointer;
	cursor: auto;
}
</style>
<style
	data-emotion-css="1hpdmor-VisualUl-StyledTermsAndPolicy-StyledCompanyInfo-StyledCompanyInfo">
.css-1hpdmor-VisualUl-StyledTermsAndPolicy-StyledCompanyInfo-StyledCompanyInfo
	{
	list-style: none;
	padding: 0;
	margin: 0;
	color: #a5a5a7;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
	color: #848485;
	margin-top: 13px;
}
</style>
<style
	data-emotion-css="1viwtk8-StyledTermsAndPolicyList-StyledTermsAndPolicyList-StyledCompanyInfoList">
.css-1viwtk8-StyledTermsAndPolicyList-StyledTermsAndPolicyList-StyledCompanyInfoList
	{
	display: inline-block;
	color: #a5a5a7;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
	vertical-align: top;
	cursor: pointer;
	color: inherit;
	cursor: text;
}

.css-1viwtk8-StyledTermsAndPolicyList-StyledTermsAndPolicyList-StyledCompanyInfoList::after
	{
	content: "";
	display: inline-block;
	background: #848485;
	vertical-align: top;
	width: 1px;
	height: 12px;
	margin: 5px 8px 0;
}

.css-1viwtk8-StyledTermsAndPolicyList-StyledTermsAndPolicyList-StyledCompanyInfoList>span>a
	{
	color: inherit !important;
	-webkit-text-decoration: none;
	text-decoration: none;
}
</style>
<style
	data-emotion-css="m13hby-StyledTermsAndPolicyList-StyledCompanyInfoList">
.css-m13hby-StyledTermsAndPolicyList-StyledCompanyInfoList {
	display: inline-block;
	color: #a5a5a7;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
	vertical-align: top;
	cursor: pointer;
	color: inherit;
	cursor: text;
}

.css-m13hby-StyledTermsAndPolicyList-StyledCompanyInfoList>span>a {
	color: inherit !important;
	-webkit-text-decoration: none;
	text-decoration: none;
}
</style>
<style
	data-emotion-css="151owug-VisualUl-StyledTermsAndPolicy-StyledCompanyInfo">
.css-151owug-VisualUl-StyledTermsAndPolicy-StyledCompanyInfo {
	list-style: none;
	padding: 0;
	margin: 0;
	color: #a5a5a7;
	font-size: 13px;
	font-weight: 400;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 22px;
	color: #848485;
}
</style>
<style data-emotion-css="86imik">
.css-86imik {
	width: 73px;
	height: 14.02px;
}

.css-86imik .fillTarget {
	fill: #848485;
}
</style>
<style data-emotion-css="1ftyzsu-LanguageContainer">
.css-1ftyzsu-LanguageContainer {
	text-align: right;
}
</style>
<style data-emotion-css="1patnhf-StylelessButton">
.css-1patnhf-StylelessButton {
	background: none;
	padding: 0;
	border: none;
	margin: 0;
	cursor: pointer;
	position: relative;
	color: #a5a5a7;
	font-size: 15px;
	font-weight: 500;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	line-height: 23px;
	text-align: left;
	box-sizing: border-box;
	width: 117px;
	height: 30px;
	padding: 2.5px 10px 4.5px;
	border: solid 1px #848485;
	border-radius: 2px;
}

.css-1patnhf-StylelessButton:focus {
	outline: none;
}

.css-1patnhf-StylelessButton::after {
	content: "";
	display: inline-block;
	position: absolute;
	top: 7px;
	right: 5px;
	background:
		url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI2E1YTVhNyIgZmlsbC1vcGFjaXR5PSIuODgiIGQ9Ik0xLjY2IDMuNjY3TDEwLjM0IDMuNjY3IDYgOC4wMDR6IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyIDIpIi8+CiAgICA8L2c+Cjwvc3ZnPgo=)
		center no-repeat;
	width: 16px;
	height: 16px;
}

.css-1patnhf-StylelessButton:hover {
	border-color: #a5a5a7;
}
</style>
<style data-emotion-css="16pbkjy-VisualUl-FooterLinks-FooterLinks">
.css-16pbkjy-VisualUl-FooterLinks-FooterLinks {
	list-style: none;
	padding: 0;
	margin: 0;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: end;
	-webkit-justify-content: flex-end;
	-ms-flex-pack: end;
	justify-content: flex-end;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	margin: 99px 0 -4px;
}
</style>
<style data-emotion-css="6clrd1-FooterLinkList">
.css-6clrd1-FooterLinkList {
	display: inline-block;
	padding-left: 14px;
}
</style>
<style data-emotion-css="1d271tm-FooterLink">
.css-1d271tm-FooterLink {
	display: -webkit-inline-box;
	display: -webkit-inline-flex;
	display: -ms-inline-flexbox;
	display: inline-flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	vertical-align: top;
	box-sizing: border-box;
	width: 24px;
	height: 24px;
}

.css-1d271tm-FooterLink>svg path {
	fill: #848485;
}

.css-1d271tm-FooterLink:hover>svg path {
	fill: #a5a5a7;
}
</style>
<style data-emotion-css="1hbqdut-FooterLink-FooterLink">
.css-1hbqdut-FooterLink-FooterLink {
	display: -webkit-inline-box;
	display: -webkit-inline-flex;
	display: -ms-inline-flexbox;
	display: inline-flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	vertical-align: top;
	box-sizing: border-box;
	width: 24px;
	height: 24px;
	width: 26px;
	height: 26px;
	padding: 5px;
	border: 1px solid #848485;
	border-radius: 50%;
}

.css-1hbqdut-FooterLink-FooterLink:hover {
	border-color: #a5a5a7;
}

.css-1hbqdut-FooterLink-FooterLink>svg path {
	fill: #848485;
}

.css-1hbqdut-FooterLink-FooterLink:hover>svg path {
	fill: #a5a5a7;
}
</style>
<style data-emotion-css="1jjny0x">
.css-1jjny0x {
	position: fixed;
	bottom: 0;
	z-index: 51;
	background: #fff;
	box-sizing: border-box;
	width: 100%;
	border-top: 1px solid #d2d2d2;
}

.css-1jjny0x::after {
	content: "";
	display: block;
	background: #fff;
	height: env(safe-area-inset-bottom);
}

@media ( min-width :720px) {
	.css-1jjny0x {
		display: none;
	}
}
</style>
<style data-emotion-css="1ho7bw2">
.css-1ho7bw2 {
	box-sizing: border-box;
	height: 56px;
	padding: 8px 0 4px;
}
</style>
<style data-emotion-css="vsvx7g-VisualUl">
.css-vsvx7g-VisualUl {
	list-style: none;
	padding: 0;
	margin: 0;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	height: 100%;
	overflow: hidden;
}
</style>
<style data-emotion-css="1hz4g3g">
.css-1hz4g3g {
	-webkit-flex: 1;
	-ms-flex: 1;
	flex: 1;
	text-align: center;
	height: 100%;
}

.css-1hz4g3g>a {
	display: block;
	color: inherit;
	font-size: 11.5px;
	-webkit-letter-spacing: -0.2px;
	-moz-letter-spacing: -0.2px;
	-ms-letter-spacing: -0.2px;
	letter-spacing: -0.2px;
	-webkit-text-decoration: none;
	text-decoration: none;
	line-height: normal;
	height: 100%;
	margin: 0 10px;
}

.css-1hz4g3g>a>svg {
	display: block;
	margin: 0 auto;
}
</style>
<style data-emotion-css="1u7hvrn">
.css-1u7hvrn {
	width: 24px;
	height: 24px;
}

.css-1u7hvrn .fillTarget {
	fill: #292a32;
}
</style>
<style data-emotion-css="vuw3o9">
.css-vuw3o9 {
	color: #292a32;
	line-height: 17px;
	white-space: nowrap;
	padding-top: 3px;
}
</style>
<style data-emotion-css="wax28p">
.css-wax28p {
	vertical-align: top;
	width: 24px;
	height: 24px;
}

.css-wax28p .fillTarget {
	fill: #babac3;
	-webkit-transition: fill 300ms;
	transition: fill 300ms;
}
</style>
<style data-emotion-css="1yjwko3">
.css-1yjwko3 {
	color: #babac3;
	line-height: 17px;
	white-space: nowrap;
	padding-top: 3px;
}
</style>
<style data-emotion-css="18sz3ra">
.css-18sz3ra {
	vertical-align: top;
	width: 24px;
	height: 24px;
}

.css-18sz3ra .fillTarget {
	fill: #74747b;
	opacity: 0.66;
	-webkit-transition: fill 300ms;
	transition: fill 300ms;
}

.css-18sz3ra .fillTarget {
	fill: #babac3;
	-webkit-transition: fill 300ms;
	transition: fill 300ms;
}
</style>
<style data-emotion-css="1yilc26">
.css-1yilc26 {
	width: 24px;
	height: 24px;
}

.css-1yilc26 .fillTarget {
	fill: #babac3;
}
</style>
<style data-emotion-css="pjxj5o">
.css-pjxj5o {
	display: none;
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 100;
	background: rgba(0, 0, 0, 0.56);
	overflow-x: hidden;
	overflow-y: scroll;
	-webkit-overflow-scrolling: touch;
}
</style>
<style data-emotion-css="vi9yju">
.css-vi9yju {
	position: fixed;
	top: 20px;
	right: 0;
	left: 0;
	z-index: 103;
}
</style>
<style data-emotion-css="any20b">
.css-any20b {
	position: fixed;
	right: 0;
	bottom: 20px;
	left: 0;
	z-index: 103;
	padding-bottom: env(safe-area-inset-bottom);
}
</style>
<style data-emotion="css"></style>
<style type="text/css">
#_copy {
	align-items: center;
	background: #4494D5;
	border-radius: 3px;
	color: #fff;
	cursor: pointer;
	display: flex;
	font-size: 13px;
	height: 30px;
	justify-content: center;
	position: absolute;
	width: 60px;
	z-index: 1000
}

#select-tooltip, #sfModal, .modal-backdrop, div[id^=reader-helper] {
	display: none !important
}

.modal-open {
	overflow: auto !important
}

._sf_adjust_body {
	padding-right: 0 !important
}
</style>
<style data-emotion-css="bj71cw">
.css-bj71cw {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	height: 62px;
	margin: 0 0 0 24px;
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0;
}

.css-bj71cw.categories {
	margin: 0 0 0 18px;
}

@media ( min-width :860px) {
	.css-bj71cw.categories {
		margin: 0 0 0 24px;
	}
}

.css-bj71cw>a {
	-webkit-text-decoration: none;
	text-decoration: none;
}
</style>
<style data-emotion-css="fn0ezc-StylelessButton">
.css-fn0ezc-StylelessButton {
	background: none;
	padding: 0;
	border: none;
	margin: 0;
	cursor: pointer;
	background: transparent;
	color: #74747b;
	font-size: 14px;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	padding: 0;
	border: 0;
	margin: 15px 0;
}

.css-fn0ezc-StylelessButton:focus {
	outline: none;
}
</style>
<style data-emotion-css="bj71cw">
.css-bj71cw {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	height: 62px;
	margin: 0 0 0 24px;
	-webkit-flex-shrink: 0;
	-ms-flex-negative: 0;
	flex-shrink: 0;
}

.css-bj71cw.categories {
	margin: 0 0 0 18px;
}

@media ( min-width :860px) {
	.css-bj71cw.categories {
		margin: 0 0 0 24px;
	}
}

.css-bj71cw>a {
	-webkit-text-decoration: none;
	text-decoration: none;
}
</style>
<style data-emotion-css="139vxi-StylelessButton">
.css-139vxi-StylelessButton {
	background: none;
	padding: 0;
	border: none;
	margin: 0;
	cursor: pointer;
	background: #ff2f6e;
	color: #fff;
	text-align: center;
	font-size: 17px;
	font-weight: 400;
	-webkit-letter-spacing: -0.7px;
	-moz-letter-spacing: -0.7px;
	-ms-letter-spacing: -0.7px;
	letter-spacing: -0.7px;
	line-height: 22px;
	width: 100%;
	height: 44px;
	border-radius: 6px;
	font-size: 15px;
	font-weight: 500;
	-webkit-letter-spacing: -0.5px;
	-moz-letter-spacing: -0.5px;
	-ms-letter-spacing: -0.5px;
	letter-spacing: -0.5px;
	line-height: 20px;
	box-sizing: border-box;
	width: auto;
	min-width: 72px;
	height: 32px;
	padding: 5px 12px;
	background: transparent;
	color: #353535;
	font-size: 14px;
	-webkit-letter-spacing: -0.3px;
	-moz-letter-spacing: -0.3px;
	-ms-letter-spacing: -0.3px;
	letter-spacing: -0.3px;
	padding: 5px 14px 6px 14px;
	border: 1px solid rgba(116, 116, 123, 0.5);
	margin: 15px 0;
}

.css-139vxi-StylelessButton:focus {
	outline: none;
}

.css-139vxi-StylelessButton:disabled {
	background: #f6f6f6;
	color: #d4d4d4;
}
</style>
</head>
<!-- 상단 시작 -->
<header class="css-6k8tqb">
	<nav>
		<div class="css-1gkas1x-Grid e1689zdh0">
			<div class="css-1djzg97">
				<ul class="css-6v7b8v-VisualUl">
					<li class="css-t686xv"><a
						href="${pageContext.request.contextPath}/main/main.do"><img
							src="${pageContext.request.contextPath}/resources/images/logo.png"
							width="150px"></a></li>
					<li class="categories css-bj71cw"><button
							onclick="location.href='${pageContext.request.contextPath}/main/main.do'"
							class="css-x6oby2-StylelessButton">영화</button></li>
					<li class="categories css-bj71cw"><button
							onclick="location.href='${pageContext.request.contextPath}/main/main.do'"
							class="css-q65tx9-StylelessButton">TV</button></li>
					<li class="categories css-bj71cw"><button
							onclick="location.href='${pageContext.request.contextPath}/main/main.do'"
							class="css-q65tx9-StylelessButton">채팅방</button></li>
					<li class="css-1c3wwgb"><div class="css-1xm32e0">
							<div class="css-1okeg7p">
								<form action="#">
									<label class="css-kyr608"><input type="text"
										autocomplete="off" placeholder="콘텐츠를 검색해보세요."
										name="searchKeyword" value="" class="css-13i5xe6">
										<div value="false" class="css-ikj5sk">
											<span aria-label="clear" role="button" class="css-14vwb0g"></span>
										</div></label>
								</form>
							</div>
						</div></li>
					<c:if test="${mem_num == null }">
						<li class="css-bj71cw"><button
								onclick="location.href='${pageContext.request.contextPath}/main/main.do'"
								class="css-fn0ezc-StylelessButton">로그인</button></li>
						<li class="css-bj71cw"><button
								onclick="location.href='${pageContext.request.contextPath}/main/main.do'"
								class="css-139vxi-StylelessButton">회원가입</button></li>
					</c:if>
					<c:if test="${mem_num != null }">
						<li class="css-bj71cw"><a href="/ko-KR/review"><span
								class="css-1kqg656">여기 뭐였죠</span></a></li>
						<li class="css-bj71cw"><a title="회원 page" href=""><div
									class="css-ipiine">
									<div class="css-1wkpkpw-ProfilePhotoImage"></div>
								</div></a></li>
					</c:if>


				</ul>
			</div>
		</div>
	</nav>
</header>
<header class="css-1xl5dyt">
	<ul class="css-6v7b8v-VisualUl">
		<li class="css-ysxfln"><button
				onclick="location.href='${pageContext.request.contextPath}/main/main.do'"
				class="css-q3jh7f-StylelessButton">영화</button></li>
		<li class="css-ysxfln"><button
				onclick="location.href='${pageContext.request.contextPath}/main/main.do'"
				class="css-1ezx7y8-StylelessButton">TV</button></li>
		<li class="css-ysxfln"><button
				onclick="location.href='${pageContext.request.contextPath}/main/main.do'"
				class="css-1ezx7y8-StylelessButton">채팅방</button></li>
	</ul>
</header>
<!-- 상단 끝 -->