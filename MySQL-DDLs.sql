create table article
(
    id              int unsigned auto_increment comment 'ID,主键'
        primary key,
    user_id         int unsigned     not null comment '用户ID',
    channel_id      int unsigned     not null comment '频道ID',
    title           varchar(31)      not null comment '标题',
    content_preview varchar(300)     null comment '正文预览',
    content         varchar(2000)    null comment '完整的文章内容，最大2000字符',
    cover_type      tinyint unsigned null comment '封面类型：null=无；1=图片；2=视频',
    create_time     datetime         null comment '创建时间',
    update_time     datetime         null comment '修改时间'
)
    comment '文章表' charset = utf8mb4;

create table article_images
(
    id            int auto_increment
        primary key,
    article_id    int unsigned                                             not null comment '文章ID',
    image_url     varchar(512)                                             not null comment '图片URL地址',
    display_order tinyint unsigned                                         not null comment '图片在文章中的显示顺序，从1开始',
    media_type    enum ('image', 'video', 'gif') default 'image'           null comment '媒体类型：image=图片, video=视频, gif=动图',
    create_time   datetime                       default CURRENT_TIMESTAMP null comment '上传时间',
    constraint article_id
        unique (article_id, display_order)
)
    charset = utf8mb4;

create table channel
(
    id          int unsigned auto_increment comment 'ID,主键'
        primary key,
    channelname varchar(96)                            not null comment '频道名',
    image       varchar(255)                           null comment '频道封面',
    user_conut  int unsigned default 0                 null comment '用户数量',
    create_time datetime     default CURRENT_TIMESTAMP null comment '创建时间',
    update_time datetime     default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    constraint username
        unique (channelname)
)
    comment '频道表' charset = utf8mb4;

create table channel_owner
(
    id          int unsigned auto_increment comment 'ID,主键'
        primary key,
    channel_id  int unsigned                       not null comment '频道ID',
    user_id     int unsigned                       not null comment '用户ID',
    type        tinyint unsigned                   not null comment '频道主职位, 1:频道主, 2:频道管理员, 3:板块管理员，4:板块管理员',
    create_time datetime default CURRENT_TIMESTAMP null comment '创建时间',
    update_time datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间'
)
    comment '频道主' charset = utf8mb4;

create table user
(
    id          int unsigned auto_increment comment 'ID,主键'
        primary key,
    username    varchar(20)  not null comment '用户名',
    phone       char(11)     null comment '手机号',
    email       char(36)     null comment '邮箱',
    password    varchar(16)  not null comment '密码',
    image       varchar(255) null comment '头像',
    create_time datetime     null comment '创建时间',
    update_time datetime     null comment '修改时间',
    constraint email
        unique (email),
    constraint phone
        unique (phone),
    constraint username
        unique (username)
)
    comment '用户表' charset = utf8mb4;

