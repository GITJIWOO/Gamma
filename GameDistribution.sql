/*  미완성 테이블
    consumerPicture
    gamePicture
    consumerPayment
*/

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
    gnum NUMBER PRIMARY KEY,
    gname VARCHAR2(100) NOT NULL,
    glaunch DATE NOT NULL,
    gdeveloper VARCHAR2(20) NOT NULL,
    gfublisher VARCHAR2(20) NOT NULL,
    gprice VARCHAR2(20) NOT NULL,
    gcontent VARCHAR2(1000) NOT NULL,
    ggrade NUMBER(4) NOT NULL,
    gsite VARCHAR2(100) NOT NULL,
    gaddress VARCHAR2(1000) NOT NULL
);
SELECT * FROM game;
INSERT INTO game 
VALUES (game_num.nextval, '배그', TO_DATE('2021/09/24 ', 'YYYY/MM/DD '), 'duo', 'dou', 18000, 'good', 18, 'www.bg.com', 'www.youtube.com/2312eqeqw');

/*  게임 시스템 요구 사항
    gnum = 게임 식별 번호(외래키)
    운영체제
    프로세서
    메모리
    그래픽
    DirectX
    저장공간
*/
CREATE SEQUENCE gamerequirement_num;
CREATE TABLE gameRequirement (
    grnum NUMBER PRIMARY KEY,
    gnum NUMBER NOT NULL,
    gos VARCHAR2(100) NOT NULL,
    gprocessor VARCHAR2(100) NOT NULL,
    gmemory VARCHAR2(100) NOT NULL,
    ggraphic VARCHAR2(100) NOT NULL,
    gdirectx VARCHAR2(100) NOT NULL,
    gstore VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_gameRequirement FOREIGN KEY(gnum) 
    REFERENCES game(gnum)
);
SELECT * FROM gamerequirement;
INSERT INTO gamerequirement VALUES (gamerequirement_num.nextval, 23,'a', 'a','a','a','a','a');
select * from gamerequirement left join game using (gnum);

/*  사용자 테이블
    cnum = 사용자 식별 번호
    cid = 아이디
    email = 이메일
    password = 비밀번호
    nickname = 닉네임
    cadmin = 관리자 여부(0 = 일반 사용자)
*/
CREATE SEQUENCE consumer_num;
CREATE TABLE consumer (
    cnum NUMBER PRIMARY KEY,
    cid VARCHAR2(20) NOT NULL UNIQUE,
    email VARCHAR2(100) NOT NULL,
    password VARCHAR2(20) NOT NULL,
    nickname VARCHAR(20) NOT NULL UNIQUE,
    cadmin NUMBER(3) DEFAULT 0
);
INSERT INTO consumer(cnum, cid, email, password, nickname, cadmin) 
    VALUES(consumer_num.nextval,'kjw011231', 'kjw0111231@gmail.com', 'rlawldn', '김지우', 1);

/*  사진 테이블
    시간
    외래키
    번호
    UUID
*/
CREATE TABLE consumerPicture (
    uuid VARCHAR2(100) PRIMARY KEY,
    cid VARCHAR2(100),
    upic_num VARCHAR2(100),
    upic_time VARCHAR2(100),
    CONSTRAINT fk_consumerPicture FOREIGN KEY (cid)
    REFERENCES consumer(cid)
);

CREATE TABLE gamePicture (
    uuid VARCHAR2(100) PRIMARY KEY,
    gnum NUMBER NOT NULL,
    gpic_num VARCHAR2(100) NOT NULL,
    gpic_time VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_gamePicture FOREIGN KEY (gnum)
    REFERENCES game(gnum)
);

/*  사용자 라이브러리
    사용자 이메일
    게임 식별 번호
*/
CREATE TABLE consumerLibrary (
    ubnum number PRIMARY KEY,
    cid VARCHAR2(100),
    gnum NUMBER,
    CONSTRAINT fk_consumerlibrarycid FOREIGN KEY (cid)
    REFERENCES consumer(cid),
    CONSTRAINT fk_consumerlibrarygnum FOREIGN KEY (gnum)
    REFERENCES game(gnum)
);

/*  게임 태그 테이블
    태그 식별 번호
    gnum = 게임 식별 번호(외래키)
    tag = 태그
*/
select gametag_num.nextval from dual;
CREATE SEQUENCE gametag_num;
CREATE TABLE gameTag (
    gtnum NUMBER PRIMARY KEY,
    tagname VARCHAR2(100) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINT fk_gametag FOREIGN KEY(gnum) 
    REFERENCES game(gnum)
);
SELECT * FROM gametag;
SELECT * FROM game;
INSERT INTO gametag VALUES(gametag_num.nextval, '롤은 타워 깨는 게임이야', 6);
select * from gametag a left join game b using (gnum);

/*  게임 리뷰 테이블
    grnum = 리뷰 식별 번호
    gnum = 게임 식별 번호(외래키)
    grlike = 좋아요, 싫어요
    grtitle = 제목
    grcontent = 본문
    grrecommend = 평가 추천 수
    grdate = 작성일
*/
CREATE SEQUENCE gamereview_num;
CREATE TABLE gameReview (
    grnum NUMBER PRIMARY KEY,
    gnum NUMBER NOT NULL,
    cid VARCHAR2(20) NOT NULL,
    grlike NUMBER(3) NOT NULL,
    grtitle VARCHAR2(100) NOT NULL,
    grcontent VARCHAR2(2000) NOT NULL,
    grrecommend NUMBER DEFAULT 0,
    grdate DATE DEFAULT sysdate,
    CONSTRAINT fk_gamereviewgnum FOREIGN KEY(gnum) 
    REFERENCES game(gnum),
    CONSTRAINT fk_gamereviewcid FOREIGN KEY(cid) 
    REFERENCES consumer(cid)
);

/*  리뷰 댓글 테이블
    rcnum = 댓글 식별 번호
    grnum = 리뷰 식별 번호(외래키)
    rccontent = 댓글 본문
    rcdate = 작성일
*/
CREATE SEQUENCE reviewcomment_num;
CREATE TABLE reviewComment (
    rcnum NUMBER PRIMARY KEY,
    grnum NUMBER,
    cid VARCHAR2(20) NOT NULL,
    rccontent VARCHAR2(1000) NOT NULL,
    rcdate DATE DEFAULT sysdate,
    CONSTRAINT fk_reviewcommentgrnum FOREIGN KEY(grnum) 
    REFERENCES gamereview(grnum),
    CONSTRAINT fk_reviewCommentcid FOREIGN KEY(cid) 
    REFERENCES consumer(cid)
);

/*  친구 테이블
    친구 식별 번호(기본키)
    친구 이메일
    본인 이메일(외래키)
    팔로잉(본인이 다른사람을)
    팔로워(다른사람이 본인을)
*/
CREATE SEQUENCE friends_num;
CREATE TABLE friends (
    fnum NUMBER,
    follower VARCHAR2(20) NOT NULL,
    following VARCHAR2(20) NOT NULL,/* 로그인 계정 */
    CONSTRAINT pk_friends PRIMARY KEY(follower, following),
    CONSTRAINT fk_friends FOREIGN KEY(following) REFERENCES consumer(cid)
);

/*  상태글 테이블
    상태글 식별 번호(기본키)
    이메일(외래키)
    상태글 작성일
*/
CREATE SEQUENCE statuscomment_num;
CREATE TABLE statuscomment(
    snum NUMBER PRIMARY KEY,
    sid VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_statuscomment FOREIGN KEY(sid) REFERENCES consumer(cid),
    sdate DATE DEFAULT SYSDATE
);

/*  Question 테이블
    글 식별 번호(기본키)
    제목
    본문
    글쓴이(외래키)
    질문 날짜
*/
CREATE SEQUENCE question_num;
CREATE TABLE question (
    qnum NUMBER PRIMARY KEY,
    qtitle VARCHAR2(50) NOT NULL,
    qcontent VARCHAR2(1000) NOT NULL,
    qwriter VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_question FOREIGN KEY(qwriter) REFERENCES consumer(cid),
    qdate DATE DEFAULT SYSDATE
);

/*  Answer 테이블
    글 식별 번호(기본키)
    질문글 식별 번호(외래키)
    본문
    답변 날짜
*/
CREATE SEQUENCE answer_num;
CREATE TABLE answer (
    anum NUMBER PRIMARY KEY,
    qnanum NUMBER NOT NULL,
    CONSTRAINT fk_answer FOREIGN KEY(qnanum) REFERENCES question(qnum),
    acontent VARCHAR2(1000) NOT NULL,
    adate DATE DEFAULT SYSDATE
);

/*  사용자 결제 내역
    결제 번호
    사용자 이메일(외래키)
    결제 날짜
    결제 금액
    결제 방법
    결제 상태
*/
CREATE TABLE consumerPayment (
    upnum NUMBER PRIMARY KEY,
    email VARCHAR2(100) PRIMARY KEY,
    upday DATE DEFAULT sysdate,
    upprice NUMBER(100) NOT NULL,
    upmethod ,
    
);

/*  사용자 찜 목록
    찜 식별 번호
    사용자 이메일
    게임 식별 번호
*/
CREATE SEQUENCE gamewishlist_num;
CREATE TABLE gameWishlist (
    wishnum NUMBER PRIMARY KEY,
    cid VARCHAR2(20) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINT fk_gamewishlistcid FOREIGN KEY(cid)REFERENCES consumer(cid),
    CONSTRAINT fk_gamewishlistgnum FOREIGN KEY(gnum)REFERENCES game(gnum)
);

/*  장바구니
    장바구니 번호
    사용자 이메일
    게임 식별 번호
*/
CREATE SEQUENCE shoppingbasket_num;
CREATE TABLE shoppingBasket (
    sbnum NUMBER PRIMARY KEY,
    cid VARCHAR2(20) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINT fk_shoppingbasketcid FOREIGN KEY(cid)REFERENCES consumer(cid),
    CONSTRAINT fk_shoppingbasketgnum FOREIGN KEY(gnum)REFERENCES game(gnum)

);