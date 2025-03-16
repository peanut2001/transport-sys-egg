'use strict';

module.exports = app => {
  const { router, controller } = app;
  /**
   * 后台管理系统模块
  */
  // 特殊处理
  router.post(`/api/${app.config.public}/login`, controller[app.config.public].admin.system.common.login); // 登录
  router.post(`/api/${app.config.public}/logout`, controller[app.config.public].admin.system.common.logout); // 登出
  router.get(`/api/${app.config.public}/captcha`, controller[app.config.public].admin.system.common.captcha); // 验证码
  router.post(`/api/${app.config.public}/upload`, controller[app.config.public].admin.system.common.upload); // 上传
  router.get(`/api/${app.config.public}/admin/system/getInfo`, controller[app.config.public].admin.system.user.getInfo); // 获取用户信息
  router.put(`/api/${app.config.public}/admin/system/user/:id/resetPwd`, app.middleware.auth({
    put: 'system:user:resetPwd',
  }), controller[app.config.public].admin.system.common.resetPwd); // 重置密码
  router.put(`/api/${app.config.public}/admin/system/user/:id/updateUserImg`, app.middleware.auth({
    put: 'system:user:updateUserImg',
  }), controller[app.config.public].admin.system.common.updateUserImg); // 修改头像
  router.put(`/api/${app.config.public}/admin/system/user/:id/updateUserPwd`, app.middleware.auth({
    put: 'system:user:updateUserPwd',
  }), controller[app.config.public].admin.system.common.updateUserPwd); // 修改密码
  router.get(`/api/${app.config.public}/admin/system/showByType/:dictType`, controller[app.config.public].admin.system.dictData.showByType); // 字典查询
  router.get(`/api/${app.config.public}/admin/system/menu/userMenu`, controller[app.config.public].admin.system.menu.userMenu); // 用户菜单
  router.put(`/api/${app.config.public}/admin/system/role/changeRoleStatus`, app.middleware.auth({
    put: 'system:role:changeRoleStatus',
  }), controller[app.config.public].admin.system.role.changeRoleStatus); // 修改角色状态
  router.delete(`/api/${app.config.public}/admin/system/logs/deleteAllLogs`, app.middleware.auth({
    delete: 'system:logs:deleteAllLogs',
  }), controller[app.config.public].admin.system.logs.deleteAllLogs); // 清空所有日志


  /**
   * 系统模块
   */
  router.resources('user', `/api/${app.config.public}/admin/system/user`, app.middleware.auth({
    get: 'system:user:list',
    post: 'system:user:add',
    put: 'system:user:update',
    delete: 'system:user:delete',
  }), controller[app.config.public].admin.system.user); // 用户路由


  
  router.resources('role', `/api/${app.config.public}/admin/system/role`, app.middleware.auth({
    get: 'system:role:list',
    post: 'system:role:add',
    put: 'system:role:update',
    delete: 'system:role:delete',
  }), controller[app.config.public].admin.system.role); // 角色路由
  router.resources('menu', `/api/${app.config.public}/admin/system/menu`, app.middleware.auth({
    get: 'system:menu:list',
    post: 'system:menu:add',
    put: 'system:menu:update',
    delete: 'system:menu:delete',
  }), controller[app.config.public].admin.system.menu); // 菜单路由
  router.resources('department', `/api/${app.config.public}/admin/system/department`, app.middleware.auth({
    get: 'system:department:list',
    post: 'system:department:add',
    put: 'system:department:update',
    delete: 'system:department:delete',
  }), controller[app.config.public].admin.system.department); // 部门路由
  router.resources('dictType', `/api/${app.config.public}/admin/system/dictType`, app.middleware.auth({
    get: 'system:dictType:list',
    post: 'system:dictType:add',
    put: 'system:dictType:update',
    delete: 'system:dictType:delete',
  }), controller[app.config.public].admin.system.dictType); // 字典类型路由
  router.resources('dictData', `/api/${app.config.public}/admin/system/dictData`, app.middleware.auth({
    get: 'system:dictData:list',
    post: 'system:dictData:add',
    put: 'system:dictData:update',
    delete: 'system:dictData:delete',
  }), controller[app.config.public].admin.system.dictData); // 字典数据路由
  router.resources('notice', `/api/${app.config.public}/admin/system/notice`, app.middleware.auth({
    get: 'system:notice:list',
    post: 'system:notice:add',
    put: 'system:notice:update',
    delete: 'system:notice:delete',
  }), controller[app.config.public].admin.system.notice); // 通告数据路由
  router.resources('logs', `/api/${app.config.public}/admin/system/logs`, app.middleware.auth({
    get: 'system:logs:list',
    post: 'system:logs:add',
    put: 'system:logs:update',
    delete: 'system:logs:delete',
  }), controller[app.config.public].admin.system.logs); // 系统日志路由

  // 仓库管理路由
  router.resources('warehouse', `/api/${app.config.public}/admin/system/warehouse`, app.middleware.auth({
    get: 'system:warehouse:list',
    post: 'system:warehouse:add',
    put: 'system:warehouse:update',
    delete: 'system:warehouse:delete',
  }), controller[app.config.public].admin.system.warehouse);
};
