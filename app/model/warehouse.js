'use strict';

module.exports = app => {
  const { STRING, INTEGER, DATE, TEXT } = app.Sequelize;

  const Warehouse = app.model.define('warehouse', {
    id: {
      type: INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    warehouseName: {
      type: STRING(50),
      allowNull: false,
      unique: true,
      comment: '仓库名称'
    },
    address: {
      type: STRING(200),
      allowNull: false,
      comment: '仓库地址'
    },
    capacity: {
      type: INTEGER,
      allowNull: false,
      defaultValue: 0,
      comment: '仓库容量'
    },
    usedCapacity: {
      type: INTEGER,
      allowNull: false,
      defaultValue: 0,
      comment: '已用容量'
    },
    manager: {
      type: STRING(20),
      comment: '仓库管理员'
    },
    phone: {
      type: STRING(20),
      comment: '联系电话'
    },
    status: {
      type: STRING(1),
      allowNull: false,
      defaultValue: '1',
      comment: '状态（0停用 1正常）'
    },
    remark: {
      type: TEXT,
      comment: '备注'
    },
    createdAt: DATE,
    updatedAt: DATE
  });

  return Warehouse;
}; 