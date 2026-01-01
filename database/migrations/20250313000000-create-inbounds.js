'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const { INTEGER, DATE, STRING } = Sequelize;
    await queryInterface.createTable('inbounds', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: INTEGER,
      },
      inboundNo: {
        allowNull: false,
        unique: true,
        type: STRING(32),
        comment: '入库单号',
      },
      warehouseName: {
        allowNull: false,
        type: STRING(50),
        comment: '仓库名称',
      },
      cargoName: {
        allowNull: false,
        type: STRING(100),
        comment: '货物名称',
      },
      cargoType: {
        type: STRING(50),
        comment: '货物类型',
      },
      quantity: {
        allowNull: false,
        type: INTEGER,
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
        allowNull: false,
        type: STRING(1),
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
      createdAt: {
        allowNull: true,
        type: DATE,
      },
      createdBy: {
        allowNull: true,
        type: STRING,
      },
      updatedAt: {
        allowNull: true,
        type: DATE,
      },
      updatedBy: {
        allowNull: true,
        type: STRING,
      },
    });
  },
  down: async queryInterface => {
    await queryInterface.dropTable('inbounds');
  },
};
