'use strict';
const BaseController = require('../../base');

class Controller extends BaseController {
  constructor(...arg) {
    super(...arg);
    this.serviceName = 'inbound';
    this.modleName = 'system';
  }

  /**
   * @api {get} /admin/system/inbound 查询列表
   * @apiGroup Inbound-入库管理
   *
   * @apiParam {Number} [pageSize] 一页条数
   * @apiParam {Number} [pageNum] 页码
   * @apiParam {String} [inboundNo] 入库单号
   * @apiParam {String} [warehouseName] 仓库名称
   * @apiParam {String} [cargoName] 货物名称
   * @apiParam {String} [status] 状态
   */
  async index() {
    const { ctx, service } = this;
    const query = {
      limit: ctx.helper.parseInt(ctx.query.pageSize),
      offset: ctx.helper.parseInt(ctx.query.pageNum),
      inboundNo: ctx.query.inboundNo,
      warehouseName: ctx.query.warehouseName,
      cargoName: ctx.query.cargoName,
      status: ctx.query.status,
    };
    const result = await service[this.app.config.public].admin[this.modleName][this.serviceName].findList(query);
    ctx.returnBody(result, 100010);
  }
}

module.exports = Controller;
