DROP DATABASE IF EXISTS springbootXX15T;

CREATE DATABASE springbootXX15T default character set utf8mb4 collate utf8mb4_general_ci;

USE springbootXX15T;

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`zhanghao` varchar(200) NOT NULL UNIQUE   COMMENT '账号',
	`mima` varchar(200) NOT NULL   COMMENT '密码',
	`xingming` varchar(200)    COMMENT '姓名',
	`xingbie` varchar(200)    COMMENT '性别',
	`touxiang` varchar(200)    COMMENT '头像',
	`shouji` varchar(200)    COMMENT '手机',
	`dizhi` varchar(200)    COMMENT '地址',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

DROP TABLE IF EXISTS `shangjia`;

CREATE TABLE `shangjia` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`shangjiabianhao` varchar(200) NOT NULL UNIQUE   COMMENT '商家编号',
	`mima` varchar(200) NOT NULL   COMMENT '密码',
	`shangjiamingcheng` varchar(200)    COMMENT '商家名称',
	`tupian` varchar(200)    COMMENT '图片',
	`lianxiren` varchar(200)    COMMENT '联系人',
	`lianxidianhua` varchar(200)    COMMENT '联系电话',
	`tese` varchar(200)    COMMENT '特色',
	`dizhi` varchar(200)    COMMENT '地址',
	`jieshao` longtext    COMMENT '介绍',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家';

DROP TABLE IF EXISTS `caipinfenlei`;

CREATE TABLE `caipinfenlei` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`leixing` varchar(200)    COMMENT '类型',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜品分类';

DROP TABLE IF EXISTS `caipin`;

CREATE TABLE `caipin` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`mingcheng` varchar(200) NOT NULL   COMMENT '名称',
	`leixing` varchar(200)    COMMENT '类型',
	`tupian` varchar(200)    COMMENT '图片',
	`kouwei` varchar(200)    COMMENT '口味',
	`jiage` int NOT NULL   COMMENT '价格',
	`shangjiabianhao` varchar(200)    COMMENT '商家编号',
	`shangjiamingcheng` varchar(200)    COMMENT '商家名称',
	`dizhi` varchar(200)    COMMENT '地址',
	`caipinjieshao` longtext    COMMENT '菜品介绍',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜品';

DROP TABLE IF EXISTS `dingdan`;

CREATE TABLE `dingdan` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`mingcheng` varchar(200)    COMMENT '名称',
	`leixing` varchar(200)    COMMENT '类型',
	`tupian` varchar(200)    COMMENT '图片',
	`jiage` varchar(200)    COMMENT '价格',
	`goumaishuliang` int    COMMENT '购买数量',
	`zongjiage` varchar(200)    COMMENT '总价格',
	`shangjiabianhao` varchar(200)    COMMENT '商家编号',
	`shangjiamingcheng` varchar(200)    COMMENT '商家名称',
	`zhanghao` varchar(200)    COMMENT '账号',
	`shouji` varchar(200)    COMMENT '手机',
	`qishoushouyi` int    COMMENT '骑手收益',
	`xiadanshijian` datetime    COMMENT '下单时间',
	`beizhu` varchar(200)    COMMENT '备注',
	`sfsh` varchar(200)   default '否' COMMENT '是否审核',
	`shhf` longtext    COMMENT '审核回复',
	`ispay` varchar(200)   default '未支付' COMMENT '是否支付',
	`longitude` float    COMMENT '经度',
	`latitude` float    COMMENT '纬度',
	`fulladdress` varchar(200)    COMMENT '地址',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';

DROP TABLE IF EXISTS `qishou`;

CREATE TABLE `qishou` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`yonghuming` varchar(200) NOT NULL UNIQUE   COMMENT '用户名',
	`mima` varchar(200) NOT NULL   COMMENT '密码',
	`qishouxingming` varchar(200)    COMMENT '骑手姓名',
	`xingbie` varchar(200)    COMMENT '性别',
	`touxiang` varchar(200)    COMMENT '头像',
	`dianhua` varchar(200)    COMMENT '电话',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='骑手';

DROP TABLE IF EXISTS `peisongdan`;

CREATE TABLE `peisongdan` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`mingcheng` varchar(200)    COMMENT '名称',
	`tupian` varchar(200)    COMMENT '图片',
	`goumaishuliang` varchar(200)    COMMENT '购买数量',
	`shangjiabianhao` varchar(200)    COMMENT '商家编号',
	`zhanghao` varchar(200)    COMMENT '账号',
	`beizhu` varchar(200)    COMMENT '备注',
	`qishoushouyi` int    COMMENT '骑手收益',
	`jiedanshijian` datetime    COMMENT '接单时间',
	`yonghuming` varchar(200)    COMMENT '用户名',
	`qishouxingming` varchar(200)    COMMENT '骑手姓名',
	`dianhua` varchar(200)    COMMENT '电话',
	`dingdanzhuangtai` varchar(200)    COMMENT '订单状态',
	`sfsh` varchar(200)   default '否' COMMENT '是否审核',
	`shhf` longtext    COMMENT '审核回复',
	`ispay` varchar(200)   default '未支付' COMMENT '是否支付',
	`longitude` float    COMMENT '经度',
	`latitude` float    COMMENT '纬度',
	`fulladdress` varchar(200)    COMMENT '地址',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配送单';

DROP TABLE IF EXISTS `shangpinpingjia`;

CREATE TABLE `shangpinpingjia` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`mingcheng` varchar(200)    COMMENT '名称',
	`tupian` varchar(200)    COMMENT '图片',
	`goumaishuliang` varchar(200)    COMMENT '购买数量',
	`shangjiabianhao` varchar(200)    COMMENT '商家编号',
	`caipinpingfen` varchar(200)    COMMENT '菜品评分',
	`peisongpingfen` varchar(200)    COMMENT '配送评分',
	`shangjiapingfen` varchar(200)    COMMENT '商家评分',
	`pingyu` longtext    COMMENT '评语',
	`zhanghao` varchar(200)    COMMENT '账号',
	`beizhu` varchar(200)    COMMENT '备注',
	`sfsh` varchar(200)   default '否' COMMENT '是否审核',
	`shhf` longtext    COMMENT '审核回复',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品评价';

DROP TABLE IF EXISTS `storeup`;

CREATE TABLE `storeup` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`userid` bigint NOT NULL   COMMENT '用户id',
	`refid` bigint    COMMENT '收藏id',
	`tablename` varchar(200)    COMMENT '表名',
	`name` varchar(200) NOT NULL   COMMENT '收藏名称',
	`picture` varchar(200) NOT NULL   COMMENT '收藏图片',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`title` varchar(200) NOT NULL   COMMENT '标题',
	`picture` varchar(200) NOT NULL   COMMENT '图片',
	`content` longtext NOT NULL   COMMENT '内容',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻资讯';


DROP TABLE IF EXISTS `config`;

CREATE TABLE `config`(
	`id` bigint NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL COMMENT '配置参数名称',
	`value` varchar(100) COMMENT '配置参数值',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置文件';

insert into config(id,name) values(1,'picture1');
insert into config(id,name) values(2,'picture2');
insert into config(id,name) values(3,'picture3');
insert into config(id,name) values(4,'picture4');
insert into config(id,name) values(5,'picture5');
insert into config(id,name) values(6,'homepage');


DROP TABLE IF EXISTS `users`;

CREATE TABLE `users`(
	`id` bigint NOT NULL AUTO_INCREMENT,
	`username` varchar(100) NOT NULL COMMENT '用户名',
	`password` varchar(100) NOT NULL COMMENT '密码',
	`role` varchar(100) default '管理员' COMMENT '角色',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '新增时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

insert into users(id,username, password) values(1,'abo','abo');

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token`(
	`id` bigint NOT NULL AUTO_INCREMENT,
	`userid` bigint NOT NULL COMMENT '用户id',
	`username` varchar(100) NOT NULL COMMENT '用户名',
	`tablename` varchar(100) COMMENT '表名',
	`role` varchar(100) COMMENT '角色',
	`token` varchar(200) NOT NULL COMMENT '密码',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '新增时间',
	`expiratedtime` timestamp COMMENT '过期时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='token表';

