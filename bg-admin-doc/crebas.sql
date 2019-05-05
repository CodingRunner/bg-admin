/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/4/26 17:08:15                           */
/*==============================================================*/


drop table if exists t_behavior_log;

drop table if exists t_dict;

drop table if exists t_org;

drop table if exists t_role;

drop table if exists t_role_tree;

drop table if exists t_tree;

drop table if exists t_user;

drop table if exists t_user_org;

drop table if exists t_user_role;

/*==============================================================*/
/* Table: t_behavior_log                                        */
/*==============================================================*/
create table t_behavior_log
(
   behaviorLogId        bigint not null auto_increment comment '��Ϊ��־��ˮID',
   actionMethod         varchar(200) comment '��Ӧ����',
   actionDate           datetime comment '����ʱ��',
   actionUser           varchar(100) comment '������',
   actionUserId         varchar(32) comment '������ID',
   primary key (behaviorLogId)
);

/*==============================================================*/
/* Table: t_dict                                                */
/*==============================================================*/
create table t_dict
(
   id                   varchar(32) not null comment '�ֵ���ˮID',
   dictType             varchar(100) comment '�ֵ�����',
   dictCode             varchar(100) comment '�ֵ����',
   dictText             varchar(100) comment '�ֵ��ı�',
   dictValue            varchar(100) comment '�ֵ�ֵ',
   primary key (id)
);

/*==============================================================*/
/* Table: t_org                                                 */
/*==============================================================*/
create table t_org
(
   orgId                int not null auto_increment comment '��ˮID',
   orgName              varchar(100) comment '��֯����',
   orgCode              varchar(32) comment '��֯����',
   parentOrgId          int comment '����ˮID',
   parentOrgName        varchar(100) comment '����֯�ܹ�����',
   crtDate              datetime comment '����ʱ��',
   fullPath             varchar(255) comment '�˵���ˮ����·��(1.2.3)',
   primary key (orgId)
);

/*==============================================================*/
/* Table: t_role                                                */
/*==============================================================*/
create table t_role
(
   roleId               varchar(32) not null comment '��ɫ��ˮID',
   roleName             varchar(100) comment '��ɫ����',
   roleCode             varchar(100) comment '��ɫ����',
   crtDate              datetime comment '����ʱ��',
   primary key (roleId)
);

/*==============================================================*/
/* Table: t_role_tree                                           */
/*==============================================================*/
create table t_role_tree
(
   roleTreeId           varchar(32) not null comment '��ɫ�˵�������ˮID',
   roleId               varchar(32) comment '��ɫID',
   treeId               int comment '�˵�ID',
   primary key (roleTreeId)
);

/*==============================================================*/
/* Table: t_tree                                                */
/*==============================================================*/
create table t_tree
(
   treeId               int not null auto_increment comment '�˵���ˮID',
   treeName             varchar(100) comment '�˵�����',
   treeCode             varchar(100) comment '�˵�����',
   treeState            varchar(10) comment '�˵�״̬��1�����ã�2�����á�',
   treeType             varchar(10) comment '�˵����͡�1���˵��ڵ㣻2����ť�ڵ㡿',
   parentTreeId         int comment '���ڵ���',
   parentTreeName       varchar(100) comment '���ڵ�����',
   crtDate              datetime comment '����ʱ��',
   fullPath             varchar(255) comment '�˵���ˮ����·��(1.2.3)',
   primary key (treeId)
);

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   userId               varchar(32) not null comment '�û���ˮID',
   loginAccount         varchar(100) comment '�û���¼�˺�',
   loginPassword        varchar(32) comment '�û���¼����',
   crtDate              datetime comment '����ʱ��',
   nickName             varchar(100) comment '��ʵ����',
   lastLoginDate        datetime comment '����¼ʱ��',
   token                varchar(32) comment '��¼��token',
   headImg              varchar(100) comment '�û�ͷ��ͼƬ��ַ',
   primary key (userId)
);

/*==============================================================*/
/* Table: t_user_org                                            */
/*==============================================================*/
create table t_user_org
(
   userOrgId            varchar(32) not null comment '�û���֯������ˮID',
   userId               varchar(32) comment '�û���ˮID',
   orgId                int comment '��֯��ˮID',
   primary key (userOrgId)
);

/*==============================================================*/
/* Table: t_user_role                                           */
/*==============================================================*/
create table t_user_role
(
   userRoleId           varchar(32) not null comment '�û���ɫ������ˮID',
   userId               varchar(32) comment '�û�ID',
   roleId               varchar(32) comment '��ɫID',
   primary key (userRoleId)
);

