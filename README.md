# transport-sys-egg

## 描述

transport-sys-egg为前后端分离的物流管理系统。

## 技术栈

后端技术栈：egg.js + mysql + sequelize + jwt 等

前端技术栈：vue3 + vite + ant-design-vue + pinia + tailwindcss等

前端项目地址：

### 环境

node版本8以上

MySQL数据库

### 项目运行

**项目有两个分支，master分支包含一个后台管理系统的基础功能，feature-oa分支除了系统管理外还包含基础数据，财务数据，审核管理等模块**

```bash
git clone https://gitee.com/caiheping/transport-sys-egg.git
cd transport-sys-egg
npm install
```

然后修改config/config.default.js和database/config.json（如果你不是sequelize的命令生成数据的话，这个改不改都行）下自己的数据库用户名和密码

创建数据库egg-oa-sys

master分支运行：在egg-oa-sys数据库下导入项目根目录下 egg-oa-sys.sql 文件

feature-oa分支运行：在egg-oa-sys数据库下导入项目根目录下 egg-oa-sys-2021-09-17-基础功能完成.sql 文件

**备注：切换分支时要把数据库清空，重新导入对应分支的sql文件**

运行项目

> npm run dev





### 目录结构

```bash
transport-sys-egg
├─ apidoc					// 接口文档
├─ app
|	├─ controller			// 用于解析用户的输入，处理后返回相应的结果
|	├─ extend				// 用于框架的扩展
|	├─ middleware			// 用于编写中间件
|	├─ model				// 用于放置领域模型
|	├─ public				// 用于放置静态资源
|	├─ rules				// 参数校验文件
|	├─ schedule				// 用于定时任务，可选，具体参见定时任务
|	├─ service				// 用于编写业务逻辑层，可选，建议使用
|	├─ utils				// 工具文件
|	├─ router.js				// 用于配置 URL 路由规则
├─ config
|	├─ config.default.js	// 用于编写配置文件
|	├─ plugin.js			// 用于配置需要加载的插件
├─ database
|	├─ migrations			// 数据库迁移文件
|	├─ seeders				// 种子文件
|	├─ config.json				// sequelize 配置文件
├─ logs						// 日志文件
├─ run
├─ test
├─ typings
├─ www						// 前端打包文件
...
```


**后台接口文档在apidoc目录下**




## 功能模块

**master分支**

- [x] 登录 -- 完成
- [ ] 首页 -- 待定
- [x] 系统布局配置 -- 完成
- [x] 系统管理 =》用户中心 -- 完成
- [x] 系统管理 =》角色管理 -- 完成
- [x] 系统管理 =》菜单管理 -- 完成
- [x] 系统管理 =》部门管理 -- 完成
- [x] 系统管理 =》字典管理 -- 完成
- [x] 系统管理 =》消息公告 -- 完成
- [x] 个人中心 =》头像上传 -- 完成

**feature-oa**

- [x] 登录 -- 完成
- [ ] 首页 -- 待定
- [x] 系统布局配置 -- 完成
- [x] 国际化（中英文切换）-- 完成
- [x] 系统管理 =》用户中心 -- 完成
- [x] 系统管理 =》角色管理 -- 完成
- [x] 系统管理 =》菜单管理 -- 完成
- [x] 系统管理 =》部门管理 -- 完成
- [x] 系统管理 =》字典管理 -- 完成
- [x] 系统管理 =》消息公告 -- 完成
- [x] 个人中心 =》头像上传 -- 完成
- [x] 系统管理 =》系统配置 -- 完成
- [x] 系统管理 =》系统日志 -- 完成
- [x] 基础数据 =》打卡详情 -- 完成
- [x] 基础数据 =》工作日设置 -- 完成
- [x] 基础数据 =》员工假期详情 -- 完成
- [x] 财务数据 =》工资详情 -- 完成
- [x] 审批管理 =》出差申请 -- 完成
- [x] 审批管理 =》补卡申请 -- 完成
- [x] 审批管理 =》请假申请 -- 完成
- [x] 审批管理 =》 加班申请 -- 完成

如果对您有帮助，您可以点右上角 "Star" 支持一下 谢谢！ ^_^
