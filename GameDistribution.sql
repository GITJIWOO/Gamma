/*  게임 테이블
    gnum = 게임 식별 번호
    게임 제목
    게임 출시일
    개발사
    배급사
    태그
    가격
    설명
    등급
    게임 사이트
    동영상 주소
*/
CREATE TABLE game (
    
);

/*  사용자 테이블
    email = 이메일
    password = 비밀번호
*/
CREATE TABLE user (
    email VARCHAR2(100) PRIMARY KEY,
    password VARCHAR2(20) NOT NULL
);
/*  프로필
    이메일
    닉네임
    소개
*/
CREATE TABLE profile (
    
);

/*  구글 로그인
    아이디
    인증 이메일
*/
CREATE TABLE socialuser(
    
);

/*  사진 테이블
    시간
    번호
    UUID
*/
CREATE TABLE userpicture (
    
);

CREATE TABLE gamepicture (

);
/*  게임 태그 테이블
    태그 식별 번호
    gnum = 게임 식별 번호(외래키)
    tag = 태그
*/
CREATE TABLE gametag (
    gnum NUMBER
    tag VARCHAR2(100) NOT NULL
);

CREATE TABLE gamereview (

);
/*  친구 테이블
    친구 식별 번호
    이메일
    친구 이메일
*/
CREATE TABLE friends (

);
/*  Q&A 테이블
    글 식별 번호
    제목
    본문
    글쓴이
    질문 날짜
*/
CREATE TABLE question (

);
/*  답변 테이블
    글 식별 번호
    본문
    답변 날짜
*/
CREATE TABLE answer (

);

/*  사용자 결제 정보
    결제 번호
    사용자 이메일(외래키)
    결제 날짜
    결제 금액
    결제 방법
    결제 상태
*/
CREATE TABLE userpayment (

);
/*  사용자 라이브러리
    사용자 이메일
    게임 식별 번호
*/
CREATE TABLE userlibrary (

);
/*  사용자 찜 목록
    찜 식별 번호
    사용자 이메일
    게임 식별 번호
*/
CREATE TABLE gamewishlist (

);
/*  장바구니
    장바구니 번호
    사용자 이메일
    게임 식별 번호
*/
CREATE TABLE shoppingbasket (

);