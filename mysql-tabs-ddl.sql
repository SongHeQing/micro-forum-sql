CREATE TABLE `article` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `user_id` int unsigned NOT NULL COMMENT '用户ID',
  `channel_id` int unsigned NOT NULL COMMENT '频道ID',
  `title` varchar(31) NOT NULL COMMENT '标题',
  `content_preview` varchar(300) DEFAULT NULL COMMENT '正文预览',
  `content` varchar(2000) DEFAULT NULL COMMENT '完整的文章内容，最大2000字符',
  `cover_type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '封面类型：0=无；1=图片；2=视频',
  `like_count` int unsigned NOT NULL DEFAULT '0' COMMENT '点赞量',
  `collect_count` int unsigned NOT NULL DEFAULT '0' COMMENT '收藏量',
  `comment_count` int unsigned NOT NULL DEFAULT '0' COMMENT '回复（评论）量',
  `view_count` int unsigned NOT NULL DEFAULT '0' COMMENT '文章点击量/阅读量',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_id` (`channel_id`),
  KEY `idx_article_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章表'

CREATE TABLE `channel` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `channelname` varchar(96) NOT NULL COMMENT '频道名',
  `image` varchar(255) DEFAULT NULL COMMENT '频道封面',
  `user_conut` int unsigned DEFAULT '0' COMMENT '用户数量',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`channelname`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='频道表'

CREATE TABLE `channel_owner` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `channel_id` int unsigned NOT NULL COMMENT '频道ID',
  `user_id` int unsigned NOT NULL COMMENT '用户ID',
  `type` tinyint unsigned NOT NULL COMMENT '频道主职位, 1:频道主, 2:频道管理员, 3:板块管理员，4:板块管理员',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='频道主'

CREATE TABLE `images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '图片ID,主键',
  `image_url` varchar(255) NOT NULL COMMENT '图片的存储路径/URL',
  `entity_type` varchar(50) NOT NULL COMMENT '关联的实体类型（例如 "ARTICLE", "USER", "CHANNEL", "COMMENT"）',
  `entity_id` int unsigned NOT NULL COMMENT '关联的业务ID（例如文章ID、用户ID、频道ID、评论ID）',
  `order_num` int unsigned NOT NULL DEFAULT '0' COMMENT '图片排序（针对多图实体，如文章的图片列表顺序）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_entity_type_entity_id` (`entity_type`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通用图片表'

CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID ,主键',
  `phone` char(11) DEFAULT NULL COMMENT '手机号',
  `email` char(255) NOT NULL COMMENT '邮箱',
  `password` varchar(16) NOT NULL COMMENT '密码',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `image` varchar(255) DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`nickname`),
  UNIQUE KEY `phone` (`phone`),
  KEY `user_email_password_index` (`email`,`password`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表'

