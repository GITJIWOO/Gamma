/*  ���� ���̺�
    gnum = ���� �ĺ� ��ȣ
    ���� ����
    ���� �����
    ���߻�
    ��޻�
    �±�
    ����
    ����
    ���
    ���� ����Ʈ
    ������ �ּ�
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

/*  ���� �ý��� �䱸 ����
    gnum = ���� �ĺ� ��ȣ(�ܷ�Ű)
    �ü��
    ���μ���
    �޸�
    �׷���
    DirectX
    �������
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

/*  ����� ���̺�
    email = �̸���
    password = ��й�ȣ
    google_login_yn	= ���� �α���

*/
CREATE TABLE user (
    email VARCHAR2(100) PRIMARY KEY,
    password VARCHAR2(20) NOT NULL,
    nick_name VARCHAR(20) NOT NULL
);


/*  ���� ���̺�
    �ð�
    ��ȣ
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

/*  ����� ���̺귯��
    ����� �̸���
    ���� �ĺ� ��ȣ
*/
CREATE TABLE userLibrary (
    ubnum number PRIMARY KEY,
    email VARCHAR2(100),
    gnum NUMBER,
    CONSTRAINT fk_userlibrary FOREIGN KEY (email)
    REFERENCES user(email)
);

/*  ���� �α���
    ���̵�
    ���� �̸���
    
    >> user table�� ���� �α��� ���̺� �ø��� �ߺ��Ǿ� �и� �� ������ ������ (���� id = �̸���, ���� �̸��� = �̸���)
    , �и��� ���߿� ȥ���� �� �� ����
    
    ��, �������̺� ���� �α��� col �� �߰��Ͽ�, ���� �α��� ����, Ȩ������ ȸ������ �� ���� ������ �ʿ� �ϱ⿡ user ���̺� google_login �÷��� �߰� ��.
    
CREATE TABLE socialuser(
    
);
*/
/*  ���� �±� ���̺�
    �±� �ĺ� ��ȣ
    gnum = ���� �ĺ� ��ȣ(�ܷ�Ű)
    tag = �±�
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

/*  ���� ���� ���̺�
    grnum = ���� �ĺ� ��ȣ
    gnum = ���� �ĺ� ��ȣ(�ܷ�Ű)
    grlike = ���ƿ�, �Ⱦ��
    grtitle = ����
    grcontent = ����
    grrecomment = �� ��õ ��
    grdate = �ۼ���
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

/*  ���� ��� ���̺�
    rcnum = ��� �ĺ� ��ȣ
    grnum = ���� �ĺ� ��ȣ(�ܷ�Ű)
    rccontent = ��� ����
    rcdate = �ۼ���
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

/*  ģ�� ���̺�
    ģ�� �ĺ� ��ȣ(�⺻Ű)
    ģ�� �̸���
    ���� �̸���(�ܷ�Ű)
    �ȷ���(������ �ٸ������)
    �ȷο�(�ٸ������ ������)
*/
CREATE SEQUENCE friends_num;
CREATE TABLE friends (
    fnum NUMBER PRIMARY KEY,
    follower VARCHAR2(30) NOT NULL,
    following VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_friends FOREIGN KEY(following) REFERENCES join_user(email)
);

/*  ���±� ���̺�
    ���±� �ĺ� ��ȣ(�⺻Ű)
    �̸���(�ܷ�Ű)
    ���±� �ۼ���
*/
CREATE SEQUENCE statuscomment_num;
CREATE TABLE statuscomment(
    snum NUMBER PRIMARY KEY,
    semail VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_statuscomment FOREIGN KEY(semail) REFERENCES join_user(email),
    sdate DATE DEFAULT SYSDATE
);

/*  Question ���̺�
    �� �ĺ� ��ȣ(�⺻Ű)
    ����
    ����
    �۾���(�ܷ�Ű)
    ���� ��¥
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

/*  Answer ���̺�
    �� �ĺ� ��ȣ(�⺻Ű)
    ������ �ĺ� ��ȣ(�ܷ�Ű)
    ����
    �亯 ��¥
*/
CREATE SEQUENCE answer_num;
CREATE TABLE answer (
    anum NUMBER PRIMARY KEY,
    qnanum NUMBER NOT NULL,
    CONSTRAINT fk_answer FOREIGN KEY(qnanum) REFERENCES question(qnum),
    acontent VARCHAR2(1000) NOT NULL,
    adate DATE DEFAULT SYSDATE
);

/*  ����� ���� ����
    ���� ��ȣ
    ����� �̸���(�ܷ�Ű)
    ���� ��¥
    ���� �ݾ�
    ���� ���
    ���� ����
*/
CREATE TABLE userPayment (
    upnum NUMBER PRIMARY KEY,
    email VARCHAR2(100) PRIMARY KEY,
    upday DATE DEFAULT sysdate,
    upprice NUMBER(100) NOT NULL,
    upmethod ,
    
);

/*  ����� �� ���
    �� �ĺ� ��ȣ
    ����� �̸���
    ���� �ĺ� ��ȣ
*/
CREATE SEQUENCE gamewishlist_num;
CREATE TABLE gameWishlist (
    wishnum NUMBER PRIMARY KEY,
    email VARCHAR2(100) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINTS fk_gamewishlist FOREIGN KEY(email)REFERENCES join_user(email),
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
    email VARCHAR2(100) NOT NULL,
    gnum NUMBER NOT NULL,
    CONSTRAINTS fk_shoppingbasket FOREIGN KEY(email)REFERENCES join_user(email),
    CONSTRAINTS fk_shoppingbasket FOREIGN KEY(gnum)REFERENCES game(gnum)

);