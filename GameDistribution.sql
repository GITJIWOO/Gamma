/*  ê²Œì„ ?…Œ?´ë¸?
    gnum = ê²Œì„ ?‹ë³? ë²ˆí˜¸
    ê²Œì„ ? œëª?
    ê²Œì„ ì¶œì‹œ?¼
    ê°œë°œ?‚¬
    ë°°ê¸‰?‚¬
    ?ƒœê·?
    ê°?ê²?
    ?„¤ëª?
    ?“±ê¸?
    ê²Œì„ ?‚¬?´?Š¸
    ?™?˜?ƒ ì£¼ì†Œ
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

/*  ê²Œì„ ?‹œ?Š¤?…œ ?š”êµ? ?‚¬?•­
    gnum = ê²Œì„ ?‹ë³? ë²ˆí˜¸(?™¸?˜?‚¤)
    ?š´?˜ì²´ì œ
    ?”„ë¡œì„¸?„œ
    ë©”ëª¨ë¦?
    ê·¸ë˜?”½
    DirectX
    ???¥ê³µê°„
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

/*  ?‚¬?š©? ?…Œ?´ë¸?
    email = ?´ë©”ì¼
    password = ë¹„ë?ë²ˆí˜¸
    google_login_yn	= êµ¬ê? ë¡œê·¸?¸
    
*/
CREATE SEQUENCE consumer_num;
CREATE TABLE consumer (
    cnum NUMBER,
    cid VARCHAR2(20) PRIMARY KEY,
    email VARCHAR2(100) NOT NULL,
    password VARCHAR2(20) NOT NULL,
    nick_name VARCHAR(20) NOT NULL
);


/*  ?‚¬ì§? ?…Œ?´ë¸?
    ?‹œê°?
    ë²ˆí˜¸
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

/*  ?‚¬?š©? ?¼?´ë¸ŒëŸ¬ë¦?
    ?‚¬?š©? ?´ë©”ì¼
    ê²Œì„ ?‹ë³? ë²ˆí˜¸
*/
CREATE TABLE consumerLibrary (
    ubnum number PRIMARY KEY,
    cid VARCHAR2(100),
    gnum NUMBER,
    CONSTRAINT fk_consumerlibrary FOREIGN KEY (cid)
    REFERENCES consumer(cid)
);

/*  êµ¬ê? ë¡œê·¸?¸
    ?•„?´?””
    ?¸ì¦? ?´ë©”ì¼
    
    >> user tableê³? êµ¬ê? ë¡œê·¸?¸ ?…Œ?´ë¸? ì»¬ë¦¼?´ ì¤‘ë³µ?˜?–´ ë¶„ë¦¬ ?•  ?´?œ ê°? ?—†?œ¼ë©? (êµ¬ê? id = ?´ë©”ì¼, ?¸ì¦? ?´ë©”ì¼ = ?´ë©”ì¼)
    , ë¶„ë¦¬?‹œ ê°œë°œ?— ?˜¼?™?´ ?˜¬ ?ˆ˜ ?ˆ?Œ
    
    ?‹¨, ?œ ???…Œ?´ë¸”ì— êµ¬ê? ë¡œê·¸?¸ col ?„ ì¶”ê??•˜?—¬, êµ¬ê? ë¡œê·¸?¸ ?¸ì§?, ?™ˆ?˜?´ì§? ?šŒ?›ê°??… ? ?¸ì§? êµ¬ë¶„?? ?•„?š” ?•˜ê¸°ì— user ?…Œ?´ë¸”ì— google_login ì»¬ëŸ¼?„ ì¶”ê? ?•¨.
    
CREATE TABLE socialuser(
    
);
*/
/*  ê²Œì„ ?ƒœê·? ?…Œ?´ë¸?
    ?ƒœê·? ?‹ë³? ë²ˆí˜¸
    gnum = ê²Œì„ ?‹ë³? ë²ˆí˜¸(?™¸?˜?‚¤)
    tag = ?ƒœê·?
*/
CREATE SEQUENCE gametag_num;
CREATE TABLE gameTag (
    gtnum NUMBER PRIMARY KEY,
    tagname VARCHAR2(100) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINT fk_gametag FOREIGN KEY(gnum) 
    REFERENCES game(gnum)
);

/*  ê²Œì„ ë¦¬ë·° ?…Œ?´ë¸?
    grnum = ë¦¬ë·° ?‹ë³? ë²ˆí˜¸
    gnum = ê²Œì„ ?‹ë³? ë²ˆí˜¸(?™¸?˜?‚¤)
    grlike = ì¢‹ì•„?š”, ?‹«?–´?š”
    grtitle = ? œëª?
    grcontent = ë³¸ë¬¸
    grrecomment = ?‰ê°? ì¶”ì²œ ?ˆ˜
    grdate = ?‘?„±?¼
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

/*  ë¦¬ë·° ?Œ“ê¸? ?…Œ?´ë¸?
    rcnum = ?Œ“ê¸? ?‹ë³? ë²ˆí˜¸
    grnum = ë¦¬ë·° ?‹ë³? ë²ˆí˜¸(?™¸?˜?‚¤)
    rccontent = ?Œ“ê¸? ë³¸ë¬¸
    rcdate = ?‘?„±?¼
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

/*  ì¹œêµ¬ ?…Œ?´ë¸?
    ì¹œêµ¬ ?‹ë³? ë²ˆí˜¸(ê¸°ë³¸?‚¤)
    ì¹œêµ¬ ?´ë©”ì¼
    ë³¸ì¸ ?´ë©”ì¼(?™¸?˜?‚¤)
    ?Œ”ë¡œì‰(ë³¸ì¸?´ ?‹¤ë¥¸ì‚¬?Œ?„)
    ?Œ”ë¡œì›Œ(?‹¤ë¥¸ì‚¬?Œ?´ ë³¸ì¸?„)
*/
CREATE SEQUENCE friends_num;
CREATE TABLE friends (
    fnum NUMBER PRIMARY KEY,
    follower VARCHAR2(30) NOT NULL,
    following VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_friends FOREIGN KEY(following) REFERENCES join_user(email)
);

/*  ?ƒ?ƒœê¸? ?…Œ?´ë¸?
    ?ƒ?ƒœê¸? ?‹ë³? ë²ˆí˜¸(ê¸°ë³¸?‚¤)
    ?´ë©”ì¼(?™¸?˜?‚¤)
    ?ƒ?ƒœê¸? ?‘?„±?¼
*/
CREATE SEQUENCE statuscomment_num;
CREATE TABLE statuscomment(
    snum NUMBER PRIMARY KEY,
    semail VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_statuscomment FOREIGN KEY(semail) REFERENCES join_user(email),
    sdate DATE DEFAULT SYSDATE
);

/*  Question ?…Œ?´ë¸?
    ê¸? ?‹ë³? ë²ˆí˜¸(ê¸°ë³¸?‚¤)
    ? œëª?
    ë³¸ë¬¸
    ê¸??“´?´(?™¸?˜?‚¤)
    ì§ˆë¬¸ ?‚ ì§?
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

/*  Answer ?…Œ?´ë¸?
    ê¸? ?‹ë³? ë²ˆí˜¸(ê¸°ë³¸?‚¤)
    ì§ˆë¬¸ê¸? ?‹ë³? ë²ˆí˜¸(?™¸?˜?‚¤)
    ë³¸ë¬¸
    ?‹µë³? ?‚ ì§?
*/
CREATE SEQUENCE answer_num;
CREATE TABLE answer (
    anum NUMBER PRIMARY KEY,
    qnanum NUMBER NOT NULL,
    CONSTRAINT fk_answer FOREIGN KEY(qnanum) REFERENCES question(qnum),
    acontent VARCHAR2(1000) NOT NULL,
    adate DATE DEFAULT SYSDATE
);

/*  ?‚¬?š©? ê²°ì œ ?‚´?—­
    ê²°ì œ ë²ˆí˜¸
    ?‚¬?š©? ?´ë©”ì¼(?™¸?˜?‚¤)
    ê²°ì œ ?‚ ì§?
    ê²°ì œ ê¸ˆì•¡
    ê²°ì œ ë°©ë²•
    ê²°ì œ ?ƒ?ƒœ
*/
CREATE TABLE consumerPayment (
    upnum NUMBER PRIMARY KEY,
    email VARCHAR2(100) PRIMARY KEY,
    upday DATE DEFAULT sysdate,
    upprice NUMBER(100) NOT NULL,
    upmethod ,
    
);

/*  ?‚¬?š©? ì°? ëª©ë¡
    ì°? ?‹ë³? ë²ˆí˜¸
    ?‚¬?š©? ?´ë©”ì¼
    ê²Œì„ ?‹ë³? ë²ˆí˜¸
*/
CREATE SEQUENCE gamewishlist_num;
CREATE TABLE gameWishlist (
    wishnum NUMBER PRIMARY KEY,
    cid VARCHAR2(20) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINTS fk_gamewishlist FOREIGN KEY(cid)REFERENCES consumer(cid),
    CONSTRAINTS fk_gamewhishlist FOREIGN KEY(gnum)REFERENCES game(gnum)
);

/*  Àå¹Ù±¸´Ï
    Àå¹Ù±¸´Ï ¹øÈ£
    »ç¿ëÀÚ ÀÌ¸ŞÀÏ
    °ÔÀÓ ½Äº° ¹øÈ£
*/
CREATE SEQUENCE shoppingbasket_num;
CREATE TABLE shoppingBasket (
    sbnum NUMBER PRIMARY KEY,
    cid VARCHAR2(20) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINTS fk_shoppingbasket FOREIGN KEY(cid)REFERENCES consumer(cid),
    CONSTRAINTS fk_shoppingbasket FOREIGN KEY(gnum)REFERENCES game(gnum)

);