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
CREATE SEQUENCE game_num;
CREATE TABLE game (
    gNum NUMBER PRIMARY KEY,
    gName VARCHAR2(100) NOT NULL,
    gReleaseDate DATE NOT NULL,
    gDeveloper VARCHAR2(20) NOT NULL,
    gFublisher VARCHAR2(20) NOT NULL,
    gTag VARCHAR2(20) NOT NULL,
    gPrice VARCHAR2(20) NOT NULL,
    gContent VARCHAR2(1000) NOT NULL,
    gGrade NUMBER(4) NOT NULL,
    gSite VARCHAR2(100) NOT NULL,
    gAddress VARCHAR2(1000) NOT NULL
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
CREATE SEQUENCE gametag_num;
CREATE TABLE gametag (
    gnum NUMBER PRIMARY KEY,
    tag VARCHAR2(100) NOT NULL,
    CONSTRAINTS fk_gametag FOREIGN KEY(gNum) 
    REFERENCES game(gNum)
);

/*  게임 리뷰 테이블
    grnum = 리뷰 식별 번호
    gnum = 게임 식별 번호
    grlike = 좋아요, 싫어요
    grtitle = 제목
    grcontent = 본문
    grdate = 작성일
*/
CREATE SEQUENCE gamereview_num;
CREATE TABLE gamereview (
    grnum NUMBER PRIMARY KEY,
    gnum NUMBER NOT NULL,
    grlike NUMBER(3) NOT NULL,
    grtitle VARCHAR2(100) NOT NULL,
    grcontent VARCHAR2(2000) NOT NULL,
    grdate DATE DEFAULT sysdate,
    CONSTRAINTS fk_gamereview FOREIGN KEY(gnum) 
    REFERENCES game(gnum)
);

/*  리뷰 댓글 테이블
    rcnum = 댓글 식별 번호
    grnum = 리뷰 식별 번호(외래키)
    rccontent = 댓글 본문
    rcdate = 작성일
*/
CREATE SEQUENCE reviewcomment_num;
CREATE TABLE reviewcomment (
    rcnum NUMBER PRIMARY KEY,
    grnum NUMBER PRIMARY KEY,
    rccontent VARCHAR2(1000) NOT NULL,
    rcdate DATE DEFAULT sysdate,
    CONSTRAINTS fk_reviewcomment FOREIGN KEY(grnum) 
    REFERENCES gamereview(grnum)
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

/*  사용자 결제 내역
    결제 번호
    사용자 이메일(외래키)
    결제 날짜
    결제 금액
    결제 방법
    결제 상태
*/
CREATE TABLE userpayment (
    upnum NUMBER PRIMARY KEY,
    email VARCHAR2(100) PRIMARY KEY,
    update DATE DEFAULT sysdate,
    upprice NUMBER(100) NOT NULL,
    upmethod ,
    
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
CREATE SEQUENCE gamewishlist_num;
CREATE TABLE gamewishlist (
    wishNum NUMBER PRIMARY KEY,
    CONSTRAINTS fk_gamewishlist FOREIGN KEY(email)REFERENCES join_user(email),
    CONSTRAINTS fk_gamewhishlist FOREIGN KEY(gNum)REFERENCES game(gNum)
);
/*  장바구니
    장바구니 번호
    사용자 이메일
    게임 식별 번호
*/
CREATE SEQUENCE shoppingbasket_num;
CREATE TABLE shoppingbasket (
    sbNum NUMBER PRIMARY KEY,
    CONSTRAINTS fk_shoppingbasket FOREIGN KEY(email)REFERENCES join_user(email),
    CONSTRAINTS fk_shoppingbasket FOREIGN KEY(gNum)REFERENCES game(gNum)

);