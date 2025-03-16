'use strict';

const BaseService = require('../../base');
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

class WarehouseService extends BaseService {
  constructor(ctx) {
    super(ctx);
    this.modelName = 'Warehouse';
  }

  // 获取仓库列表（支持分页和搜索）
  async getWarehouseList(query) {
    const { page = 1, pageSize = 10, warehouseName, status, address } = query;
    
    const where = {};
    // 仓库名称模糊搜索
    if (warehouseName) {
      where.warehouseName = {
        [Op.like]: `%${warehouseName}%`
      };
    }
    // 状态筛选
    if (status) {
      where.status = status;
    }
    // 地址模糊搜索
    if (address) {
      where.address = {
        [Op.like]: `%${address}%`
      };
    }

    try {
      const result = await this.ctx.model.Warehouse.findAndCountAll({
        where,
        limit: parseInt(pageSize),
        offset: (page - 1) * pageSize,
        order: [['createdAt', 'DESC']],
        attributes: [
          'id', 
          'warehouseName', 
          'address', 
          'capacity',
          'usedCapacity',
          'manager',
          'phone',
          'status',
          'remark',
          'createdAt',
          'updatedAt'
        ]
      });

      return {
        list: result.rows,
        total: result.count,
        page: parseInt(page),
        pageSize: parseInt(pageSize)
      };
    } catch (error) {
      throw new Error('获取仓库列表失败：' + error.message);
    }
  }

  // 创建仓库
  async createWarehouse(data) {
    try {
      // 检查仓库名是否重复
      const exists = await this.ctx.model.Warehouse.findOne({
        where: { warehouseName: data.warehouseName }
      });

      if (exists) {
        throw new Error('仓库名称已存在');
      }

      const result = await this.ctx.model.Warehouse.create({
        warehouseName: data.warehouseName,
        address: data.address,
        capacity: data.capacity,
        usedCapacity: 0, // 初始已用容量为0
        manager: data.manager,
        phone: data.phone,
        status: data.status || '1', // 默认启用
        remark: data.remark
      });

      return result;
    } catch (error) {
      throw new Error('创建仓库失败：' + error.message);
    }
  }

  // 更新仓库信息
  async updateWarehouse(id, data) {
    try {
      // 检查仓库是否存在
      const warehouse = await this.ctx.model.Warehouse.findByPk(id);
      if (!warehouse) {
        throw new Error('仓库不存在');
      }

      // 如果修改仓库名，检查是否与其他仓库重名
      if (data.warehouseName && data.warehouseName !== warehouse.warehouseName) {
        const exists = await this.ctx.model.Warehouse.findOne({
          where: {
            warehouseName: data.warehouseName,
            id: { [Op.ne]: id }
          }
        });
        if (exists) {
          throw new Error('仓库名称已存在');
        }
      }

      // 更新仓库信息
      const result = await warehouse.update({
        warehouseName: data.warehouseName,
        address: data.address,
        capacity: data.capacity,
        manager: data.manager,
        phone: data.phone,
        status: data.status,
        remark: data.remark
      });

      return result;
    } catch (error) {
      throw new Error('更新仓库信息失败：' + error.message);
    }
  }

  // 删除仓库
  async deleteWarehouse(ids) {
    try {
      // 检查仓库是否存在库存
      const warehouses = await this.ctx.model.Warehouse.findAll({
        where: {
          id: { [Op.in]: Array.isArray(ids) ? ids : [ids] },
          usedCapacity: { [Op.gt]: 0 }
        }
      });

      if (warehouses.length > 0) {
        throw new Error('存在库存的仓库无法删除');
      }

      const result = await this.ctx.model.Warehouse.destroy({
        where: {
          id: { [Op.in]: Array.isArray(ids) ? ids : [ids] }
        }
      });

      return result;
    } catch (error) {
      throw new Error('删除仓库失败：' + error.message);
    }
  }

  // 获取仓库详情
  async getWarehouseDetail(id) {
    try {
      const warehouse = await this.ctx.model.Warehouse.findByPk(id);
      if (!warehouse) {
        throw new Error('仓库不存在');
      }
      return warehouse;
    } catch (error) {
      throw new Error('获取仓库详情失败：' + error.message);
    }
  }

  // 更新仓库状态
  async updateWarehouseStatus(id, status) {
    try {
      const warehouse = await this.ctx.model.Warehouse.findByPk(id);
      if (!warehouse) {
        throw new Error('仓库不存在');
      }

      // 如果要禁用仓库，检查是否存在库存
      if (status === '0' && warehouse.usedCapacity > 0) {
        throw new Error('仓库存在库存，无法禁用');
      }

      const result = await warehouse.update({ status });
      return result;
    } catch (error) {
      throw new Error('更新仓库状态失败：' + error.message);
    }
  }

  // 获取可用仓库列表（用于下拉选择）
  async getAvailableWarehouses() {
    try {
      const warehouses = await this.ctx.model.Warehouse.findAll({
        where: { status: '1' },
        attributes: ['id', 'warehouseName', 'capacity', 'usedCapacity'],
        order: [['warehouseName', 'ASC']]
      });
      return warehouses;
    } catch (error) {
      throw new Error('获取可用仓库列表失败：' + error.message);
    }
  }

  // 获取仓库容量
  async getWarehouseCapacity(id) {
    const warehouse = await this.ctx.model.Warehouse.findByPk(id);
    return warehouse.capacity;
  }


  //获取当前已有仓库
  async getCurrentWarehouse() {
    const warehouses = await this.ctx.model.Warehouse.findAll({
      where: { status: '1' },
      attributes: ['id', 'warehouseName', 'capacity', 'usedCapacity'],
      order: [['warehouseName', 'ASC']]
    });
    return warehouses;
  }
}

module.exports = WarehouseService; 