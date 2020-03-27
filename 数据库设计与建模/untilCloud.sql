/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/3/27 19:32:03                           */
/*==============================================================*/


drop table if exists button;

drop table if exists dictionary_data;

drop table if exists dictionary_type;

drop table if exists meun;

drop table if exists role;

drop table if exists role_menu;

drop table if exists user_auths;

drop table if exists users;

/*==============================================================*/
/* Table: button                                                */
/*==============================================================*/
create table button
(
   button_id            int not null auto_increment,
   button_name          varchar(20),
   button_code          varchar(20),
   primary key (button_id)
);

/*==============================================================*/
/* Table: dictionary_data                                       */
/*==============================================================*/
create table dictionary_data
(
   dictionary_data_id   int not null auto_increment,
   dictionary_type_id   int,
   key                  varchar(20),
   value                varchar(20),
   order_number         int,
   is_default           tinyint,
   create_time          datetime,
   creator              varchar(20),
   modify_time          datetime,
   modifier             varchar(20),
   primary key (dictionary_data_id)
);

/*==============================================================*/
/* Table: dictionary_type                                       */
/*==============================================================*/
create table dictionary_type
(
   dictionary_type_id   int not null auto_increment,
   type_name            varchar(20),
   create_time          datetime,
   creator              varchar(20),
   modify_time          datetime,
   modifier             varchar(20),
   primary key (dictionary_type_id)
);

/*==============================================================*/
/* Table: meun                                                  */
/*==============================================================*/
create table meun
(
   menu_id              int not null auto_increment,
   parent_id            int,
   menu_name            varchar(20),
   menu_icon            varchar(50),
   menu_address         varchar(50),
   is_menu              tinyint,
   is_page              tinyint,
   create_time          datetime,
   creator              varchar(20),
   modify_time          datetime,
   modifier             varchar(20),
   primary key (menu_id)
);

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   role_id              int not null auto_increment,
   role_name            varchar(20),
   role_description     varchar(50),
   is_enabled           tinyint,
   create_time          datetime,
   creator              varchar(20),
   modify_time          datetime,
   modifier             varchar(20),
   primary key (role_id)
);

/*==============================================================*/
/* Table: role_menu                                             */
/*==============================================================*/
create table role_menu
(
   role_menu_id         int not null auto_increment,
   role_id              int,
   menu_id              int,
   primary key (role_menu_id)
);

/*==============================================================*/
/* Table: user_auths                                            */
/*==============================================================*/
create table user_auths
(
   user_auths_id        int not null auto_increment,
   user_id              int,
   identity_type        varchar(50),
   identifier           varchar(50),
   credential           varchar(100),
   verified             tinyint,
   primary key (user_auths_id)
);

/*==============================================================*/
/* Table: users                                                 */
/*==============================================================*/
create table users
(
   user_id              int not null auto_increment,
   role_id              int,
   username             varchar(20),
   nickname             varchar(20),
   sex                  varchar(10),
   student_number       int,
   school               varchar(20),
   department           varchar(20),
   phone                int,
   email                varchar(30),
   æ≠—È÷µ                  int,
   primary key (user_id)
);

alter table dictionary_data add constraint FK_Reference_1 foreign key (dictionary_type_id)
      references dictionary_type (dictionary_type_id) on delete restrict on update restrict;

alter table meun add constraint FK_Reference_2 foreign key (parent_id)
      references meun (menu_id) on delete restrict on update restrict;

alter table role_menu add constraint FK_Reference_3 foreign key (role_id)
      references role (role_id) on delete restrict on update restrict;

alter table role_menu add constraint FK_Reference_4 foreign key (menu_id)
      references meun (menu_id) on delete restrict on update restrict;

alter table user_auths add constraint FK_Reference_6 foreign key (user_id)
      references users (user_id) on delete restrict on update restrict;

alter table users add constraint FK_Reference_5 foreign key (role_id)
      references role (role_id) on delete restrict on update restrict;

