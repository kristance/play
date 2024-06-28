alter table playInfo AUTO_INCREMENT = 1;
alter table ticket  AUTO_INCREMENT = 1;
alter table `member`  AUTO_INCREMENT = 1;


INSERT INTO  playInfo values(idxP, "나의 해방일지", "2024-04-01", "2025-04-05", "2024-05-01 2024-05-02 2024-05-05" , "이룸아트홀", 0.0, "13",  "default/defaultPoster.jpeg", "detail image", 30000 , "no", 0, 0);

select * from member where id = "ganada" and email = "exam@exam.co.kr" and phone = #{phone} and addrMain = #{addrMain}

select * from ticket where memberConnect  = 2

select t.addrMain, m.addrMain  from `member` as m join ticket as t on m.idxM = t.memberConnect where m.password = "1234"