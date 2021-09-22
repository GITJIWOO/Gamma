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

/*  게임 시스템 요구 사항
    gnum = 게임 식별 번호(외래키)
    운영체제
    프로세서
    메모리
    그래픽
    DirectX
    저장공간
*/
CREATE TABLE gameRequirement (
    gnum NUMBER NOT NULL,
    gos VARCHAR2(100) NOT NULL,
    gprocessor VARCHAR2(100) NOT NULL,
    gmemory VARCHAR2(100) NOT NULL,
    ggraphic VARCHAR2(100) NOT NULL,
    gdirectx VARCHAR2(100) NOT NULL,
    gstore VARCHAR2(100) NOT NULL,
    CONSTRAINTS fk_gameRequirement FOREIGN KEY(gnum) 
    REFERENCES game(gnum)

);

/*  사용자 테이블
    email = 이메일
    password = 비밀번호
    google_login_yn	= 구글 로그인
    
*/
CREATE TABLE user (
    email VARCHAR2(100) PRIMARY KEY,
    password VARCHAR2(20) NOT NULL,
    nick_name VARCHAR(20) NOT NULL
);


/*  사진 테이블
    시간
    번호
    UUID
*/
CREATE TABLE userPicture (
    uuid VARCHAR2(100) PRIMARY KEY,
    email VARCHAR2(100),
    upic_num VARCHAR2(20),
    upic_time VARCHAR2(20),
    CONSTRAINT fk_userPicture FOREIGN KEY (email)
    REFERENCES user(email)
);

CREATE TABLE gamePicture (
    uuid VARCHAR2(100) PRIMARY KEY,
    gnum NUMBER NOT NULL,
    gpic_num VARCHAR2(20) NOT NULL,
    gpic_time VARCHAR2(20) NOT NULL
);

/*  사용자 라이브러리
    사용자 이메일
    게임 식별 번호
*/
CREATE TABLE userLibrary (
    ubnum number PRIMARY KEY,
    email VARCHAR2(100),
    gnum NUMBER,
    CONSTRAINT fk_userlibrary FOREIGN KEY (email)
    REFERENCES user(email)
);

/*  구글 로그인
    아이디
    인증 이메일
    
    >> user table과 구글 로그인 테이블 컬림이 중복되어 분리 할 이유가 없으며 (구글 id = 이메일, 인증 이메일 = 이메일)
    , 분리시 개발에 혼동이 올 수 있음
    
    단, 유저테이블에 구글 로그인 col 을 추가하여, 구글 로그인 인지, 홈페이지 회원가입 자 인지 구분은 필요 하기에 user 테이블에 google_login 컬럼을 추가 함.
    
CREATE TABLE socialuser(
    
);
*/
/*  게임 태그 테이블
    태그 식별 번호
    gnum = 게임 식별 번호(외래키)
    tag = 태그
*/
CREATE SEQUENCE gametag_num;
CREATE TABLE gameTag (
    gtnum NUMBER,
    gnum NUMBER,
    tagname VARCHAR2(100),
    CONSTRAINT fk_gametag FOREIGN KEY(gnum) 
    REFERENCES game(gnum),
    CONSTRAINT pk_gametag PRIMARY KEY(gnum, tagname)
);

/*  게임 리뷰 테이블
    grnum = 리뷰 식별 번호
    gnum = 게임 식별 번호(외래키)
    grlike = 좋아요, 싫어요
    grtitle = 제목
    grcontent = 본문
    grrecomment = 평가 추천 수
    grdate = 작성일
*/
CREATE SEQUENCE gamereview_num;
CREATE TABLE gameReview (
    grnum NUMBER PRIMARY KEY,
    gnum NUMBER NOT NULL,
    email VARCHAR2(100) NOT NULL,
    grlike NUMBER(3) NOT NULL,
    grtitle VARCHAR2(100) NOT NULL,
    grcontent VARCHAR2(2000) NOT NULL,
    grrecommend NUMBER,
    grdate DATE DEFAULT sysdate,
    CONSTRAINT fk_gamereview FOREIGN KEY(gnum) 
    REFERENCES game(gnum)
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
    email VARCHAR2(100) NOT NULL,
    rccontent VARCHAR2(1000) NOT NULL,
    rcdate DATE DEFAULT sysdate,
    CONSTRAINT fk_reviewcomment FOREIGN KEY(grnum) 
    REFERENCES gamereview(grnum)
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
    fnum NUMBER PRIMARY KEY,
    follower VARCHAR2(30) NOT NULL,
    following VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_friends FOREIGN KEY(following) REFERENCES join_user(email)
);

/*  상태글 테이블
    상태글 식별 번호(기본키)
    이메일(외래키)
    상태글 작성일
*/
CREATE SEQUENCE statuscomment_num;
CREATE TABLE statuscomment(
    snum NUMBER PRIMARY KEY,
    semail VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_statuscomment FOREIGN KEY(semail) REFERENCES join_user(email),
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
    qemail VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_question FOREIGN KEY(qemail) REFERENCES join_user(email),
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
CREATE TABLE userPayment (
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
    email VARCHAR2(100) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINTS fk_gamewishlist FOREIGN KEY(email)REFERENCES join_user(email),
    CONSTRAINTS fk_gamewhishlist FOREIGN KEY(gnum)REFERENCES game(gnum)
);
/*  장바구니
    장바구니 번호
    사용자 이메일
    게임 식별 번호
*/
CREATE SEQUENCE shoppingbasket_num;
CREATE TABLE shoppingBasket (
    sbnum NUMBER PRIMARY KEY,
    email VARCHAR2(100) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINTS fk_shoppingbasket FOREIGN KEY(email)REFERENCES join_user(email),
    CONSTRAINTS fk_shoppingbasket FOREIGN KEY(gnum)REFERENCES game(gnum)

);