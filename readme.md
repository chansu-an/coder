﻿
 
<img src="https://img.shields.io/badge/java-#007396?style=flat-square&logo=java&logoColor=red"/>



![코더]( https://user-images.githubusercontent.com/83687868/157148403-f140fb5b-e8e9-4d55-9452-2ce54a0c2ae1.png )
#  Coders

## 개발자들을 위한 커뮤니티

- 자유로운 의사소통과 정보 공유
- 개발자로 프로젝트를 경험해 보고 싶어하는 신입, 경력 있는 개발자들이 이력서를 업로드 하면, 다양한 프로젝트에 참여할 수 있다. 
- 또한, 프로젝트 현황과 작업을 저장 할 수 있는 저장소도 제공하고 있다.





## 수행 목적
> 학습 내용에 대한 복습 및 구현 실습 포트폴리오 제작 
> 협업중심 프로젝트에 대한 선행 체험 Spring Framework 활용 연습



### 개발 환경

 - 프레임 워크 : Spring 4.0.4 Mybatis  
 - 개발 언어 : java 11, javaScript, JSP  
 - DB : Oracle 11g  
 - WAS : Tomcat 9.0


### 기능

 - 로그인
   - 아이디 비밀번호 일치 여부
   - 아이디 존재여부
   - 탈퇴회원
   - 정지회원 체크
   - 네이버 로그인시 이름,이메일 주소, 별명, 프로필 사진 가져옴
 - 회원가입
   - 네이버 로그인
   - 이메일, 비밀번호, 이름
   - 이메일 중복체크확인 기능
 - 비밀번호 찻기
   - 입력한 이메일로 임시 비밀번호 6자리 생성하여 메일 발송 
 - 게시글 
   - 메인 화면은 최근 공지사항, QnA, 자유게시글이 인기순으로 나온다
   - 비회원 : 게시글 열람, 게시글 검색,정렬(댓글순,최신순,추천순,조회순)
   - 회원 : 게시글 열람,검색,정렬(댓글순,최신순,추천순,조회순),작성
   - 수정,삭제는 작성자만 가능
   - 공지사항은 관리자만 작성가능, 일반회원은 열람만가능
   - 건의사항은 작성자와 관리자만 열람가능
 - 게시글 상세
   - 게시글 신고(20회이상시 게시글리스트에 안보여짐), 추천, 스크랩(마이페이지 -> 활동보기에서 스크랩 게시글 확인가능) / 수정(작성자만 가능) -> 수정에 삭제있음
   - 게시글 댓글,대댓글 작성, 댓글추천 -> 추천높은댓글은 인기댓글이됨, 댓글삭제(작성자만 가능)

 -알림
   - 작성한 게시글에 댓글이 달릴시 알림기능 추가

 -관리자
   - 신고관리
   - 신고글 리스트 -> 게시글 상세에서 누적신고가 일정이상 쌓일시 표시
   - 삭제글 리스트
   - 신고글 관리 -> 신고횟수 초기화
   - 삭제글 관리 -> 삭제취소
   - 신고글,삭제글 열람

 -회원관리
   - 가입한 유저 리스트
   - 탈퇴 유저 복구기능
   - 정지 유저 복구기능 -> 다른유저정보에서 신고하기가 20회 쌓일시 정지시킴

## 서비스 기능
![요구사항 정의서 - 게시판](https://user-images.githubusercontent.com/83687868/157583397-9ce88786-0832-486d-9467-24b78cf83ea1.PNG)
![요구](https://user-images.githubusercontent.com/83687868/157583419-e72d1396-755d-4474-b36f-3b5b7faf6e4c.PNG)


## Overview
### 1. 유저 로그인 페이지 (User Login Page) (소셜 로그인)
![로그인](https://user-images.githubusercontent.com/83687868/157585104-a985f5b4-e6d0-4876-a820-280c43799e6d.PNG)
- Naver API를 이용한 소셜 로그인 가능
### 2.  알림 기능

![알림](https://user-images.githubusercontent.com/83687868/157589816-01e8d915-4315-4382-9498-7b7d06865266.PNG)

### 3. 캘린더 일정 관리
![캘린더](https://user-images.githubusercontent.com/83687868/157590015-5b3e437e-8f4d-46b4-b146-7cc6b36689e8.PNG)
### 4. 스트랩 및 팔로우 기능
![스트랩 및 팔로우](https://user-images.githubusercontent.com/83687868/157590330-4f4ef463-0698-4da6-958d-83edb2535043.PNG)

### 5. 내 활동 및 참가 프로젝트
![작성활동](https://user-images.githubusercontent.com/83687868/157590380-0134f7ac-2584-441c-95ea-1d975c6f892a.PNG)
![참가 프로젝트](https://user-images.githubusercontent.com/83687868/157590433-2d42d4c6-6f09-43ac-b030-8a40937f48e2.PNG)

## ERD

![erd](https://user-images.githubusercontent.com/83687868/157590560-3d99c724-1d59-4ccf-9b3b-6776b1c69653.png)


## Author
- 각자 영문 이름 
- An Chan Su
--------------------------------
### 수정 및 추가 기능

- 캘린더 일정 관리 기능 추가
- 등등 고도화 작업 내용들
