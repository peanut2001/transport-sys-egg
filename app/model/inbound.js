'use strict';

module.exports = app => {
  const { STRING, INTEGER, DATE } = app.Sequelize;

  const Inbound = app.model.define('inbound', {
    id: {
      type: INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    inboundNo: {
      type: STRING(32),
      allowNull: false,
      unique: true,
      comment: '入库单号',
    },
    warehouseName: {
      type: STRING(50),
      allowNull: false,
      comment: '仓库名称',
    },
    cargoName: {
      type: STRING(100),
      allowNull: false,
      comment: '货物名称',
    },
    cargoType: {
      type: STRING(50),
      comment: '货物类型',
    },
    quantity: {
      type: INTEGER,
      allowNull: false,
      defaultValue: 0,
      comment: '数量',
    },
    unit: {
      type: STRING(10),
      defaultValue: '件',
      comment: '单位',
    },
    supplier: {
      type: STRING(100),
      comment: '供应商',
    },
    status: {
      type: STRING(1),
      allowNull: false,
      defaultValue: '1',
      comment: '状态（1已入库 0待入库）',
    },
    inboundTime: {
      type: DATE,
      comment: '入库时间',
    },
    remark: {
      type: STRING(255),
      comment: '备注',
    },
    createdAt: DATE,
    createdBy: STRING,
    updatedAt: DATE,
    updatedBy: STRING,
  });

  return Inbound;
};
