-- Adminer 4.7.8 PostgreSQL dump

DROP TABLE IF EXISTS "auth_group";
DROP SEQUENCE IF EXISTS auth_group_id_seq;
CREATE SEQUENCE auth_group_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_group" (
    "id" integer DEFAULT nextval('auth_group_id_seq') NOT NULL,
    "name" character varying(150) NOT NULL,
    CONSTRAINT "auth_group_name_key" UNIQUE ("name"),
    CONSTRAINT "auth_group_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "auth_group_name_a6ea08ec_like" ON "public"."auth_group" USING btree ("name");


DROP TABLE IF EXISTS "auth_group_permissions";
DROP SEQUENCE IF EXISTS auth_group_permissions_id_seq;
CREATE SEQUENCE auth_group_permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_group_permissions" (
    "id" integer DEFAULT nextval('auth_group_permissions_id_seq') NOT NULL,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL,
    CONSTRAINT "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" UNIQUE ("group_id", "permission_id"),
    CONSTRAINT "auth_group_permissions_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "public"."auth_group_permissions" USING btree ("group_id");

CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "public"."auth_group_permissions" USING btree ("permission_id");


DROP TABLE IF EXISTS "auth_permission";
DROP SEQUENCE IF EXISTS auth_permission_id_seq;
CREATE SEQUENCE auth_permission_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_permission" (
    "id" integer DEFAULT nextval('auth_permission_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" character varying(100) NOT NULL,
    CONSTRAINT "auth_permission_content_type_id_codename_01ab375a_uniq" UNIQUE ("content_type_id", "codename"),
    CONSTRAINT "auth_permission_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "public"."auth_permission" USING btree ("content_type_id");

INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES
(1,	'Can add log entry',	1,	'add_logentry'),
(2,	'Can change log entry',	1,	'change_logentry'),
(3,	'Can delete log entry',	1,	'delete_logentry'),
(4,	'Can view log entry',	1,	'view_logentry'),
(5,	'Can add permission',	2,	'add_permission'),
(6,	'Can change permission',	2,	'change_permission'),
(7,	'Can delete permission',	2,	'delete_permission'),
(8,	'Can view permission',	2,	'view_permission'),
(9,	'Can add group',	3,	'add_group'),
(10,	'Can change group',	3,	'change_group'),
(11,	'Can delete group',	3,	'delete_group'),
(12,	'Can view group',	3,	'view_group'),
(13,	'Can add user',	4,	'add_user'),
(14,	'Can change user',	4,	'change_user'),
(15,	'Can delete user',	4,	'delete_user'),
(16,	'Can view user',	4,	'view_user'),
(17,	'Can add content type',	5,	'add_contenttype'),
(18,	'Can change content type',	5,	'change_contenttype'),
(19,	'Can delete content type',	5,	'delete_contenttype'),
(20,	'Can view content type',	5,	'view_contenttype'),
(21,	'Can add session',	6,	'add_session'),
(22,	'Can change session',	6,	'change_session'),
(23,	'Can delete session',	6,	'delete_session'),
(24,	'Can view session',	6,	'view_session'),
(25,	'Can add todo',	7,	'add_todo'),
(26,	'Can change todo',	7,	'change_todo'),
(27,	'Can delete todo',	7,	'delete_todo'),
(28,	'Can view todo',	7,	'view_todo');

DROP TABLE IF EXISTS "auth_user";
DROP SEQUENCE IF EXISTS auth_user_id_seq;
CREATE SEQUENCE auth_user_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_user" (
    "id" integer DEFAULT nextval('auth_user_id_seq') NOT NULL,
    "password" character varying(128) NOT NULL,
    "last_login" timestamptz,
    "is_superuser" boolean NOT NULL,
    "username" character varying(150) NOT NULL,
    "first_name" character varying(150) NOT NULL,
    "last_name" character varying(150) NOT NULL,
    "email" character varying(254) NOT NULL,
    "is_staff" boolean NOT NULL,
    "is_active" boolean NOT NULL,
    "date_joined" timestamptz NOT NULL,
    CONSTRAINT "auth_user_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_user_username_key" UNIQUE ("username")
) WITH (oids = false);

CREATE INDEX "auth_user_username_6821ab7c_like" ON "public"."auth_user" USING btree ("username");


DROP TABLE IF EXISTS "auth_user_groups";
DROP SEQUENCE IF EXISTS auth_user_groups_id_seq;
CREATE SEQUENCE auth_user_groups_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_user_groups" (
    "id" integer DEFAULT nextval('auth_user_groups_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL,
    CONSTRAINT "auth_user_groups_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_user_groups_user_id_group_id_94350c0c_uniq" UNIQUE ("user_id", "group_id"),
    CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_user_groups_group_id_97559544" ON "public"."auth_user_groups" USING btree ("group_id");

CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "public"."auth_user_groups" USING btree ("user_id");


DROP TABLE IF EXISTS "auth_user_user_permissions";
DROP SEQUENCE IF EXISTS auth_user_user_permissions_id_seq;
CREATE SEQUENCE auth_user_user_permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_user_user_permissions" (
    "id" integer DEFAULT nextval('auth_user_user_permissions_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL,
    CONSTRAINT "auth_user_user_permissions_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" UNIQUE ("user_id", "permission_id"),
    CONSTRAINT "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "public"."auth_user_user_permissions" USING btree ("permission_id");

CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "public"."auth_user_user_permissions" USING btree ("user_id");


DROP TABLE IF EXISTS "django_admin_log";
DROP SEQUENCE IF EXISTS django_admin_log_id_seq;
CREATE SEQUENCE django_admin_log_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."django_admin_log" (
    "id" integer DEFAULT nextval('django_admin_log_id_seq') NOT NULL,
    "action_time" timestamptz NOT NULL,
    "object_id" text,
    "object_repr" character varying(200) NOT NULL,
    "action_flag" smallint NOT NULL,
    "change_message" text NOT NULL,
    "content_type_id" integer,
    "user_id" integer NOT NULL,
    CONSTRAINT "django_admin_log_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "public"."django_admin_log" USING btree ("content_type_id");

CREATE INDEX "django_admin_log_user_id_c564eba6" ON "public"."django_admin_log" USING btree ("user_id");


DROP TABLE IF EXISTS "django_content_type";
DROP SEQUENCE IF EXISTS django_content_type_id_seq;
CREATE SEQUENCE django_content_type_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."django_content_type" (
    "id" integer DEFAULT nextval('django_content_type_id_seq') NOT NULL,
    "app_label" character varying(100) NOT NULL,
    "model" character varying(100) NOT NULL,
    CONSTRAINT "django_content_type_app_label_model_76bd3d3b_uniq" UNIQUE ("app_label", "model"),
    CONSTRAINT "django_content_type_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES
(1,	'admin',	'logentry'),
(2,	'auth',	'permission'),
(3,	'auth',	'group'),
(4,	'auth',	'user'),
(5,	'contenttypes',	'contenttype'),
(6,	'sessions',	'session'),
(7,	'todos',	'todo');

DROP TABLE IF EXISTS "django_migrations";
DROP SEQUENCE IF EXISTS django_migrations_id_seq;
CREATE SEQUENCE django_migrations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."django_migrations" (
    "id" integer DEFAULT nextval('django_migrations_id_seq') NOT NULL,
    "app" character varying(255) NOT NULL,
    "name" character varying(255) NOT NULL,
    "applied" timestamptz NOT NULL,
    CONSTRAINT "django_migrations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES
(1,	'contenttypes',	'0001_initial',	'2021-02-03 00:33:34.90525+00'),
(2,	'auth',	'0001_initial',	'2021-02-03 00:33:34.984474+00'),
(3,	'admin',	'0001_initial',	'2021-02-03 00:33:35.054668+00'),
(4,	'admin',	'0002_logentry_remove_auto_add',	'2021-02-03 00:33:35.073961+00'),
(5,	'admin',	'0003_logentry_add_action_flag_choices',	'2021-02-03 00:33:35.08616+00'),
(6,	'contenttypes',	'0002_remove_content_type_name',	'2021-02-03 00:33:35.107953+00'),
(7,	'auth',	'0002_alter_permission_name_max_length',	'2021-02-03 00:33:35.12116+00'),
(8,	'auth',	'0003_alter_user_email_max_length',	'2021-02-03 00:33:35.134496+00'),
(9,	'auth',	'0004_alter_user_username_opts',	'2021-02-03 00:33:35.146564+00'),
(10,	'auth',	'0005_alter_user_last_login_null',	'2021-02-03 00:33:35.159837+00'),
(11,	'auth',	'0006_require_contenttypes_0002',	'2021-02-03 00:33:35.163047+00'),
(12,	'auth',	'0007_alter_validators_add_error_messages',	'2021-02-03 00:33:35.174717+00'),
(13,	'auth',	'0008_alter_user_username_max_length',	'2021-02-03 00:33:35.194053+00'),
(14,	'auth',	'0009_alter_user_last_name_max_length',	'2021-02-03 00:33:35.209016+00'),
(15,	'auth',	'0010_alter_group_name_max_length',	'2021-02-03 00:33:35.224181+00'),
(16,	'auth',	'0011_update_proxy_permissions',	'2021-02-03 00:33:35.234956+00'),
(17,	'auth',	'0012_alter_user_first_name_max_length',	'2021-02-03 00:33:35.246586+00'),
(18,	'sessions',	'0001_initial',	'2021-02-03 00:33:35.256429+00'),
(19,	'todos',	'0001_initial',	'2021-02-03 00:33:35.274428+00');

DROP TABLE IF EXISTS "django_session";
CREATE TABLE "public"."django_session" (
    "session_key" character varying(40) NOT NULL,
    "session_data" text NOT NULL,
    "expire_date" timestamptz NOT NULL,
    CONSTRAINT "django_session_pkey" PRIMARY KEY ("session_key")
) WITH (oids = false);

CREATE INDEX "django_session_expire_date_a5c62663" ON "public"."django_session" USING btree ("expire_date");

CREATE INDEX "django_session_session_key_c0390e0f_like" ON "public"."django_session" USING btree ("session_key");


DROP TABLE IF EXISTS "todos_todo";
DROP SEQUENCE IF EXISTS todos_todo_id_seq;
CREATE SEQUENCE todos_todo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."todos_todo" (
    "id" integer DEFAULT nextval('todos_todo_id_seq') NOT NULL,
    "content" text NOT NULL,
    CONSTRAINT "todos_todo_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

-- 2021-02-03 02:39:18.483002+00
