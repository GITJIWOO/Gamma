# 🎮Gamma
## 목차
1. [**프로젝트 소개**](#프로젝트-소개)

2. [**조원 구성**](#조원-구성)

3. [**개발 환경**](#개발-환경)

4. [**프로젝트 구조**](#프로젝트-구조)

5. [**기능**](#기능)

6. [**느낀점**](#느낀점)

---

## 프로젝트 소개

<br/>

![Gamma](https://user-images.githubusercontent.com/85823060/139039806-6a768c47-937e-44df-a37c-a2b1c8b3b134.png)

## Gamma는 전자 게임 유통망입니다.
* 사이트에 등록된 게임들의 정보를 조회할 수 있고, 게임 구매 기능을 이용해 게임 소유와 리뷰를 남겨 모두가 볼 수 있습니다.
* 사용자 간 커뮤니케이션(팔로잉, 팔로워, 채팅)과 문의를 통해 관리자와의 소통도 가능합니다.
* Origin, Steam의 UI를 모티브로 참고했습니다.

<br/>

---

## 팀원 및 기능 

<br/>

* 김영훈 - 게임 CRUD, 게임 검색
* 김지우 - 게임 평가, 결제, 라이브러리, 장바구니
* 조훈현 - 사용자, 프로필CRU
* 최재인 - 시큐리티, 친구, Q&A FAQ


<br/>

---

## 개발 환경
* Java 11
* Spring 5.0.7
* JQuery
* Oracle 11g (Oracle Cloud / CentOS)
* bootstrap 5.0.2
* Ajax
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

UI 구조는 Origin과 같이 고정된 사이드 바로 어느 페이지에서도 자주 이용하는 페이지를 고정시켜서 사용자가 편하게 이용할 수 있도록 설계했습니다.

[목차](#목차)

---

## 기능

---
> ### 게임 CRUD
>> 게임 추가   
>> 
>
>> 게임 수정
>> 
>
>> 게임 삭제
>>
>
>> 페이징
>> 
>

---

> ### 사용자 기능
>> 회원가입   
>>
>
>> 로그인   
>>
>
>> 로그아웃   
>>
>
>> 회원탈퇴   
>>
>
>> 프로필   
>> 
> 

---

> ### Q&A, FAQ
>> 글 수정/삭제   
>> 
> 
>> 관리자 답변   
>> 
> 
---

> ### 팔로잉, 팔로워
>> 사용자 검색   
>>
>
>> 목록   
>> 
>

---
> ### 게임 구매
>> ### 아임포트 라이브러리로 케이지 이니시스 결제 테스트   
>> ![결제와 결제 확인](https://user-images.githubusercontent.com/85823060/142533530-326e3190-2b28-422a-bceb-6916d8e1fb53.gif)
>> 
>> 결제 후 라이브러리와 결제 내역에 사용자 정보 창에서 내역이 추가 된 것을 확인할 수 있습니다.
>> 
>> ![아임포트 결제코드](https://user-images.githubusercontent.com/85823060/142520219-7f60f431-ab9a-4f68-89d4-45970e389a9a.png)
>> 
>> 결제를 성공하면 ajax로 컨트롤러에 결제 정보를 보내고, 컨트롤러에선 라이브러리에 추가, 결제 내역을 저장해줍니다.
>> 아쉬운 점은, 계정마다 결제 정보를 입력할 수 있었지만 시간 상 더 상세한 결제 내역을 남기지 못하여 아쉬운 점이 있습니다.
>

---
> ### 게임 리뷰
>> ### 작성, 수정, 삭제   
>> ![리뷰 CRUD](https://user-images.githubusercontent.com/85823060/142524405-fb6a4d69-6691-4375-b462-663be780c083.gif)
>> 
>> 구매한 게임의 대한 리뷰를 남길 수 있습니다. 게임 상세 페이지에서 작성할 수 있고, 작성 후에도 수정과 삭제를 할 수 있습니다.
>> 
>
>> ### UI, 댓글, 좋아요   
>> ![리뷰 댓글 및 좋아요](https://user-images.githubusercontent.com/85823060/142528442-3f87d21f-ca7b-4ab1-9297-a346c5d63e51.gif)
>> 
>> 다른 사람들이 남긴 리뷰를 볼 수 있고, 그 리뷰에 대한 의견 댓글을 남기고, 한 계정 당 한개의 좋아요도 누를 수 있습니다.
>> 
> 

---

> ### 배포
>> 배포   

[목차](#목차)

---

## 느낀점

1. 첫번 째 프로젝트의 협업 방식을 보완하여 진행해 순조롭게 프로젝트를 만들 수 있었습니다.

2. 진행 중 마찰이 있었다면 비대면 프로젝트를 진행해서 연결되는 기능들의 커뮤니케이션에 문제가 있었습니다.    
   문제를 보고 다음 협업에선 보완해야할 점들을 생각하게 되었고, 이는 다음 프로젝트에선 큰 도움이 될 것이라고 생각합니다.
