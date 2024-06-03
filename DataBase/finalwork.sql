/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:3306
 Source Schema         : finalwork

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 29/05/2024 11:00:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content`  (
  `contentid` int NOT NULL AUTO_INCREMENT,
  `userid` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `head` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `body` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `likes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`contentid`) USING BTREE,
  INDEX `userid`(`userid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES (5, 1, '得不到的更加爱', '得不到，舍不得，遗憾终将成为过去', '林徽因曾说：有些人渐渐不联系了，不是因为淡了远了，而是因为，没有合适的身份陪伴，没有合适的理由联系，没有合适的机会见面，只能放在心里，偶尔回忆经常想念\r\n\r\n总有那么一个人，陪了你一程，却陪不了你一生，是别人的风景，却湿了你的眼睛，是别人的枕边人，却让你思念一生\r\n\r\n人生遇到的每个人，出场顺序真的很重要。很多人，如果换一个时间认识，就会有不一样的结局。有些人执着到擦千眼泪继续爱你，有些人冷静到权衡轻重地放弃你\r\n\r\n人生最大的遗憾，莫过于遇到一个特别的人，却明白永远不能在一起。或早或晚，你不得不放弃，你终于明白，人生最大的遗憾，不是得不到，而是舍不得\r\n\r\n有一种爱，与婚姻无关，与白首无缘。有一些人，光是遇到，就已经是上上签了，有时候不得不承认，生不逢时，爱不逢人，所到之处，皆是命数每个人一生都会遇见很多人，有些人注定是过客。就像有些风景只能喜欢却不能收藏，就像有些人只适合遇见，却不适牵手\r\n\r\n得不到，舍不得，遗憾终将成为过去', '人间四月天', 'fond', '4', '2024-05-11 16:44:08');
INSERT INTO `content` VALUES (6, 1, '很喜欢的一句话', '很喜欢的一段话：“就算你的认知己经很高了，不要轻易去教育别人，就让他们做自己，包括身边最亲近的人也是如此，期间你自己不被影响和消耗就行了，除非别人主动请教你，你才能发表自己。天雨大不润无根草，道法宽只渡有缘人。”', '很喜欢的一段话：“就算你的认知己经很高了，不要轻易去教育别人，就让他们做自己，包括身边最亲近的人也是如此，期间你自己不被影响和消耗就行了，除非别人主动请教你，你才能发表自己。天雨大不润无根草，道法宽只渡有缘人。”', '人间四月', 'fond', '2', '2024-05-19 17:50:55');
INSERT INTO `content` VALUES (12, 1, '年少有为', '假如我年少有为，可是没有假如。', '唐朝的离婚书是这样写的:“愿娘子相离之后\r\n\r\n重梳婵鬓美扫峨眉，巧呈窈窕之姿，选聘高官之主\r\n\r\n解怨释结更莫相憎，一别两宽各生欢喜。”', '情感;', 'fond', '0', '2024-05-20 21:48:10');
INSERT INTO `content` VALUES (13, 2, '', 'asd', 'qwe', NULL, NULL, NULL, '2024-05-04 06:05:37');
INSERT INTO `content` VALUES (14, 1, '人间四月', '山寺桃花，楼外楼', '人间四月芳菲尽，\r\n山寺桃花始盛开', '表白季;宿舍情谊;一杯奶茶;', 'fond', '0', '2024-05-29 10:48:01');
INSERT INTO `content` VALUES (15, 1, '不忘初心砥砺前进', '不忘初心砥砺前行——记海洋科学与技术学院优秀共产党员杨铠名', '今天刚考完数据库，题目不难', '人间四月天;暖春心动季;', 'fond', '0', '2024-05-25 16:12:21');
INSERT INTO `content` VALUES (17, 5, '测试', 'lll', '珀iuoohhs', '人间四月天;', '2111252', '0', '2024-05-29 20:16:09');
INSERT INTO `content` VALUES (18, 1, '演唱会', '奔赴乌托邦', '她着本应三年前的盛装出席，为嫁给青春，“在屋顶唱着你的歌（在屋顶和我爱的人）”\r\n可能这就是演唱会的意义吧', '情感;', 'fond', '0', '2024-05-28 20:05:53');

-- ----------------------------
-- Table structure for doreview
-- ----------------------------
DROP TABLE IF EXISTS `doreview`;
CREATE TABLE `doreview`  (
  `reviewid` int NOT NULL AUTO_INCREMENT,
  `userid` int NULL DEFAULT NULL,
  `contentid` int NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reviewid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of doreview
-- ----------------------------
INSERT INTO `doreview` VALUES (26, 1, 5, '2024-05-21 08:41:07');
INSERT INTO `doreview` VALUES (27, 1, 5, '2024-05-21 08:41:16');
INSERT INTO `doreview` VALUES (32, 1, 14, '2024-05-21 09:19:50');
INSERT INTO `doreview` VALUES (33, 1, 15, '2024-05-25 16:23:18');
INSERT INTO `doreview` VALUES (34, 1, 15, '2024-05-25 16:24:23');
INSERT INTO `doreview` VALUES (43, 1, 14, '2024-05-29 10:50:29');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `historyid` int NOT NULL AUTO_INCREMENT,
  `userid` int NULL DEFAULT NULL,
  `contentid` int NULL DEFAULT NULL,
  `timestart` datetime NULL DEFAULT NULL,
  `duration` time(6) NULL DEFAULT NULL,
  PRIMARY KEY (`historyid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (43, 1, 5, '2024-05-28 14:19:33', NULL);
INSERT INTO `history` VALUES (44, 1, 5, '2024-05-28 14:20:02', NULL);
INSERT INTO `history` VALUES (45, 1, 5, '2024-05-28 14:20:04', NULL);
INSERT INTO `history` VALUES (46, 1, 5, '2024-05-28 14:20:05', NULL);
INSERT INTO `history` VALUES (47, 1, 4, '2024-05-28 14:26:58', NULL);
INSERT INTO `history` VALUES (48, 1, 5, '2024-05-28 14:27:22', NULL);
INSERT INTO `history` VALUES (49, 1, 3, '2024-05-28 14:52:49', NULL);
INSERT INTO `history` VALUES (50, 1, 3, '2024-05-28 14:54:54', NULL);
INSERT INTO `history` VALUES (51, 1, 3, '2024-05-28 14:55:16', NULL);
INSERT INTO `history` VALUES (52, 1, 3, '2024-05-28 14:55:16', NULL);
INSERT INTO `history` VALUES (53, 1, 3, '2024-05-28 14:55:45', NULL);
INSERT INTO `history` VALUES (54, 5, 12, '2024-05-28 14:57:59', NULL);
INSERT INTO `history` VALUES (55, 5, 4, '2024-05-28 15:22:17', NULL);
INSERT INTO `history` VALUES (56, 1, 3, '2024-05-28 19:36:35', NULL);
INSERT INTO `history` VALUES (57, 1, 4, '2024-05-28 19:56:48', NULL);
INSERT INTO `history` VALUES (58, 1, 17, '2024-05-28 20:06:44', NULL);
INSERT INTO `history` VALUES (59, 1, 12, '2024-05-28 20:09:00', NULL);
INSERT INTO `history` VALUES (60, 6, 14, '2024-05-29 10:42:42', NULL);
INSERT INTO `history` VALUES (61, 1, 14, '2024-05-29 10:45:03', NULL);
INSERT INTO `history` VALUES (62, 1, 14, '2024-05-29 10:48:28', NULL);
INSERT INTO `history` VALUES (63, 1, 14, '2024-05-29 10:50:29', NULL);
INSERT INTO `history` VALUES (64, 1, 14, '2024-05-29 10:50:29', NULL);

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `reviewid` int NOT NULL AUTO_INCREMENT,
  `article` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `observer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `likes` int NULL DEFAULT NULL,
  `time` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`reviewid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (15, '432', '123', 0, '2024-05-21 03:18:22.000000');
INSERT INTO `review` VALUES (17, 'aa', '1qweqw3', 0, '2024-05-21 03:18:57.000000');
INSERT INTO `review` VALUES (23, 'lalala', 'HHH', 0, '2024-05-21 08:41:07.000000');
INSERT INTO `review` VALUES (25, '432', '123', 0, '2024-05-21 08:46:02.000000');
INSERT INTO `review` VALUES (26, '32啊', '324啊', 0, '2024-05-21 08:46:04.000000');
INSERT INTO `review` VALUES (32, '啦啦啦啦啦啦啦啦', 'Fond', 0, '2024-05-21 09:19:50.000000');
INSERT INTO `review` VALUES (33, '好厉害！', '李佳豪', 0, '2024-05-25 16:23:18.000000');
INSERT INTO `review` VALUES (34, '我的天呐', 'ljh', 0, '2024-05-25 16:24:23.000000');
INSERT INTO `review` VALUES (43, '人间四月天', '林徽因', 0, '2024-05-29 10:50:29.000000');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `tagid` int NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tagid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, '爱情', '表白季');
INSERT INTO `tag` VALUES (2, '爱情', '情感');
INSERT INTO `tag` VALUES (3, '爱情', '人间四月天');
INSERT INTO `tag` VALUES (4, '爱情', '暖春心动季');
INSERT INTO `tag` VALUES (5, '友谊', '宿舍情谊');
INSERT INTO `tag` VALUES (6, '友谊', '一杯奶茶');
INSERT INTO `tag` VALUES (7, '爱情', '一杯奶茶');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `birthday` datetime(6) NULL DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `level` int NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (1, 'fond', 'Lijh0214', 18, '2023-05-01 00:00:00.000000', '山西', '女', 0);
INSERT INTO `userinfo` VALUES (2, 'divider', '111', 18, '2023-05-01 00:00:00.000000', '运城', '男', 2);
INSERT INTO `userinfo` VALUES (3, 'feeling', '2', 1, '2023-05-02 20:45:24.000000', '地球', '女', 1);
INSERT INTO `userinfo` VALUES (4, 'Ljh', '11', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `userinfo` VALUES (5, '2212900', '2212900', 12, NULL, 'None', '男', NULL);
INSERT INTO `userinfo` VALUES (6, 'irving', 'irving', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- View structure for allhistory
-- ----------------------------
DROP VIEW IF EXISTS `allhistory`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `allhistory` AS select `content`.`title` AS `title`,`userinfo`.`username` AS `author`,`content`.`label` AS `tag`,`history`.`timestart` AS `time`,`history`.`userid` AS `userid` from ((`history` join `content`) join `userinfo`) where ((`history`.`contentid` = `content`.`contentid`) and (`content`.`userid` = `userinfo`.`userid`));

-- ----------------------------
-- View structure for alluser
-- ----------------------------
DROP VIEW IF EXISTS `alluser`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `alluser` AS select `userinfo`.`userid` AS `userid`,`userinfo`.`username` AS `username`,`userinfo`.`sex` AS `sex`,`userinfo`.`area` AS `area`,`num_content`.`content_num` AS `content_num`,`num_review`.`review_num` AS `review_num` from ((`userinfo` join `num_content` on((`userinfo`.`userid` = `num_content`.`userid`))) join `num_review` on((`userinfo`.`userid` = `num_review`.`userid`)));

-- ----------------------------
-- View structure for allview
-- ----------------------------
DROP VIEW IF EXISTS `allview`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `allview` AS select `content`.`contentid` AS `contentid`,`content`.`title` AS `title`,`content`.`head` AS `head`,`userinfo`.`username` AS `username`,`content`.`time` AS `time` from (`content` join `userinfo` on((`content`.`userid` = `userinfo`.`userid`)));

-- ----------------------------
-- View structure for num_content
-- ----------------------------
DROP VIEW IF EXISTS `num_content`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `num_content` AS select `userinfo`.`userid` AS `userid`,count(`userinfo`.`username`) AS `content_num` from (`userinfo` left join `content` on((`userinfo`.`userid` = `content`.`userid`))) group by `userinfo`.`userid`;

-- ----------------------------
-- View structure for num_review
-- ----------------------------
DROP VIEW IF EXISTS `num_review`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `num_review` AS select `userinfo`.`userid` AS `userid`,count(`userinfo`.`username`) AS `review_num` from (`userinfo` left join `doreview` on((`userinfo`.`userid` = `doreview`.`userid`))) group by `userinfo`.`userid`;

-- ----------------------------
-- Procedure structure for createcontent
-- ----------------------------
DROP PROCEDURE IF EXISTS `createcontent`;
delimiter ;;
CREATE PROCEDURE `createcontent`(in u int, in t VARCHAR(255), in h varchar(255),in b varchar(1200), in l varchar(255))
BEGIN
	INSERT into content value (null,u,t,h ,b,l,(SELECT username from userinfo where userid=u),0,now());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for createhistory
-- ----------------------------
DROP PROCEDURE IF EXISTS `createhistory`;
delimiter ;;
CREATE PROCEDURE `createhistory`(in u int, in c int)
BEGIN
	INSERT into history value (null,u,c,now(),null);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for createreview
-- ----------------------------
DROP PROCEDURE IF EXISTS `createreview`;
delimiter ;;
CREATE PROCEDURE `createreview`(in u int, in c int, in a VARCHAR(1200), in o varchar(255))
BEGIN
	INSERT into doreview value (null,u,c,now());
	INSERT INTO review VALUE (null,a,o,0,now());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for deletearticle
-- ----------------------------
DROP PROCEDURE IF EXISTS `deletearticle`;
delimiter ;;
CREATE PROCEDURE `deletearticle`(in u int)
BEGIN
	DELETE from content where contentid=u;
	DELETE from review r where r.reviewid in (SELECT reviewid from doreview where contentid=u);
	DELETE from doreview where contentid=u;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for deletereview
-- ----------------------------
DROP PROCEDURE IF EXISTS `deletereview`;
delimiter ;;
CREATE PROCEDURE `deletereview`(in u int)
BEGIN
	DELETE from doreview where reviewid=u;
	DELETE from review where reviewid=u;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for deleteuser
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteuser`;
delimiter ;;
CREATE PROCEDURE `deleteuser`(in u int)
BEGIN
START TRANSACTION;
	DELETE from review r where r.reviewid in (SELECT reviewid from doreview where userid=u);
	DELETE from doreview where userid=u;
  DELETE from content where userid=u;
	DELETE from history where userid=u;
	DELETE from userinfo where userid=u;
COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for unpdateblog
-- ----------------------------
DROP PROCEDURE IF EXISTS `unpdateblog`;
delimiter ;;
CREATE PROCEDURE `unpdateblog`(in ci int, in t VARCHAR(255), in h VARCHAR(255),in b varchar(1200))
BEGIN
DECLARE warn VARCHAR(30);
	if length(t) =1 THEN 
		set warn="title?";
		SIGNAL SQLSTATE 'HY000' set message_text=warn;
		END IF;
		
			if h ='' THEN set warn="head?";
		SIGNAL SQLSTATE 'HY000' set message_text=warn;
		END IF;
		
			if b ='' THEN set warn="body?";
		SIGNAL SQLSTATE 'HY000' set message_text=warn;
		END IF;
		
		update content set title=t where contentid=ci;
		update content set body=b where contentid=ci;
		update content set head=h where contentid=ci;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for updateblog
-- ----------------------------
DROP PROCEDURE IF EXISTS `updateblog`;
delimiter ;;
CREATE PROCEDURE `updateblog`(in ci int, in t VARCHAR(255), in h VARCHAR(255),in b varchar(1200))
BEGIN
DECLARE warn VARCHAR(30);
	if t='' THEN 
		set warn="title?";
		SIGNAL SQLSTATE 'HY000' set message_text=warn;
		END IF;
		
			if h ='' THEN set warn="head?";
		SIGNAL SQLSTATE 'HY000' set message_text=warn;
		END IF;
		
			if b ='' THEN set warn="body?";
		SIGNAL SQLSTATE 'HY000' set message_text=warn;
		END IF;
		
		update content set title=t where contentid=ci;
		update content set body=b where contentid=ci;
		update content set head=h where contentid=ci;
		update content set time=NOW() where contentid=ci;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for updateinfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `updateinfo`;
delimiter ;;
CREATE PROCEDURE `updateinfo`(in ci int, in u VARCHAR(255), in sx VARCHAR(255),in ag int,in are varchar(1200))
BEGIN
	if not u ='' THEN
		update userinfo set username=u where userid=ci;
		END IF;
			if not sx ='' THEN
		update userinfo set sex=sx where userid=ci;
		END IF;
			if not ag ='' THEN
		update userinfo set age=ag where userid=ci;
		End if;
		if not are ='' THEN
		update userinfo set area=are where userid=ci;
		END IF;
		update content set owner=u where userid=ci;
		
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for updateinfor
-- ----------------------------
DROP PROCEDURE IF EXISTS `updateinfor`;
delimiter ;;
CREATE PROCEDURE `updateinfor`(in ci int, in u VARCHAR(255), in sx VARCHAR(255),in ag int, in bir TIMESTAMP,in are varchar(1200))
BEGIN
	if not u ='' THEN
		update userinfo set username=u where userid=ci;
		END IF;
			if not sx ='' THEN
		update userinfo set sex=sx where userid=ci;
		END IF;
			if not ag ='' THEN
		update userinfo set age=ag where userid=ci;
		End if;
		if not are ='' THEN
		update userinfo set area=are where userid=ci;
		END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table content
-- ----------------------------
DROP TRIGGER IF EXISTS `insert_newarticle`;
delimiter ;;
CREATE TRIGGER `insert_newarticle` BEFORE INSERT ON `content` FOR EACH ROW BEGIN
DECLARE warn CHAR(60);
	if (SELECT new.head REGEXP 'NKU|nku') = 1
		THEN set warn="敏感词nku";
		SIGNAL SQLSTATE 'HY000' set message_text=warn;
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table review
-- ----------------------------
DROP TRIGGER IF EXISTS `insert_newreview`;
delimiter ;;
CREATE TRIGGER `insert_newreview` BEFORE INSERT ON `review` FOR EACH ROW BEGIN
DECLARE warn CHAR(60);
	if LENGTH(new.article) =0
		THEN set warn="内容空的";
		SIGNAL SQLSTATE 'HY000' set message_text=warn;
		END IF;
	if (SELECT new.article REGEXP 'NKU|nku') = 1
		THEN set warn="敏感词nku";
		SIGNAL SQLSTATE 'HY000' set message_text=warn;
	END IF;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table userinfo
-- ----------------------------
DROP TRIGGER IF EXISTS `insert_newuser`;
delimiter ;;
CREATE TRIGGER `insert_newuser` BEFORE INSERT ON `userinfo` FOR EACH ROW BEGIN
DECLARE warn CHAR(60);
	if new.username=''
		THEN set warn="usrname?";
		SIGNAL SQLSTATE 'HY000' set message_text=warn;
	END IF;
	IF new.password = ''
		THEN set warn="password?";
		SIGNAL SQLSTATE 'HY000' set message_text=warn;
	END IF;
  IF LENGTH(new.password)<6
		Then set warn="tooshort!";
		SIGNAL SQLSTATE 'HY000' set message_text=warn;
  END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
