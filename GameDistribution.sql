
/*  λ―Έμ?± ??΄λΈ?

    consumerPicture
    gamePicture
    consumerPayment
*/

alter table consumerlibrary drop constraint fk_consumerlibrarygnum;
alter table consumerlibrary add constraint fk_consumerlibrarygnum 
    foreign key (gnum) references game(gnum) ON DELETE CASCADE;
    
alter table gamereview drop constraint fk_gamereviewgnum;
alter table gamereview add constraint fk_gamereviewgnum 
    foreign key (gnum) references game(gnum) ON DELETE CASCADE;

alter table shoppingBasket drop constraint fk_shoppingbasketgnum;
alter table shoppingBasket add constraint fk_shoppingbasketgnum 
    foreign key (gnum) references game(gnum) ON DELETE CASCADE;

alter table gameTag drop constraint fk_gametag;
alter table gameTag add constraint fk_gametag 
    foreign key (gnum) references game(gnum) ON DELETE CASCADE;
    
alter table gameRequirement drop constraint fk_gameRequirement;
alter table gameRequirement add constraint fk_gameRequirement 
    foreign key (gnum) references game(gnum) ON DELETE CASCADE;

alter table reviewComment drop constraint fk_reviewcommentgrnum;
alter table reviewComment add constraint fk_reviewcommentgrnum 
    foreign key (grnum) references gamereview(grnum) ON DELETE CASCADE;
    
alter table reviewLike drop constraint fk_reviewlikegrnum;
alter table reviewLike add constraint fk_reviewlikegrnum 
    foreign key (grnum) references gameReview(grnum) ON DELETE CASCADE;

/*  κ²μ ??΄λΈ?
    gnum = κ²μ ?λ³? λ²νΈ
    κ²μ ? λͺ?
    κ²μ μΆμ?Ό
    κ°λ°?¬
    λ°°κΈ?¬
    ?κ·?
    κ°?κ²?
    ?€λͺ?
    ?±κΈ?
    κ²μ ?¬?΄?Έ
    ??? μ£Όμ

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
VALUES (game_num.nextval, 'λ°°κ·Έ', TO_DATE('2021/09/24 ', 'YYYY/MM/DD '), 'duo', 'dou', 18000, 'good', 18, 'www.bg.com', 'www.youtube.com/2312eqeqw');


/*  κ²μ ??€? ?κ΅? ?¬?­
    gnum = κ²μ ?λ³? λ²νΈ(?Έ??€)
    ?΄?μ²΄μ 
    ?λ‘μΈ?
    λ©λͺ¨λ¦?
    κ·Έλ?½
    DirectX
    ???₯κ³΅κ°

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


/*  ?¬?©? ??΄λΈ?
    cnum = ?¬?©? ?λ³? λ²νΈ
    cid = ??΄?
    email = ?΄λ©μΌ
    password = λΉλ?λ²νΈ
    nickname = ??€?
    cadmin = κ΄?λ¦¬μ ?¬λΆ?(0 = ?Όλ°? ?¬?©?)

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
ALTER TABLE consumer ADD(user_key VARCHAR(100)DEFAULT 'N');

commit;   

ALTER TABLE consumer MODIFY password VARCHAR2(100);
ALTER TABLE consumer ADD(userregdate DATE Default sysdate NOT NULL,userupdatedate DATE Default sysdate NOT NULL);
ALTER TABLE consumer ADD UNIQUE(userphone);
 

SELECT * FROM consumer; 
SELECT * FROM consumer_auth;

   
INSERT INTO consumer(cnum, cid, email, password, nickname, cadmin) 
    VALUES(consumer_num.nextval,'cho', 'chocc', 'aaa', 'cho', 0);
 
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


/* ?? λ‘κ·Έ?Έ */

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

/* ? ??λ°©λͺλ‘? (κ°? κ°μΈ ??μ°½μ λ³΄μ)*/

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
  

    /*?λ‘ν ? ?© db*/

CREATE TABLE img_tbl(
user_no varchar2(100) not null,
uploadPath varchar2(200) not null,
fileName varchar2(100) not null,
filetype char(1) default'I',
cnum number(10,0)
);

alter table img_tbl add constraint pk_img primary key (user_no);
alter table img_tbl add constraint fk_user_img foreign key (cnum)
references consumer(cnum);
    
    
    

/*  ?¬μ§? ??΄λΈ?
    ?κ°?
    ?Έ??€

    λ²νΈ
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


/*  ?¬?©? ?Ό?΄λΈλ¬λ¦?
    ?¬?©? ?΄λ©μΌ
    κ²μ ?λ³? λ²νΈ

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


/*  κ²μ ?κ·? ??΄λΈ?
    ?κ·? ?λ³? λ²νΈ
    gnum = κ²μ ?λ³? λ²νΈ(?Έ??€)
    tag = ?κ·?

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

INSERT INTO gametag VALUES(gametag_num.nextval, 'λ‘€μ? ??? κΉ¨λ κ²μ?΄?Ό', 6);
select * from gametag a left join game b using (gnum);

/*  κ²μ λ¦¬λ·° ??΄λΈ?
    grnum = λ¦¬λ·° ?λ³? λ²νΈ
    gnum = κ²μ ?λ³? λ²νΈ(?Έ??€)
    grlike = μ’μ?, ?«?΄?
    grtitle = ? λͺ?
    grcontent = λ³Έλ¬Έ
    grrecommend = ?κ°? μΆμ² ?
    grdate = ??±?Ό

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

/*  λ¦¬λ·° μ’μ? ??΄λΈ?
    rlnum = μ’μ? ?λ³? λ²νΈ
    grnum = κ²μ λ¦¬λ·° λ²νΈ
    cid = ?¬?©? ??΄?

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


/*  λ¦¬λ·° ?κΈ? ??΄λΈ?
    rcnum = ?κΈ? ?λ³? λ²νΈ
    grnum = λ¦¬λ·° ?λ³? λ²νΈ(?Έ??€)
    rccontent = ?κΈ? λ³Έλ¬Έ
    rcdate = ??±?Ό

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


/*  μΉκ΅¬ ??΄λΈ?
    μΉκ΅¬ ?λ³? λ²νΈ(κΈ°λ³Έ?€)
    μΉκ΅¬ ?΄λ©μΌ
    λ³ΈμΈ ?΄λ©μΌ(?Έ??€)
    ?λ‘μ(λ³ΈμΈ?΄ ?€λ₯Έμ¬??)
    ?λ‘μ(?€λ₯Έμ¬??΄ λ³ΈμΈ?)

*/
CREATE SEQUENCE friends_num;
CREATE TABLE friends (
    fnum NUMBER,
    follower VARCHAR2(20) NOT NULL,

    following VARCHAR2(20) NOT NULL,/* λ‘κ·Έ?Έ κ³μ  */
    CONSTRAINT fk_friends FOREIGN KEY(following) REFERENCES consumer(cid)
);
ALTER TABLE friends ADD CONSTRAINT pk_friends PRIMARY KEY(follower, following);
ALTER TABLE friends ADD (fornot NUMBER DEFAULT 1); /* μ»¬λΌ μΆκ? */

/*  ??κΈ? ??΄λΈ?
    ??κΈ? ?λ³? λ²νΈ(κΈ°λ³Έ?€)
    ?΄λ©μΌ(?Έ??€)
    ??κΈ? ??±?Ό

*/
CREATE SEQUENCE statuscomment_num;
CREATE TABLE statuscomment(
    snum NUMBER PRIMARY KEY,
    sid VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_statuscomment FOREIGN KEY(sid) REFERENCES consumer(cid),
    sdate DATE DEFAULT SYSDATE
);

<
/*  Question ??΄λΈ?
    κΈ? ?λ³? λ²νΈ(κΈ°λ³Έ?€)
    ? λͺ?
    λ³Έλ¬Έ
    κΈ??΄?΄(?Έ??€)
    μ§λ¬Έ ? μ§?

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

ALTER TABLE question ADD (aornot NUMBER DEFAULT 0); /* μ»¬λΌ μΆκ? */
UPDATE question SET aornot = (SELECT count(anum) FROM answer WHERE answer.qnum = question.qnum); /* λ°μ */

/*  Answer ??΄λΈ?
    κΈ? ?λ³? λ²νΈ(κΈ°λ³Έ?€)
    μ§λ¬ΈκΈ? ?λ³? λ²νΈ(?Έ??€)
    λ³Έλ¬Έ
    ?΅λ³? ? μ§?

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

/*  ?¬?©? κ²°μ  ?΄?­
    κ²μ ?΄λ¦?
    κ²μ κ°?κ²?
    κ²°μ  ?λ³? ??΄?

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

/*  ?¬?©? μ°? λͺ©λ‘
    μ°? ?λ³? λ²νΈ
    ?¬?©? ?΄λ©μΌ
    κ²μ ?λ³? λ²νΈ

*/
CREATE SEQUENCE gamewishlist_num;
CREATE TABLE gameWishlist (
    wishnum NUMBER PRIMARY KEY,
    cid VARCHAR2(20) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINT fk_gamewishlistcid FOREIGN KEY(cid)REFERENCES consumer(cid),
    CONSTRAINT fk_gamewishlistgnum FOREIGN KEY(gnum)REFERENCES game(gnum)
);

/*  ?₯λ°κ΅¬?
    ?₯λ°κ΅¬? λ²νΈ
    ?¬?©? ?΄λ©μΌ
    κ²μ ?λ³? λ²νΈ

*/
CREATE SEQUENCE shoppingbasket_num;
CREATE TABLE shoppingBasket (
    sbnum NUMBER PRIMARY KEY,
    cid VARCHAR2(20) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINT fk_shoppingbasketcid FOREIGN KEY(cid)REFERENCES consumer(cid),
    CONSTRAINT fk_shoppingbasketgnum FOREIGN KEY(gnum)REFERENCES game(gnum)

);
