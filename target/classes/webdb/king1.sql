1.Config(설정)
drop table Config;
drop sequence Config_seq;
create table Config(
   c_no number primary Key,
   c_type varchar2(20),
   c_gubun varchar2(50),
   c_title nvarchar2(50),
   c_state number
);

select * from config
create sequence Config_seq
start with 1
increment by 1
nocache
nocycle;

insert into Config(c_no,c_type,c_gubun,c_title,c_state) values(Config_seq.nextval,'complete','meatdiet','육류',0);
insert into Config(c_no,c_type,c_gubun,c_title,c_state) values(Config_seq.nextval,'complete','vegan','채식',0);
insert into Config(c_no,c_type,c_gubun,c_title,c_state) values(Config_seq.nextval,'complete','primium','프리미엄',0);
insert into Config(c_no,c_type,c_gubun,c_title,c_state) values(Config_seq.nextval,'side','sidedish','반찬',0);
insert into Config(c_no,c_type,c_gubun,c_title,c_state) values(Config_seq.nextval,'side','drink','음료',0);
insert into Config(c_no,c_type,c_gubun,c_title,c_state) values(Config_seq.nextval,'side','bread','빵',0);
insert into Config(c_no,c_type,c_gubun,c_title,c_state) values(Config_seq.nextval,'mine','stew','국',0);
insert into Config(c_no,c_type,c_gubun,c_title,c_state) values(Config_seq.nextval,'mine','rice','밥',0);
insert into Config(c_no,c_type,c_gubun,c_title,c_state) values(Config_seq.nextval,'mine','kimch','김치',0);
insert into Config(c_no,c_type,c_gubun,c_title,c_state) values(Config_seq.nextval,'mine','meat','고기',0);
insert into Config(c_no,c_type,c_gubun,c_title,c_state) values(Config_seq.nextval,'mine','vegetable','야채',0);

2. Users(관리자,직원,회원)
drop table users;
create table Users(
   u_no number PRIMARY KEY,    
    u_id varchar2(12),
    u_pw varchar2(16),
    u_name nvarchar2(24),
    u_mail varchar2(50),
    u_hp varchar2(13),
    u_address varchar2(300),
    u_regdate date default sysdate,
    u_update date,
    u_grade char(2),
    u_state char(2)
);
insert into Users(u_no,u_id) values(Users_seq.nextval,'god')

drop sequence Users_seq
create sequence Users_seq
start with 1
increment by 1
nocache
nocycle;

insert into users(u_no, u_id, u_hp) values(users_seq.nextval,'vely1105','010-1234-1234');
insert into users(u_no, u_id, u_pw, u_name, u_regdate) values(users_seq.nextval,'root','1234','root',sysdate);
select * from users;

///////////////////// DB 다들 변경해주시길
ALTER TABLE USERS ADD(U_ADDRESS VARCHAR2(70));
alter table Users modify(u_address varchar2(300))
//////////////////// 문장 실행만 하면 되요 

3. News(공지)
create table News(
   n_no number primary KEY,
   u_no number,
   n_head nvarchar2(30), 
   n_title nvarchar2(150),
   n_content nclob,
   n_regdate date default sysdate,
   n_readcount number default 0,
   n_ref number,
   n_step number,
   n_level number,
   n_state number,
   constraint u_no_News_fk foreign key(u_no) references Users(u_no)
);
drop table News
drop sequence News_seq
create sequence News_seq
start with 1
increment by 1
nocache
nocycle;

insert into News
values(News_seq.nextval, 1, '공지', '공지사항입니다', '2018.09.04 드디어 수락간 오픈', sysdate, 0, News_seq.nextval, 0, 0, 0 );
insert into News
values(News_seq.nextval, 1, '이벤트', '이벤트입니다', '오픈기념 이벤트. 전 상품 오프로 할인 ', sysdate, 0, News_seq.nextval, 0, 0, 0 );

select a.*, u.u_name
from QnA a, Users u
where a.u_no=u.u_no and q_no = '3' 

select * from news

3. QnA(QnA)
select * from QnA
create table QnA(
   q_no number primary KEY,
   u_no number,
   q_head nvarchar2(30), 
   q_title nvarchar2(150),
   q_content nclob,
   q_regdate date default sysdate,
   q_readcount number default 0,
   q_ref number,
   q_step number,
   q_level number,
   q_state number,
   constraint u_no_QnA_fk foreign key(u_no) references Users(u_no)
);

select*from qna
where u_no='13';

select * from qna
order by q_no desc;

drop table QnA
drop sequence QnA_seq
create sequence QnA_seq
start with 1
increment by 1
nocache
nocycle;

4. Information(음식정보)
drop table information;
select * from information
create table Information(
	i_no number primary KEY,
	i_gubun number,
	i_menu varchar2(40),
	i_price number,
	i_kcal number,
	i_img varchar2(150),
	i_hit number,
	i_regdate date default sysdate,
	i_update date,
	i_state char(1);
);

ALTER TABLE information ADD(i_state char(1));

drop sequence information_seq;
create sequence Information_seq
start with 1
increment by 1
nocache
nocycle;

insert into information(i_no, i_gubun, i_menu, i_price, i_kcal, i_img, i_hit, i_regdate, i_update, i_state) 
values(0, 0, '나만의도시락', '0', '0', '', 0, sysdate, sysdate, 0);

insert into information(i_no, i_gubun, i_menu, i_price, i_kcal, i_img, i_hit, i_regdate, i_update) 
values(information_seq.nextval, 0, 'test', '7000', '200', 'test.png', 0, sysdate, sysdate);
select * from information;

insert into information(i_no, i_gubun, i_menu, i_price, i_kcal, i_img, i_hit, i_regdate, i_update) 
values(information_seq.nextval, 1, '호박새우탕', '7200', '400', 'fc73b910fdf5390282f02ed312195e4c.jpg', 0, sysdate, sysdate);
insert into information(i_no, i_gubun, i_menu, i_price, i_kcal, i_img, i_hit, i_regdate, i_update) 
values(information_seq.nextval, 1, '초계탕', '12600', '400', '0a17abb9450ccba2f1d51e080ee2101e.jpg', 0, sysdate, sysdate);
insert into information(i_no, i_gubun, i_menu, i_price, i_kcal, i_img, i_hit, i_regdate, i_update) 
values(information_seq.nextval, 1, '구수한 흑미현미 삼계탕', '12800', '500', 'f4577c1459679650d0554635d921b536.jpg', 0, sysdate, sysdate);
insert into information(i_no, i_gubun, i_menu, i_price, i_kcal, i_img, i_hit, i_regdate, i_update) 
values(information_seq.nextval, 1, '영양 들깨탕', '8050', '300', '814913ace5e859d477738bceab5264ea.jpg', 0, sysdate, sysdate);
insert into information(i_no, i_gubun, i_menu, i_price, i_kcal, i_img, i_hit, i_regdate, i_update) 
values(information_seq.nextval, 1, '백순두부탕', '7200', '400', 'fc73b910fdf5390282f02ed312195e4c.jpg', 0, sysdate, sysdate);
insert into information(i_no, i_gubun, i_menu, i_price, i_kcal, i_img, i_hit, i_regdate, i_update) 
values(information_seq.nextval, 2, '마늘쫑', '3150', '150', '365f6d9732ccfe0ec9991c5142318d73.jpg', 0, sysdate, sysdate);
insert into information(i_no, i_gubun, i_menu, i_price, i_kcal, i_img, i_hit, i_regdate, i_update) 
values(information_seq.nextval, 9, '열무김치', 7000, 161, '2c933be87ba32b76265cfb76691e780b.jpg', 0, sysdate, sysdate);
insert into information(i_no, i_gubun, i_menu, i_price, i_kcal, i_img, i_hit, i_regdate, i_update) 
values(information_seq.nextval, 10, '보쌈&간재미무침', 15000, 1200, '44205b1c2f533aa52da626f98fc5b113.jpg', 0, sysdate, sysdate);
insert into information(i_no, i_gubun, i_menu, i_price, i_kcal, i_img, i_hit, i_regdate, i_update) 
values(information_seq.nextval, 11, '두부조림', 4500, 860, 'b3b4a49298541def00166f6c4dcf9e35.jpg', 0, sysdate, sysdate);
insert into information(i_no, i_gubun, i_menu, i_price, i_kcal, i_img, i_hit, i_regdate, i_update) 
values(information_seq.nextval, 7, '소고기미역국', 6500, 162, '9f67778aefa3782ccb4ab35abb3b122b.jpg', 0, sysdate, sysdate);
insert into information(i_no, i_gubun, i_menu, i_price, i_kcal, i_img, i_hit, i_regdate, i_update) 
values(information_seq.nextval, 8, '호박죽', 5850, 272, '61013e2eb9edf997c6dc1d0c7d8ad9cb.jpg', 0, sysdate, sysdate);

select * from information;

4-1 Information_image(음식정보 이미지)
drop table information_image;
create table Information_Image(
   ii_no number primary key,
   i_no number,
   ii_image varchar2(100),
   ii_state number,
   constraint i_no_Information_Image_fk foreign key(i_no) references Information(i_no)
);

drop sequence information_image_seq;
create sequence Information_image_seq
start with 1
increment by 1
nocache
nocycle;

insert into Information_Image(ii_no, i_no, ii_image, ii_state)
values(Information_image_seq.nextval, 1, 'test.png', 0);
insert into Information_Image(ii_no, i_no, ii_image, ii_state)
values(Information_image_seq.nextval, 1, 'test2.jpg', 0);
//////////////////////////
insert into Information_Image(ii_no, i_no, ii_image, ii_state)
values(Information_image_seq.nextval, 1, 'detail1.jpg', 1);
insert into Information_Image(ii_no, i_no, ii_image, ii_state)
values(Information_image_seq.nextval, 1, 'detail2.jpg', 1);
insert into Information_Image(ii_no, i_no, ii_image, ii_state)
values(Information_image_seq.nextval, 1, 'detail3.jpg', 1);
insert into Information_Image(ii_no, i_no, ii_image, ii_state)
values(Information_image_seq.nextval, 1, 'detail4.jpg', 1);
insert into Information_Image(ii_no, i_no, ii_image, ii_state)
values(Information_image_seq.nextval, 1, 'detail5.jpg', 1);

select * from information_image;


5. Information_Comment(음식정보 후기)
drop table information_comment;
create table Information_Comment(
	ic_no number primary KEY,
	i_no number,
	u_no number,
	ic_star number,
	ic_content nclob,
	ic_regdate date default sysdate,
	ic_state number,
	constraint i_no_Information_Comment_fk foreign key(i_no) references Information(i_no),
	constraint u_no_Information_Comment_fk foreign key(u_no) references Users(u_no)
);

drop sequence Information_Comment_seq	
create sequence Information_Comment_seq
start with 1
increment by 1
nocache
nocycle;

drop table cart_list
drop sequence cart_list_seq
select * from cart_list
cart_list(장바구니)
create table cart_list(
   cl_no number primary KEY,
   u_no number,
   cl_img varchar2(150),
   cl_menu varchar2(60),
   cl_price number,
   cl_quantity number,
   cl_totalprice number,
   cl_day date,
   cl_when varchar2(10),
   cl_gubun number,
   cl_regdate date default sysdate,
   constraint u_no_cart_list_fk foreign key(u_no) references Users(u_no)
);

create sequence cart_list_seq
start with 1
increment by 1
nocache
nocycle;


6. Oder(주문)
o_state : 0 입금전, 1 입금후
create table Oder(
	o_no number primary KEY,
	o_name varchar2(50),
	u_no number,
	o_date date default sysdate,
	o_total number,
	o_state number, 
	o_bank varchar2(50),
	constraint u_no_Oder_fk foreign key(u_no) references Users(u_no)
);
ALTER TABLE oder ADD(o_bank VARCHAR2(50));

drop table Oder
drop sequence Oder_seq
create sequence Oder_seq
start with 1
increment by 1
nocache
nocycle;


7. Oder-menu(주문상품)
on_state : 0 수령전, 1 수령후
create table Oder_menu(
	on_no number primary KEY,
	i_no number,
	i_name varchar2(50),
	o_no number,
	on_cnt number,
	on_state number, 
	on_getdate date,
	on_time varchar2(10),
	constraint i_no_Oder_menu_fk foreign key(i_no) references Information(i_no),
	constraint o_no_Oder_menu_fk foreign key(o_no) references Oder(o_no)
);

drop table Oder_menu
drop sequence Oder_menu_seq
create sequence Oder_menu_seq
start with 1
increment by 1
nocache
nocycle;

insert into oder(o_no, o_name, u_no, o_date, o_total, o_state, o_bank) values(Oder_seq.nextval, '뭐뭐뭐外2', 81, sysdate, 39900, 0, '국민 12121212121212');
insert into oder_menu(on_no, i_no, i_name, o_no, on_cnt, on_state, on_getdate, on_time) values(Oder_menu_seq.nextval, 1, 'aaaa', 1, 2, 0, sysdate-10, '아침');
insert into oder_menu(on_no, i_no, i_name, o_no, on_cnt, on_state, on_getdate, on_time) values(Oder_menu_seq.nextval, 2, 'bbbb', 1, 1, 0, sysdate-8, '아침');
insert into oder_menu(on_no, i_no, i_name, o_no, on_cnt, on_state, on_getdate, on_time) values(Oder_menu_seq.nextval, 3, 'cccc', 2, 2, 0, sysdate-7, '아침');
insert into oder_menu(on_no, i_no, i_name, o_no, on_cnt, on_state, on_getdate, on_time) values(Oder_menu_seq.nextval, 4, 'dddd', 3, 2, 0, sysdate-5, '아침');
insert into oder_menu(on_no, i_no, i_name, o_no, on_cnt, on_state, on_getdate, on_time) values(Oder_menu_seq.nextval, 5, 'eeee', 10, 2, 0, sysdate, '아침');
insert into oder_menu(on_no, i_no, i_name, o_no, on_cnt, on_state, on_getdate, on_time) values(Oder_menu_seq.nextval, 0, '나만의도시락', 9, 2, 1, sysdate, '아침');
insert into lunchbox values(lunchbox_seq.nextval, 5, 14);
insert into lunchbox values(lunchbox_seq.nextval, 6, 14);
insert into lunchbox values(lunchbox_seq.nextval, 2, 14);
insert into lunchbox values(lunchbox_seq.nextval, 3, 14);
insert into lunchbox values(lunchbox_seq.nextval, 4, 14);

//나만의도시락
create table lunchbox(
	lb_no number primary KEY,
	i_no number,
	on_no number,
	constraint i_no_lunchbox_fk foreign key(i_no) references Information(i_no),
	constraint on_no_lunchbox_fk foreign key(on_no) references Oder_menu(on_no)
);

create sequence lunchbox_seq
start with 1
increment by 1
nocache
nocycle;

drop table lunchbox
drop sequence lunchbox_seq

update oder set o_state=0 where o_no=10

select i_name, on_cnt, o_state, on_state, on_getdate, on_time
from (oder o join oder_menu om on o.o_no=om.o_no) left outer join lunchbox lb on om.on_no=lb.on_no
where u_no=81 and to_char(on_getdate, 'yyyy-mm-dd')='2018-08-22'

select to_number(to_char(on_getdate, 'mm')) from oder_menu

select i_menu from lunchbox l join information i on l.i_no=i.i_no where on_no=13

select o.o_no, on_no, u_name, i_no, i_name, on_cnt, on_getdate, on_time, o_state, on_state 
		from (oder o join oder_menu om on o.o_no=om.o_no)join users u on o.u_no=u.u_no
		where o.o_no=10

select * from users

select * from oder_menu
select * from information

select * from information_image where i_no=1 order by ii_no;
select * from users u, information_comment ic where u.u_no=ic.u_no and i_no=1 and ic_state=0 order by ic_no desc;

select * from Config c inner join Information i on c.c_order = i.i_gubun where c.c_type = 'side'