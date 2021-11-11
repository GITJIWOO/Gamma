/*  미완?�� ?��?���?
    consumerPicture
    gamePicture
    consumerPayment
*/

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
    gpicture VARCHAR2(100) NOT NULL,
    gcontent VARCHAR2(1000) NOT NULL,
    ggrade NUMBER(4) NOT NULL,
    gsite VARCHAR2(100) NOT NULL,
    gaddress VARCHAR2(1000) NOT NULL
);
SELECT * FROM game;
INSERT INTO game 
VALUES (game_num.nextval, '배그', TO_DATE('2021/09/24 ', 'YYYY/MM/DD '), 'duo', 'dou', 18000, 'good', 18, 'www.bg.com', 'www.youtube.com/2312eqeqw');

/*  게임 ?��?��?�� ?���? ?��?��
    gnum = 게임 ?���? 번호(?��?��?��)
    ?��?��체제
    ?��로세?��
    메모�?
    그래?��
    DirectX
    ???��공간
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

/*  ?��?��?�� ?��?���?
    cnum = ?��?��?�� ?���? 번호
    cid = ?��?��?��
    email = ?��메일
    password = 비�?번호
    nickname = ?��?��?��
    cadmin = �?리자 ?���?(0 = ?���? ?��?��?��)
*/

CREATE SEQUENCE consumer_num INCREMENT BY 1 START WITH 1;
CREATE TABLE consumer (
    cnum NUMBER,
    cid VARCHAR2(20) PRIMARY KEY,
    email VARCHAR2(100) NOT NULL,
    password VARCHAR2(100) NOT NULL,
    nickname VARCHAR(20) NOT NULL UNIQUE,
    cadmin NUMBER(3) DEFAULT 0
   );
   
commit;
ALTER TABLE consumer ADD(user_key VARCHAR(100)DEFAULT 'N');
ALTER TABLE consumer MODIFY password VARCHAR2(100);
ALTER TABLE consumer ADD(userregdate DATE Default sysdate NOT NULL,userupdatedate DATE Default sysdate NOT NULL);
ALTER TABLE consumer ADD UNIQUE(userphone);
INSERT INTO consumer(cnum, cid, email, password, nickname, cadmin) 
    VALUES(consumer_num.nextval,'kjw011231', 'kjw0111231@gmail.com', 'rlawldn', '�?�??��', 1);
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
/* ?��?�� 로그?�� */
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

/* ?��??방명�? (�? 개인 ?��?��창에 보임)*/
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
  
    /*?��로필 ?��?�� db*/
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
    
    
    
/*  ?���? ?��?���?
    ?���?
    ?��?��?��
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

/*  ?��?��?�� ?��?��브러�?
    ?��?��?�� ?��메일
    게임 ?���? 번호
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

/*  게임 ?���? ?��?���?
    ?���? ?���? 번호
    gnum = 게임 ?���? 번호(?��?��?��)
    tag = ?���?
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
INSERT INTO gametag VALUES(gametag_num.nextval, '롤�? ???�� 깨는 게임?��?��', 6);
select * from gametag a left join game b using (gnum);

/*  게임 리뷰 ?��?���?
    grnum = 리뷰 ?���? 번호
    gnum = 게임 ?���? 번호(?��?��?��)
    grlike = 좋아?��, ?��?��?��
    grtitle = ?���?
    grcontent = 본문
    grrecommend = ?���? 추천 ?��
    grdate = ?��?��?��
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

/*  리뷰 좋아?�� ?��?���?
    rlnum = 좋아?�� ?���? 번호
    grnum = 게임 리뷰 번호
    cid = ?��?��?�� ?��?��?��
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
    CONSTRAINT fk_reviewcommentgrnum FOREIGN KEY(grnum) 
    REFERENCES gamereview(grnum),
    CONSTRAINT fk_reviewCommentcid FOREIGN KEY(cid) 
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
    fnum NUMBER,
    follower VARCHAR2(20) NOT NULL,
    following VARCHAR2(20) NOT NULL,/* 로그?�� 계정 */
    CONSTRAINT fk_friends FOREIGN KEY(following) REFERENCES consumer(cid)
);
ALTER TABLE friends ADD CONSTRAINT pk_friends PRIMARY KEY(follower, following);
ALTER TABLE friends ADD (fornot NUMBER DEFAULT 1); /* 컬럼 추�? */

/*  ?��?���? ?��?���?
    ?��?���? ?���? 번호(기본?��)
    ?��메일(?��?��?��)
    ?��?���? ?��?��?��
*/
CREATE SEQUENCE statuscomment_num;
CREATE TABLE statuscomment(
    snum NUMBER PRIMARY KEY,
    sid VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_statuscomment FOREIGN KEY(sid) REFERENCES consumer(cid),
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
    qnum NUMBER,
    qtype VARCHAR(50) NOT NULL,
    qtitle VARCHAR2(100) NOT NULL,
    qcontent VARCHAR2(1000) NOT NULL,
    qwriter VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_question FOREIGN KEY(qwriter) REFERENCES consumer(cid),
    qdate DATE DEFAULT SYSDATE
);
ALTER TABLE question ADD CONSTRAINT pk_question PRIMARY KEY(qnum);
ALTER TABLE question ADD (aornot NUMBER DEFAULT 0); /* 컬럼 추�? */
UPDATE question SET aornot = (SELECT count(anum) FROM answer WHERE answer.qnum = question.qnum); /* 반영 */

/*  Answer ?��?���?
    �? ?���? 번호(기본?��)
    질문�? ?���? 번호(?��?��?��)
    본문
    ?���? ?���?
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

/*  ?��?��?�� 결제 ?��?��
    게임 ?���?
    게임 �?�?
    결제 ?���? ?��?��?��
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
    CONSTRAINT fk_gamewishlistcid FOREIGN KEY(cid)REFERENCES consumer(cid),
    CONSTRAINT fk_gamewishlistgnum FOREIGN KEY(gnum)REFERENCES game(gnum)
);

/*  ?��바구?��
    ?��바구?�� 번호
    ?��?��?�� ?��메일
    게임 ?���? 번호
*/
CREATE SEQUENCE shoppingbasket_num;
CREATE TABLE shoppingBasket (
    sbnum NUMBER PRIMARY KEY,
    cid VARCHAR2(20) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINT fk_shoppingbasketcid FOREIGN KEY(cid)REFERENCES consumer(cid),
    CONSTRAINT fk_shoppingbasketgnum FOREIGN KEY(gnum)REFERENCES game(gnum)

);
