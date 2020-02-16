--WEB-INF/spring/room-context.xml//
<!-- connection pool -->
<!-- <property name="url" value="jdbc:log4jdbc:oracle:thin:@192.168.0.34:1521:xe"></property> -->

--tbl_room_type=====================================================
create table tbl_room_type(		
	room_type_num VARCHAR2(200) PRIMARY KEY,	
	room_type_explain VARCHAR2(200) NOT NULL	
);		
insert into tbl_room_type (room_type_num, room_type_explain)
values ('R1', '아파트');	
insert into tbl_room_type (room_type_num, room_type_explain)
values ('R2', '주택');
insert into tbl_room_type (room_type_num, room_type_explain)
values ('R3', '게스트하우스');

--tbl_room_option=====================================================
create table tbl_room_option(		
	room_option_code varchar2(200) PRIMARY KEY,	
	room_option_explain varchar2(200) not null	
);		
insert into tbl_room_option(room_option_code, room_option_explain) values('A1', '에어컨');		
insert into tbl_room_option(room_option_code, room_option_explain) values('W1', '와이파이');		
insert into tbl_room_option(room_option_code, room_option_explain) values('T1', 'TV');		
insert into tbl_room_option(room_option_code, room_option_explain) values('B1', '조식');		
insert into tbl_room_option(room_option_code, room_option_explain) values('P1', '주차공간');		
insert into tbl_room_option(room_option_code, room_option_explain) values('S1', '흡연가능');		
insert into tbl_room_option(room_option_code, room_option_explain) values('P2', '반려동물');		
insert into tbl_room_option(room_option_code, room_option_explain) values('C1', '옷장');		
insert into tbl_room_option(room_option_code, room_option_explain) values('H1', '헤어드라이');		
		
--tbl_user============================================================
create table tbl_user(		
	user_email VARCHAR2(200) PRIMARY KEY,	
	user_pw VARCHAR2(200) NOT NULL,	
	user_name VARCHAR2(200) NOT NULL,	
	user_phone VARCHAR2(200),	
	user_point NUMBER DEFAULT 1000000,	
	user_pic VARCHAR2(200)	
);		

--tbl_room=============================================================
create table tbl_room(		
	room_num number PRIMARY KEY,	
	room_type_num references tbl_room_type(room_type_num),	
	user_email references tbl_user(user_email),	
	room_location VARCHAR2(200) not null,
    room_location_detail VARCHAR2(200) not null,
	room_score number DEFAULT 0,	
	room_price number not null,	
    room_title VARCHAR2(200) not null,
	room_explain VARCHAR2(1000) not null,	
	room_people number not null,	
	room_bed number not null,	
	room_bathroom number not null,
	room_option_code VARCHAR2(200) 
);	      
create sequence seq_room_num;	

--tbl_host=============================================================
create table tbl_host(			
	user_email VARCHAR2(200) REFERENCES tbl_user(user_email),		
	room_num NUMBER REFERENCES tbl_room(room_num)		
);

--tbl_room_picture=====================================================
create table tbl_room_picture(		
	room_num NUMBER REFERENCES tbl_room(room_num),	
	pic_num NUMBER PRIMARY KEY,	
	pic_uri VARCHAR2(200) NOT NULL,	
	pic_reg_date TIMESTAMP DEFAULT SYSDATE	
);	
create sequence seq_pic_num;	

--tbl_reservation========================================================
--tbl_point_code=========================================================
--tbl_point==============================================================
--tbl_like===============================================================
		
        
--dummy data=============================================================
--=======================================================================
insert into tbl_user(user_email, user_pw, user_name) 
values('test@naver.com', '1234', '테스트 유저');

begin					
	for i in 1..50 loop				
		insert into tbl_room (room_num, room_type_num, user_email, 
        room_location, room_location_detail, room_title, room_explain, room_price,
        room_score, room_people, room_bed, room_bathroom, room_option_code)					
		values (			
			seq_room_num.nextval,		
			'R1',		
			'test@naver.com',		
			'울산광역시 남구 대암로 ' || i,
            'A동 ' || i,
            '숙소 '|| i,	
            '설명 ' || i,
            1000 + i,
			5,		
			2,		
			2,		
			1,
			'P1,P2');		
	end loop;				
end;					
/	