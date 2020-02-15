create table tbl_room(			
	room_num number PRIMARY key,		
	room_type_num references tbl_room_type(room_type_num),		
	user_email references tbl_user(user_email),		
	room_location varchar2(200) not null,		
	room_score number DEFAULT 0,		
	room_price number not null,		
	room_explain varchar2(1000) not null,		
	room_people number not null,		
	room_bed number not null,		
	room_bathroom number not null		
);	room_title          >>>>>추가함		
			
create table tbl_reservation(			
	reserv_num number PRIMARY key,		
	room_num REFERENCES tbl_room(room_num),		
	user_email REFERENCES tbl_user(user_email),		
	room_reserv_start_date TIMESTAMP not null,		
	room_reserv_end_date TIMESTAMP not null		
);			
			
			
create TABLE tbl_point_code (			
	point_code varchar2(200) primary key,		
	point_code_explain varchar2(200) not null		
);			
			
create table tbl_point (			
	point_num number primary key,		
	user_email varchar2(200),		
	point_date TIMESTAMP default sysdate,		
	point_code varchar2(200) REFERENCES tbl_point_code(point_code)		
);			
			
create table tbl_like (			
	like_num number primary key,		
	room_num number references tbl_room(room_num),		
	user_email varchar2(200) references tbl_user(user_email)		
);			
			
			
create table tbl_user(			
	user_email VARCHAR2(200) PRIMARY KEY,		
	user_pw VARCHAR2(200) NOT NULL,		
	user_name VARCHAR2(200) NOT NULL,		
	user_phone VARCHAR2(200),		
	user_point NUMBER DEFAULT 1000000,		
	user_pic VARCHAR2(200)		
);			
			
create table tbl_room_type(			
	room_type_num VARCHAR2(200) PRIMARY KEY,		
	room_type_explain VARCHAR2(200) NOT NULL		
);			
			
			
create table tbl_host(			
	user_email VARCHAR2(200) REFERENCES tbl_user(user_email),		
	room_num NUMBER REFERENCES tbl_room(room_num)		
);			
			
create table tbl_room_option(			
	room_num NUMBER REFERENCES tbl_room(room_num),		
	option_aircon NUMBER DEFAULT 0,		
	option_wifi NUMBER DEFAULT 0,		
	option_tv NUMBER DEFAULT 0,		
	option_breakfast NUMBER DEFAULT 0,		
	option_parking NUMBER DEFAULT 0,		
	option_smoking NUMBER DEFAULT 0,		
	option_pet NUMBER DEFAULT 0,		
	option_closet NUMBER DEFAULT 0,		
	option_hair_dry NUMBER DEFAULT 0		
);			
			
		
create table tbl_room_picture(			
	room_num NUMBER REFERENCES tbl_room(room_num),		
	pic_num NUMBER PRIMARY KEY,		
	pic_uri VARCHAR2(200) NOT NULL,		
	pic_reg_date TIMESTAMP DEFAULT SYSDATE		
);