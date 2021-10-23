# Gamma
---
## 목차
1. [**개발 목적**](#개발-목적)

2. [**개발 환경**](#개발-환경)

3. [**프로젝트 구조**](#프로젝트-구조)

4. [**기능**](#기능)

5. [**느낀점**](#느낀점)
---

## 개발 목적
* 사이트에 등록된 게임들의 정보를 조회할 수 있고, 게임 구매 기능을 이용해 게임 소유와 리뷰를 남겨 모두가 볼 수 있습니다. 
* 사용자 간 커뮤니케이션(팔로잉, 팔로워, 채팅)과 문의를 통해 관리자와의 소통도 가능합니다.

---

## 개발 환경
* Java 11
* Spring 5.0.7
* JQuery
* Oracle 11g (Oracle Cloud / CentOS)
* bootstrap 5.0.2
* mybatis
* lombok

[목차](#목차)

---
## 프로젝트 구조

![GammaERD](https://user-images.githubusercontent.com/85823060/138556497-7ae1d0fc-47c1-464b-91c5-b961da713d75.png)

크게 게임 테이블과 유저 테이블로 나누어지고, 그에 따른 테이블들을 왜래키로 지정했습니다.

---

![Gamma파일 구조](https://user-images.githubusercontent.com/85823060/138556655-2a0b9359-4d6f-44f5-a768-cc6eeec1b7a5.png)

충돌 방지를 위해 기능마다 패키지를 나누었고, 뷰 패키지도 기능 별로 나누었습니다.

[목차](#목차)

---

## 기능

---
> ### 회원가입/로그인
>> 로그인

[목차](#목차)

---

> ### 게시판 기능
>> 글쓰기

---

> ### 게시판 기능
>> 글 수정/삭제

---

> ### 게시판 기능
>>댓글 / 대댓글

---

> ### 게시판 기능
>>추천 기능

---
> ### 게시판 기능
>>검색 

[목차](#목차)

---

> ### 보안 / 배포
>> 배포


## 느낀점

1. 첫번 째 프로젝트의 협업 방식을 보완하여 진행해 순조롭게 프로젝트를 만들 수 있었습니다.

2. 진행 중 마찰이 있었다면 전면 비대면으로 인해서 연결되는 기능들의 커뮤니케이션에 문제가 있었습니다.    
   문제를 보고 다음 협업에선 보완해야할 점들을 생각하게 되었고, 이는 다음 프로젝트에선 큰 도움이 될 것이라고 생각합니다.
