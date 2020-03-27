## 到云 - 数据库设计参考

**权限（菜单） Permission**

| name             | code             | datatype      | else |
| ---------------- | ---------------- | ------------- | ---- |
| 编号             | Id               | int           | 主键 |
| 上级菜单编号     | ParentId         | int           | 外键 |
| 菜单名称         | MenuName         | nvarchar(64)  |      |
| 是否显示         | IsDisplay        | int           |      |
| 是否页面         | isPage           | int           |      |
| 菜单地址         | MenuPath         | nvarchar(256) |      |
| 菜单图标         | MenuIcon         | image         |      |
| 创建时间         | CreationDate     | date          |      |
| 创建者           | Creator          | int           |      |
| 最后一次修改时间 | ModificationDate | date          |      |
| 最后一次修改者   | Modifier         | int           |      |

**字典 Dictionary**

| name | code | datatype    | else |
| ---- | ---- | ----------- | ---- |
| 编号 | Id   | int         | 主键 |
| 名称 | Name | nvarchar(64) |      |
| 编码 | Code | nvarchar(64) |      |

**字典明细 DictionaryDetail**

| name             | code             | datatype    | else                 |
| ---------------- | ---------------- | ----------- | -------------------- |
| 编号             | Id               | int         | 主键                 |
| 字典编号         | DictionaryId     | int         | 外键                 |
| 编码             | Code             | nvarchar(64) | 冗余，同字典表的编码 |
| 关键字           | Key              | nvarchar(64) |                      |
| 值               | Value            | nvarchar(64) |                      |
| 序号             | Order            | int         | 下拉列表中出现的位置 |
| 是否默认值       | IsDefault        | int         |                      |
| 创建时间         | CreationDate     | date        |                      |
| 创建者           | Creator          | int         |                      |
| 最后一次修改时间 | ModificationDate | date        |                      |
| 最后一次修改者   | Modifier         | int         |                      |

**角色 Role**

| name | code | datatype | else |
| ---- | ---- | -------- | ---- |
| 编号 | Id   | int      | 主键 |
| 名称 | Name | nvarchar(64) |      |
| 描述 | Description | nvarchar(256) |      |
| 创建时间         | CreationDate     | date        |                      |
| 创建者           | Creator          | int         |                      |
| 最后一次修改时间 | ModificationDate | date        |                      |
| 最后一次修改者   | Modifier         | int         |                      |

**角色权限 RolePermission**

| name     | code         | datatype | else |
| -------- | ------------ | -------- | ---- |
| 编号     | Id           | int      | 主键 |
| 角色编号 | RoleId       | int      | 外键 |
| 权限编号 | PermissionId | int      | 外键 |
| 创建时间         | CreationDate     | date        |                      |
| 创建者           | Creator          | int         |                      |
| 最后一次修改时间 | ModificationDate | date        |                      |
| 最后一次修改者   | Modifier         | int         |                      |

**用户 User**

| name     | code     | datatype | else |
| -------- | -------- | -------- | ---- |
| 编号     | Id       | int      | 主键 |
| 昵称             | Nickname         | nvarchar(64) |      |
| 头像             | Avatar           | image |      |
| 手机号           | Phone            | nvarchar(16) |      |
| 电子邮箱         | Email            | nvarchar(64) | |
| 状态（是否正常） | IsNormal   | nvarchar(4) |      |
| 学校             | School           | nvarchar(64) |      |
| 学院             | College          | nvarchar(64) |      |
| 系别             | Department       | nvarchar(64) |      |
| 更多信息         | ExtendJSON       | nvarchar(256) | |
| 登录时间 | LoginDate | date |      |
| 创建时间         | CreationDate     | date        |                      |
| 创建者           | Creator          | int         |                      |
| 最后一次修改时间 | ModificationDate | date        |                      |
| 最后一次修改者   | Modifier         | int         |                      |

**用户授权 UserAuthorization**

| name         | code         | datatype | else |
| ------------ | ------------ | -------- | ---- |
| 编号         | Id           | int      | 主键 |
| 用户编号     | UserId       | int      | 外键 |
| 登录类型     | IdentityType | nvarchar(64) | 手机号/邮箱/用户名或第三方应用名称（微信等） |
| 登录标识     | Identifier   | nvarchar(64) |  |
| 登录密码凭证 | Credential   | nvarchar(64) |      |
| 创建时间         | CreationDate     | date        |                      |
| 创建者           | Creator          | int         |                      |
| 最后一次修改时间 | ModificationDate | date        |                      |
| 最后一次修改者   | Modifier         | int         |                      |

**用户角色 UserRole**

| name     | code         | datatype | else |
| -------- | ------------ | -------- | ---- |
| 编号     | Id           | int      | 主键 |
| 用户编号 | UserId       | int      | 外键 |
| 角色编号 | RoleId | int      | 外键 |
| 创建时间         | CreationDate     | date        |                      |
| 创建者           | Creator          | int         |                      |
| 最后一次修改时间 | ModificationDate | date        |                      |
| 最后一次修改者   | Modifier         | int         |                      |

