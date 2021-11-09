/*  ë¯¸ì™„?„± ?…Œ?´ë¸?
    consumerPicture
    gamePicture
    consumerPayment
*/

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
    gpicture VARCHAR2(100) NOT NULL,
    gcontent VARCHAR2(1000) NOT NULL,
    ggrade NUMBER(4) NOT NULL,
    gsite VARCHAR2(100) NOT NULL,
    gaddress VARCHAR2(1000) NOT NULL
);
SELECT * FROM game;
INSERT INTO game 
VALUES (game_num.nextval, 'ë°°ê·¸', TO_DATE('2021/09/24 ', 'YYYY/MM/DD '), 'duo', 'dou', 18000, 'good', 18, 'www.bg.com', 'www.youtube.com/2312eqeqw');

/*  ê²Œì„ ?‹œ?Š¤?…œ ?š”êµ? ?‚¬?•­
    gnum = ê²Œì„ ?‹ë³? ë²ˆí˜¸(?™¸?˜?‚¤)
    ?š´?˜ì²´ì œ
    ?”„ë¡œì„¸?„œ
    ë©”ëª¨ë¦?
    ê·¸ë˜?”½
    DirectX
    ???¥ê³µê°„
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

/*  ?‚¬?š©? ?…Œ?´ë¸?
    cnum = ?‚¬?š©? ?‹ë³? ë²ˆí˜¸
    cid = ?•„?´?””
    email = ?´ë©”ì¼
    password = ë¹„ë?ë²ˆí˜¸
    nickname = ?‹‰?„¤?„
    cadmin = ê´?ë¦¬ì ?—¬ë¶?(0 = ?¼ë°? ?‚¬?š©?)
*/

CREATE SEQUENCE consumer_num INCREMENT BY 1 START WITH 1;
CREATE TABLE consumer (
    cnum NUMBER,
    cid VARCHAR2(20) PRIMARY KEY,
    email VARCHAR2(100) NOT NULL,
    password VARCHAR2(20) NOT NULL,
    nickname VARCHAR(20) NOT NULL UNIQUE,
    cadmin NUMBER(3) DEFAULT 0
   );
   
commit;   
ALTER TABLE consumer MODIFY password VARCHAR2(100);
ALTER TABLE consumer ADD(userregdate DATE Default sysdate NOT NULL,userupdatedate DATE Default sysdate NOT NULL);
ALTER TABLE consumer ADD UNIQUE(userphone);
INSERT INTO consumer(cnum, cid, email, password, nickname, cadmin) 
    VALUES(consumer_num.nextval,'kjw011231', 'kjw0111231@gmail.com', 'rlawldn', 'ê¹?ì§??š°', 1);
INSERT INTO consumer(cnum, cid, email, password, nickname, cadmin) 
    VALUES(consumer_num.nextval,'cho', 'chocc', 'aaa', 'cho', 0);
 
SELECT * FROM consumer; 
SELECT * FROM consumer_auth;
CREATE TABLE authorities(
cnum NUMBER ,
cid VARCHAR2(20) NOT NULL,
auth varchar2(50) not null,
constraint fk_authorities_users foreign key(cnum) references consumer(cnum));


CREATE TABLE consumer_auth(
    cid VARCHAR2(20) NOT NULL,
    auth varchar2(50) not null,
    constraint fk_consumer_auth foreign key(cid) references consumer(cid)
);
/* ??™ ë¡œê·¸?¸ */
CREATE TABLE persistent_logins(
    username VARCHAR(64) NOT NULL,
    series VARCHAR(64) PRIMARY KEY,
    token VARCHAR(64) NOT NULL,
    last_used TIMESTAMP NOT NULL
);
/*
 alter table authorities drop constraint fk_authorities_users;
create unique index ix_auth_cid on authorities (cid, auth);
*/
insert into consumer (cnum,cid,password,email,nickname,cadmin) values (consumer_num.nextval,'user00','pw00','ssos@sos','scho',0);
insert into consumer (cnum,cid,password,email,nickname,cadmin) values (consumer_num.nextval,'member00','pw00','m@sos','mcho',0);
insert into consumer (cnum,cid,password,email,nickname,cadmin) values (consumer_num.nextval,'admin00','pw00','assos@sos','ascho',0);
insert into authorities (cnum,cid,authority) values(502,'user00','ROLE_USER');
insert into authorities (cnum,cid,authority) values(503,'member00','ROLE_MANAGER');
insert into authorities (cnum,cid,authority) values(504,'admin00','ROLE_MANAGER');
insert into authorities (cnum,cid,authority) values(504,'admin00','ROLE_ADMIN');
commit;

/* ?œ ??ë°©ëª…ë¡? (ê°? ê°œì¸ ?ƒ?ƒœì°½ì— ë³´ì„)*/
DROP TABLE userreply_tbl;
CREATE table userreply_tbl(
    rno number(10,0),
    cnum number(10,0) not null,
    reply varchar2(1000) not null,
    nickname varchar2(20) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
    );
    
    create sequence userreply_num;
    
    alter table userreply_tbl add constraint pk_reply1 primary key(rno);
    
    alter table userreply_tbl add constraint fk_ureply 
    foreign key (cnum) references consumer(cnum) ON DELETE CASCADE;
 alter table userreply_tbl add constraint fk_ureply1 
    foreign key (nickname) references consumer(nickname) ON DELETE CASCADE;
    ALTER TABLE userreply_tbl RENAME COLUMN replyDate to ureplydate;
    ALTER TABLE userreply_tbl RENAME COLUMN updateDate to uupdatedate;
  
    /*?”„ë¡œí•„ ? „?š© db*/
CREATE TABLE img_tbl(
user_no varchar2(100) not null,
uploadPath varchar2(200) not null,
fileName varchar2(100) not null,
filetype char(1) default'I',
cnum number(10,0)
);
drop table img_tbl;
alter table img_tbl add constraint pk_img primary key ( user_no);
alter table img_tbl add constraint fk_user_img foreign key (cnum)
references consumer(cnum);
    
    
    
/*  ?‚¬ì§? ?…Œ?´ë¸?
    ?‹œê°?
    ?™¸?˜?‚¤
    ë²ˆí˜¸
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

/*  ?‚¬?š©? ?¼?´ë¸ŒëŸ¬ë¦?
    ?‚¬?š©? ?´ë©”ì¼
    ê²Œì„ ?‹ë³? ë²ˆí˜¸
*/
CREATE SEQUENCE consumerlibrary_num;
CREATE TABLE consumerLibrary (
    ubnum number PRIMARY KEY,
    cid VARCHAR2(100),
    gnum NUMBER,
    CONSTRAINT fk_consumerlibrarycid FOREIGN KEY (cid)
    REFERENCES consumer(cid),
    CONSTRAINT fk_consumerlibrarygnum FOREIGN KEY (gnum)
    REFERENCES game(gnum)
);

/*  ê²Œì„ ?ƒœê·? ?…Œ?´ë¸?
    ?ƒœê·? ?‹ë³? ë²ˆí˜¸
    gnum = ê²Œì„ ?‹ë³? ë²ˆí˜¸(?™¸?˜?‚¤)
    tag = ?ƒœê·?
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
INSERT INTO gametag VALUES(gametag_num.nextval, 'ë¡¤ì? ???›Œ ê¹¨ëŠ” ê²Œì„?´?•¼', 6);
select * from gametag a left join game b using (gnum);

/*  ê²Œì„ ë¦¬ë·° ?…Œ?´ë¸?
    grnum = ë¦¬ë·° ?‹ë³? ë²ˆí˜¸
    gnum = ê²Œì„ ?‹ë³? ë²ˆí˜¸(?™¸?˜?‚¤)
    grlike = ì¢‹ì•„?š”, ?‹«?–´?š”
    grtitle = ? œëª?
    grcontent = ë³¸ë¬¸
    grrecommend = ?‰ê°? ì¶”ì²œ ?ˆ˜
    grdate = ?‘?„±?¼
*/
CREATE SEQUENCE gamereview_num;
CREATE TABLE gameReview (
    grnum NUMBER PRIMARY KEY,
    gnum NUMBER NOT NULL,
    cid VARCHAR2(20) NOT NULL,
    grlike NUMBER(3) NOT NULL,
    grcontent VARCHAR2(2000) NOT NULL,
    grrecommend NUMBER DEFAULT 0,
    grdate DATE DEFAULT sysdate,
    CONSTRAINT fk_gamereviewgnum FOREIGN KEY(gnum) 
    REFERENCES game(gnum),
    CONSTRAINT fk_gamereviewcid FOREIGN KEY(cid) 
    REFERENCES consumer(cid)
);

/*  ë¦¬ë·° ì¢‹ì•„?š” ?…Œ?´ë¸?
    rlnum = ì¢‹ì•„?š” ?‹ë³? ë²ˆí˜¸
    grnum = ê²Œì„ ë¦¬ë·° ë²ˆí˜¸
    cid = ?‚¬?š©? ?•„?´?””
*/
CREATE SEQUENCE reviewlike_num;
CREATE TABLE reviewLike (
    rlnum NUMBER PRIMARY KEY,
    grnum NUMBER NOT NULL,
    cid VARCHAR2(20) NOT NULL,
    CONSTRAINT fk_reviewlikegrnum FOREIGN KEY(grnum)
    REFERENCES gameReview(grnum),
    CONSTRAINT fk_reviewlikecid FOREIGN KEY(cid)
    REFERENCES consumer(cid)
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
    CONSTRAINT fk_reviewcommentgrnum FOREIGN KEY(grnum) 
    REFERENCES gamereview(grnum),
    CONSTRAINT fk_reviewCommentcid FOREIGN KEY(cid) 
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
    fnum NUMBER,
    follower VARCHAR2(20) NOT NULL,
    following VARCHAR2(20) NOT NULL,/* ë¡œê·¸?¸ ê³„ì • */
    CONSTRAINT fk_friends FOREIGN KEY(following) REFERENCES consumer(cid)
);
ALTER TABLE friends ADD CONSTRAINT pk_friends PRIMARY KEY(follower, following);
ALTER TABLE friends ADD (fornot NUMBER DEFAULT 1); /* ì»¬ëŸ¼ ì¶”ê? */

/*  ?ƒ?ƒœê¸? ?…Œ?´ë¸?
    ?ƒ?ƒœê¸? ?‹ë³? ë²ˆí˜¸(ê¸°ë³¸?‚¤)
    ?´ë©”ì¼(?™¸?˜?‚¤)
    ?ƒ?ƒœê¸? ?‘?„±?¼
*/
CREATE SEQUENCE statuscomment_num;
CREATE TABLE statuscomment(
    snum NUMBER PRIMARY KEY,
    sid VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_statuscomment FOREIGN KEY(sid) REFERENCES consumer(cid),
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
    qnum NUMBER,
    qtype VARCHAR(50) NOT NULL,
    qtitle VARCHAR2(50) NOT NULL,
    qcontent VARCHAR2(1000) NOT NULL,
    qwriter VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_question FOREIGN KEY(qwriter) REFERENCES consumer(cid),
    qdate DATE DEFAULT SYSDATE
);
ALTER TABLE question ADD CONSTRAINT pk_question PRIMARY KEY(qnum);
ALTER TABLE question ADD (aornot NUMBER DEFAULT 0); /* ì»¬ëŸ¼ ì¶”ê? */
UPDATE question SET aornot = (SELECT count(anum) FROM answer WHERE answer.qnum = question.qnum); /* ë°˜ì˜ */

/*  Answer ?…Œ?´ë¸?
    ê¸? ?‹ë³? ë²ˆí˜¸(ê¸°ë³¸?‚¤)
    ì§ˆë¬¸ê¸? ?‹ë³? ë²ˆí˜¸(?™¸?˜?‚¤)
    ë³¸ë¬¸
    ?‹µë³? ?‚ ì§?
*/
CREATE SEQUENCE answer_num;
CREATE TABLE answer (
    anum NUMBER,
    qnum NUMBER NOT NULL,
    CONSTRAINT fk_answer FOREIGN KEY(qnum) REFERENCES question(qnum),
    acontent VARCHAR2(1000) NOT NULL,
    adate DATE DEFAULT SYSDATE
);
ALTER TABLE answer ADD CONSTRAINT pk_answer PRIMARY KEY(anum);

/*  ?‚¬?š©? ê²°ì œ ?‚´?—­
    ê²Œì„ ?´ë¦?
    ê²Œì„ ê°?ê²?
    ê²°ì œ ?‹ë³? ?•„?´?””
*/
CREATE TABLE consumerPayment (
    gname VARCHAR2(100) NOT NULL,
    gprice VARCHAR2(20) NOT NULL,
    cid VARCHAR2(20) NOT NULL,
    cpdate DATE DEFAULT sysdate,
    merchant_uid VARCHAR2(100) PRIMARY KEY,
    CONSTRAINT fk_consumerpayment FOREIGN KEY (cid) REFERENCES consumer(cid)
);
commit;

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
    CONSTRAINT fk_gamewishlistcid FOREIGN KEY(cid)REFERENCES consumer(cid),
    CONSTRAINT fk_gamewishlistgnum FOREIGN KEY(gnum)REFERENCES game(gnum)
);

/*  ?¥ë°”êµ¬?‹ˆ
    ?¥ë°”êµ¬?‹ˆ ë²ˆí˜¸
    ?‚¬?š©? ?´ë©”ì¼
    ê²Œì„ ?‹ë³? ë²ˆí˜¸
*/
CREATE SEQUENCE shoppingbasket_num;
CREATE TABLE shoppingBasket (
    sbnum NUMBER PRIMARY KEY,
    cid VARCHAR2(20) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINT fk_shoppingbasketcid FOREIGN KEY(cid)REFERENCES consumer(cid),
    CONSTRAINT fk_shoppingbasketgnum FOREIGN KEY(gnum)REFERENCES game(gnum)

);
