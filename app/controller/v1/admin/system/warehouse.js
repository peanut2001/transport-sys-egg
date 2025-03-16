'use strict';

const Controller = require('egg').Controller;
const { Op } = require('sequelize');

class WarehouseController extends Controller {
    /**
     * @summary 获取仓库列表
     * @description 获取仓库列表，支持分页、搜索、筛选
     */
    async index() {
        const { ctx } = this;
        const {
            page = 1,
            pageSize = 10,
            warehouseName,
            status,
            manager,
            startTime,
            endTime
        } = ctx.query;

        // 构建查询条件
        const where = {};

        // 仓库名称模糊查询
        if (warehouseName) {
            where.warehouseName = {
                [Op.like]: `%${warehouseName}%`
            };
        }

        // 状态查询
        if (status) {
            where.status = status;
        }

        // 管理员查询
        if (manager) {
            where.manager = {
                [Op.like]: `%${manager}%`
            };
        }

        // 创建时间范围查询
        if (startTime && endTime) {
            where.createdAt = {
                [Op.between]: [startTime, endTime]
            };
        }

        try {
            const result = await ctx.model.Warehouse.findAndCountAll({
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

            // 计算仓库使用率
            const list = result.rows.map(item => {
                const usage = item.capacity ? ((item.usedCapacity / item.capacity) * 100).toFixed(2) : 0;
                return {
                    ...item.toJSON(),
                    usage: `${usage}%`
                };
            });

            ctx.body = {
                code: 200,
                data: {
                    list,
                    total: result.count,
                    page: parseInt(page),
                    pageSize: parseInt(pageSize)
                },
                message: '获取成功'
            };
        } catch (error) {
            console.error('获取仓库列表失败:', error);
            ctx.body = {
                code: 500,
                message: error.message || '获取仓库列表失败'
            };
        }
    }

    /**
     * @summary 创建仓库
     * @description 创建新的仓库
     */
    async create() {
        const { ctx } = this;
        const data = ctx.request.body;

        try {
            // 检查仓库名是否已存在
            const existWarehouse = await ctx.model.Warehouse.findOne({
                where: {
                    warehouseName: data.warehouseName
                }
            });

            if (existWarehouse) {
                ctx.body = {
                    code: 400,
                    message: '仓库名称已存在'
                };
                return;
            }

            // 创建仓库，添加时间戳
            const warehouse = await ctx.model.Warehouse.create({
                warehouseName: data.warehouseName,
                address: data.address,
                capacity: data.capacity || 0,
                usedCapacity: 0,  // 新建仓库已用容量默认为0
                manager: data.manager,
                phone: data.phone,
                status: data.status || '1',  // 默认启用
                remark: data.remark,
                createdAt: new Date(),  // 添加创建时间
                updatedAt: new Date()   // 添加更新时间
            });

            ctx.body = {
                code: 200,
                data: warehouse,
                message: '创建成功'
            };
        } catch (error) {
            console.error('创建仓库失败:', error);
            ctx.body = {
                code: 500,
                message: error.message || '创建仓库失败'
            };
        }
    }
}

module.exports = WarehouseController;