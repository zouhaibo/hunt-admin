/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/10/10 7:44:27                           */
/*==============================================================*/


drop table if exists sys_data_group;

drop table if exists sys_data_item;

drop table if exists sys_organization;

drop table if exists sys_permission;

drop table if exists sys_permission_group;

drop table if exists sys_role;

drop table if exists sys_role_perrmission;

drop table if exists sys_user;

drop table if exists sys_user_permission;

drop table if exists sys_user_role;

/*==============================================================*/
/* Table: sys_data_group                                        */
/*==============================================================*/
create table sys_data_group
(
  id                   bigint not null auto_increment,
  description          varchar(256) comment '描述',
  parent_id            bigint comment '父级id',
  name                 varchar(256) comment '名称',
  is_final             int default 1 comment '是否可删除',
  rank                 bigint default 0 comment '排序',
  create_time          datetime default CURRENT_TIMESTAMP comment '创建时间',
  update_time          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
  create_by            bigint default 0 comment '创建人',
  update_by            bigint default 0 comment '更热人',
  state                int default 1 comment '数据状态,1:正常,2:删除,3:禁用账号',
  primary key (id)
);

/*==============================================================*/
/* Table: sys_data_item                                         */
/*==============================================================*/
create table sys_data_item
(
  id                   bigint not null auto_increment,
  sys_data_group_id    bigint comment '组id',
  key_value            varchar(256) comment '值',
  key_name             varchar(256) comment '名称',
  is_final             int default 1 comment '是否可删除',
  rank                 bigint default 0 comment '排序',
  create_time          datetime default CURRENT_TIMESTAMP comment '创建时间',
  update_time          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
  create_by            bigint default 0 comment '创建人',
  update_by            bigint default 0 comment '更热人',
  state                int default 1 comment '数据状态,1:正常,2:删除,3:禁用账号',
  primary key (id)
);

/*==============================================================*/
/* Table: sys_organization                                      */
/*==============================================================*/
create table sys_organization
(
  id                   bigint not null auto_increment,
  name                 varchar(256) comment '名称',
  description          varchar(1024) comment '描述',
  is_final             int default 1 comment '是否可删除',
  parent_id            bigint default 0,
  rank                 bigint default 0 comment '排序',
  create_time          datetime default CURRENT_TIMESTAMP comment '创建时间',
  update_time          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
  create_by            bigint default 0 comment '创建人id',
  update_by            bigint default 0 comment '更新人id',
  state                int default 1 comment '数据状态,1:正常,2:删除',
  primary key (id)
);

/*==============================================================*/
/* Table: sys_permission                                        */
/*==============================================================*/
create table sys_permission
(
  id                   bigint not null auto_increment,
  name                 varchar(256) comment '名称',
  description          varchar(256) comment '描述',
  code                 varchar(256) comment '编码',
  sys_permission_group_id bigint comment '分组id',
  is_final             int default 1 comment '是否可删除',
  rank                 bigint default 0 comment '排序',
  create_time          datetime default CURRENT_TIMESTAMP comment '创建时间',
  update_time          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
  create_by            bigint default 0 comment '创建人id',
  update_by            bigint default 0 comment '更新人id',
  state                int default 1 comment '数据状态,1:正常,2:删除',
  primary key (id)
);

/*==============================================================*/
/* Table: sys_permission_group                                  */
/*==============================================================*/
create table sys_permission_group
(
  id                   bigint not null auto_increment,
  name                 varchar(256) comment '名称',
  descritption         varchar(256) comment '描述',
  parent_id            bigint default 0 comment '父级id',
  is_final             int default 1 comment '是否可删除',
  rank                 bigint default 0 comment '排序',
  create_time          datetime default CURRENT_TIMESTAMP comment '创建时间',
  update_time          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
  create_by            bigint default 0 comment '创建人id',
  update_by            bigint default 0 comment '更新人id',
  state                int default 1 comment '数据状态,1:正常,2:删除',
  primary key (id)
);

/*==============================================================*/
/* Table: sys_role                                              */
/*==============================================================*/
create table sys_role
(
  id                   bigint not null auto_increment,
  description          varchar(1024),
  name                 varchar(256),
  rank                 bigint default 0 comment '排序',
  if_final             int default 1 comment '是否可删除',
  create_time          datetime default CURRENT_TIMESTAMP comment '创建时间',
  update_time          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
  create_by            bigint default 0 comment '创建人id',
  update_by            bigint default 0 comment '更新人id',
  state                int default 1 comment '数据状态,1:正常,2:删除',
  primary key (id)
);

/*==============================================================*/
/* Table: sys_role_perrmission                                  */
/*==============================================================*/
create table sys_role_perrmission
(
  id                   bigint not null auto_increment,
  sys_permission_id    bigint comment '权限id',
  sys_role_id          bigint comment '角色id',
  rank                 bigint default 0 comment '排序',
  create_time          datetime default CURRENT_TIMESTAMP comment '创建时间',
  update_time          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
  create_by            bigint default 0 comment '创建人id',
  update_by            bigint default 0 comment '更新人id',
  state                int default 1 comment '数据状态,1:正常,2:删除',
  primary key (id)
);

/*==============================================================*/
/* Table: sys_user                                              */
/*==============================================================*/
create table sys_user
(
  id                   bigint not null auto_increment,
  login_name           varchar(256) comment '登陆名',
  zh_name              varchar(256) comment '中文名',
  en_name              varchar(256) comment '英文名',
  sex                  int default 0 comment '性别',
  birth                varchar(256) comment '生日',
  email                varchar(256) comment '邮箱',
  phone                varchar(256) comment '电话',
  address              varchar(1024) comment '地址',
  password             varchar(256) comment '密码',
  password_salt        varchar(256) comment '密码盐',
  rank                 bigint default 0 comment '排序',
  create_time          datetime default CURRENT_TIMESTAMP comment '创建时间',
  update_time          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
  create_by            bigint default 0 comment '创建人',
  update_by            bigint default 0 comment '更热人',
  state                int default 1 comment '数据状态,1:正常,2:删除,3:禁用账号',
  primary key (id)
);

/*==============================================================*/
/* Table: sys_user_permission                                   */
/*==============================================================*/
create table sys_user_permission
(
  id                   bigint not null auto_increment,
  sys_user_id          bigint,
  sys_permission_id    bigint,
  is_final             int default 1,
  rank                 bigint default 0 comment '排序',
  create_time          datetime default CURRENT_TIMESTAMP comment '创建时间',
  update_time          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
  create_by            bigint default 0 comment '创建人id',
  update_by            bigint default 0 comment '更新人id',
  state                int default 1 comment '数据状态,1:正常,2:删除',
  primary key (id)
);

/*==============================================================*/
/* Table: sys_user_role                                         */
/*==============================================================*/
create table sys_user_role
(
  id                   bigint not null auto_increment,
  sys_user_id          bigint comment '用户id',
  sys_organization_id  bigint comment '组织id',
  sys_role_id          bigint comment '角色id',
  rank                 bigint default 0 comment '排序',
  create_time          datetime default CURRENT_TIMESTAMP comment '创建时间',
  update_time          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新时间',
  create_by            bigint default 0 comment '创建人id',
  update_by            bigint default 0 comment '更新人id',
  state                int default 1 comment '数据状态,1:正常,2:删除',
  primary key (id)
);

