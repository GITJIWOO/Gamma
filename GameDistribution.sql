/*  게임 ?��?���?
    gnum = 게임 ?���? 번호
    게임 ?���?
    게임 출시?��
    개발?��
    배급?��
    ?���?
    �?�?
    ?���?
    ?���?
    게임 ?��?��?��
    ?��?��?�� 주소
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

/*  게임 ?��?��?�� ?���? ?��?��
    gnum = 게임 ?���? 번호(?��?��?��)
    ?��?��체제
    ?��로세?��
    메모�?
    그래?��
    DirectX
    ???��공간
*/
CREATE TABLE gameRequirement (
    gnum NUMBER NOT NULL,
    gos VARCHAR2(100) PRIMARY KEY,
    gprocessor VARCHAR2(100) NOT NULL,
    gmemory VARCHAR2(100) NOT NULL,
    ggraphic VARCHAR2(100) NOT NULL,
    gdirectx VARCHAR2(100) NOT NULL,
    gstore VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_gameRequirement FOREIGN KEY(gnum) 
    REFERENCES game(gnum)

);

/*  ?��?��?�� ?��?���?
    email = ?��메일
    password = 비�?번호
    google_login_yn	= 구�? 로그?��
    
*/
CREATE SEQUENCE consumer_num;
CREATE TABLE consumer (
    cnum NUMBER,
    cid VARCHAR2(20) PRIMARY KEY,
    email VARCHAR2(100) NOT NULL,
    password VARCHAR2(20) NOT NULL,
    nick_name VARCHAR(20) NOT NULL,
    cadmin NUMBER(3) DEFAULT 1
);


/*  ?���? ?��?���?
    ?���?
    번호
    UUID
*/
CREATE TABLE consumerPicture (
    uuid VARCHAR2(100) PRIMARY KEY,
    cid VARCHAR2(100),
    upic_num VARCHAR2(20),
    upic_time VARCHAR2(20),
    CONSTRAINT fk_Picture FOREIGN KEY (cid)
    REFERENCES consumer(cid)
);

CREATE TABLE gamePicture (
    uuid VARCHAR2(100) PRIMARY KEY,
    gnum NUMBER NOT NULL,
    gpic_num VARCHAR2(20) NOT NULL,
    gpic_time VARCHAR2(20) NOT NULL
);

/*  ?��?��?�� ?��?��브러�?
    ?��?��?�� ?��메일
    게임 ?���? 번호
*/
CREATE TABLE consumerLibrary (
    ubnum number PRIMARY KEY,
    cid VARCHAR2(100),
    gnum NUMBER,
    CONSTRAINT fk_consumerlibrary FOREIGN KEY (cid)
    REFERENCES consumer(cid)
);

/*  구�? 로그?��
    ?��?��?��
    ?���? ?��메일
    
    >> user table�? 구�? 로그?�� ?��?���? 컬림?�� 중복?��?�� 분리 ?�� ?��?���? ?��?���? (구�? id = ?��메일, ?���? ?��메일 = ?��메일)
    , 분리?�� 개발?�� ?��?��?�� ?�� ?�� ?��?��
    
    ?��, ?��???��?��블에 구�? 로그?�� col ?�� 추�??��?��, 구�? 로그?�� ?���?, ?��?��?���? ?��?���??�� ?�� ?���? 구분?? ?��?�� ?��기에 user ?��?��블에 google_login 컬럼?�� 추�? ?��.
    
CREATE TABLE socialuser(
    
);
*/
/*  게임 ?���? ?��?���?
    ?���? ?���? 번호
    gnum = 게임 ?���? 번호(?��?��?��)
    tag = ?���?
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

/*  게임 리뷰 ?��?���?
    grnum = 리뷰 ?���? 번호
    gnum = 게임 ?���? 번호(?��?��?��)
    grlike = 좋아?��, ?��?��?��
    grtitle = ?���?
    grcontent = 본문
    grrecomment = ?���? 추천 ?��
    grdate = ?��?��?��
*/
CREATE SEQUENCE gamereview_num;
CREATE TABLE gameReview (
    grnum NUMBER PRIMARY KEY,
    gnum NUMBER NOT NULL,
    cid VARCHAR2(20) NOT NULL,
    grlike NUMBER(3) NOT NULL,
    grtitle VARCHAR2(100) NOT NULL,
    grcontent VARCHAR2(2000) NOT NULL,
    grrecommend NUMBER,
    grdate DATE DEFAULT sysdate,
    CONSTRAINT fk_gamereview FOREIGN KEY(gnum) 
    REFERENCES game(gnum),
    CONSTRAINT fk_consumer FOREIGN KEY(cid) 
    REFERENCES consumer(cid)
);

/*  리뷰 ?���? ?��?���?
    rcnum = ?���? ?���? 번호
    grnum = 리뷰 ?���? 번호(?��?��?��)
    rccontent = ?���? 본문
    rcdate = ?��?��?��
*/
CREATE SEQUENCE reviewcomment_num;
CREATE TABLE reviewComment (
    rcnum NUMBER PRIMARY KEY,
    grnum NUMBER,
    cid VARCHAR2(20) NOT NULL,
    rccontent VARCHAR2(1000) NOT NULL,
    rcdate DATE DEFAULT sysdate,
    CONSTRAINT fk_reviewcomment FOREIGN KEY(grnum) 
    REFERENCES gamereview(grnum),
    CONSTRAINT fk_consumer FOREIGN KEY(cid) 
    REFERENCES consumer(cid)
);

/*  친구 ?��?���?
    친구 ?���? 번호(기본?��)
    친구 ?��메일
    본인 ?��메일(?��?��?��)
    ?��로잉(본인?�� ?��른사?��?��)
    ?��로워(?��른사?��?�� 본인?��)
*/
CREATE SEQUENCE friends_num;
CREATE TABLE friends (
    fnum NUMBER PRIMARY KEY,
    follower VARCHAR2(30) NOT NULL,
    following VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_friends FOREIGN KEY(following) REFERENCES join_user(email)
);

/*  ?��?���? ?��?���?
    ?��?���? ?���? 번호(기본?��)
    ?��메일(?��?��?��)
    ?��?���? ?��?��?��
*/
CREATE SEQUENCE statuscomment_num;
CREATE TABLE statuscomment(
    snum NUMBER PRIMARY KEY,
    semail VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_statuscomment FOREIGN KEY(semail) REFERENCES join_user(email),
    sdate DATE DEFAULT SYSDATE
);

/*  Question ?��?���?
    �? ?���? 번호(기본?��)
    ?���?
    본문
    �??��?��(?��?��?��)
    질문 ?���?
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

/*  Answer ?��?���?
    �? ?���? 번호(기본?��)
    질문�? ?���? 번호(?��?��?��)
    본문
    ?���? ?���?
*/
CREATE SEQUENCE answer_num;
CREATE TABLE answer (
    anum NUMBER PRIMARY KEY,
    qnanum NUMBER NOT NULL,
    CONSTRAINT fk_answer FOREIGN KEY(qnanum) REFERENCES question(qnum),
    acontent VARCHAR2(1000) NOT NULL,
    adate DATE DEFAULT SYSDATE
);

/*  ?��?��?�� 결제 ?��?��
    결제 번호
    ?��?��?�� ?��메일(?��?��?��)
    결제 ?���?
    결제 금액
    결제 방법
    결제 ?��?��
*/
CREATE TABLE consumerPayment (
    upnum NUMBER PRIMARY KEY,
    email VARCHAR2(100) PRIMARY KEY,
    upday DATE DEFAULT sysdate,
    upprice NUMBER(100) NOT NULL,
    upmethod ,
    
);

/*  ?��?��?�� �? 목록
    �? ?���? 번호
    ?��?��?�� ?��메일
    게임 ?���? 번호
*/
CREATE SEQUENCE gamewishlist_num;
CREATE TABLE gameWishlist (
    wishnum NUMBER PRIMARY KEY,
    cid VARCHAR2(20) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINTS fk_gamewishlist FOREIGN KEY(cid)REFERENCES consumer(cid),
    CONSTRAINTS fk_gamewhishlist FOREIGN KEY(gnum)REFERENCES game(gnum)
);

/*  ��ٱ���
    ��ٱ��� ��ȣ
    ����� �̸���
    ���� �ĺ� ��ȣ
*/
CREATE SEQUENCE shoppingbasket_num;
CREATE TABLE shoppingBasket (
    sbnum NUMBER PRIMARY KEY,
    cid VARCHAR2(20) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINTS fk_shoppingbasket FOREIGN KEY(cid)REFERENCES consumer(cid),
    CONSTRAINTS fk_shoppingbasket FOREIGN KEY(gnum)REFERENCES game(gnum)

);