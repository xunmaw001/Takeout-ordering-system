<template>
  <div class="main-content">
    <!-- 列表页 -->
    <div v-if="showFlag">
      <el-form :inline="true" :model="searchForm" class="form-content">
                                            <el-form-item label="名称">
                <el-input v-model="searchForm.mingcheng" 
                    placeholder="名称" clearable></el-input>
              </el-form-item>
                                                                                                                                                                                                                                                                                                                                                        <el-form-item>
          <el-button round @click="search()">查询</el-button>
          <el-button
            v-if="isAuth('peisongdan','新增')"
            type="primary"
            @click="addOrUpdateHandler()"
            round
          >新增</el-button>
          <el-button
            v-if="isAuth('peisongdan','删除')"
            :disabled="dataListSelections.length <= 0"
            type="danger"
            @click="deleteHandler()"
            round
          >删除</el-button>
                  </el-form-item>
      </el-form>
      <div class="table-content">
        <el-table
            v-if="isAuth('peisongdan','查看')"
            :data="dataList"
            border
            v-loading="dataListLoading"
            @selection-change="selectionChangeHandler"
            style="width: 100%;">
            <el-table-column
                type="selection"
                header-align="center"
                align="center"
                width="50">
            </el-table-column>
                                            <el-table-column
                    prop="mingcheng"
                    header-align="center"
                    align="center"
                    sortable
                    label="名称">
                    <template slot-scope="scope">
                      {{scope.row.mingcheng}}
                    </template>
                </el-table-column>
                                                              <el-table-column prop="tupian" 
                    header-align="center"
                    align="center" 
                    width="200" 
                    label="图片">
                    <template slot-scope="scope">
                      <div v-if="scope.row.tupian">
                        <img :src="scope.row.tupian.split(',')[0]" width="100" height="100">
                      </div>
                      <div v-else>无图片</div>
                    </template>
                  </el-table-column>
                                                            <el-table-column
                    prop="goumaishuliang"
                    header-align="center"
                    align="center"
                    sortable
                    label="购买数量">
                    <template slot-scope="scope">
                      {{scope.row.goumaishuliang}}
                    </template>
                </el-table-column>
                                                            <el-table-column
                    prop="shangjiabianhao"
                    header-align="center"
                    align="center"
                    sortable
                    label="商家编号">
                    <template slot-scope="scope">
                      {{scope.row.shangjiabianhao}}
                    </template>
                </el-table-column>
                                                            <el-table-column
                    prop="zhanghao"
                    header-align="center"
                    align="center"
                    sortable
                    label="账号">
                    <template slot-scope="scope">
                      {{scope.row.zhanghao}}
                    </template>
                </el-table-column>
                                                            <el-table-column
                    prop="beizhu"
                    header-align="center"
                    align="center"
                    sortable
                    label="备注">
                    <template slot-scope="scope">
                      {{scope.row.beizhu}}
                    </template>
                </el-table-column>
                                                            <el-table-column
                    prop="qishoushouyi"
                    header-align="center"
                    align="center"
                    sortable
                    label="骑手收益">
                    <template slot-scope="scope">
                      {{scope.row.qishoushouyi}}
                    </template>
                </el-table-column>
                                                            <el-table-column
                    prop="jiedanshijian"
                    header-align="center"
                    align="center"
                    sortable
                    label="接单时间">
                    <template slot-scope="scope">
                      {{scope.row.jiedanshijian}}
                    </template>
                </el-table-column>
                                                            <el-table-column
                    prop="yonghuming"
                    header-align="center"
                    align="center"
                    sortable
                    label="用户名">
                    <template slot-scope="scope">
                      {{scope.row.yonghuming}}
                    </template>
                </el-table-column>
                                                            <el-table-column
                    prop="qishouxingming"
                    header-align="center"
                    align="center"
                    sortable
                    label="骑手姓名">
                    <template slot-scope="scope">
                      {{scope.row.qishouxingming}}
                    </template>
                </el-table-column>
                                                            <el-table-column
                    prop="dianhua"
                    header-align="center"
                    align="center"
                    sortable
                    label="电话">
                    <template slot-scope="scope">
                      {{scope.row.dianhua}}
                    </template>
                </el-table-column>
                                                            <el-table-column
                    prop="dingdanzhuangtai"
                    header-align="center"
                    align="center"
                    sortable
                    label="订单状态">
                    <template slot-scope="scope">
                      {{scope.row.dingdanzhuangtai}}
                    </template>
                </el-table-column>
                                                                                                                                                    <el-table-column
                  prop="ispay"
                  header-align="center"
                  align="center"
                  sortable
                  label="是否支付">
                  <template slot-scope="scope">
                    <span style="margin-right:10px">{{scope.row.ispay=='已支付'?'已支付':'未支付'}}</span>
                    <el-button v-if="scope.row.ispay!='已支付' && isAuth('peisongdan','支付') " type="text" icon="el-icon-edit" size="small" @click="payHandler(scope.row)">支付</el-button>
                  </template>
                </el-table-column>
                                                                                                                                                    <el-table-column
                    prop="fulladdress"
                    header-align="center"
                    align="center"
                    sortable
                    label="地址">
                    <template slot-scope="scope">
                      {{scope.row.fulladdress}}
                    </template>
                </el-table-column>
                                                      <el-table-column
                  prop="shhf"
                  header-align="center"
                  align="center"
                  sortable
                  label="审核回复">
              </el-table-column>
              <el-table-column
                  v-if="isAuth('peisongdan','审核')"
                  prop="sfsh"
                  header-align="center"
                  align="center"
                  sortable
                  label="审核">
                  <template slot-scope="scope">
                    <span style="margin-right:10px">{{scope.row.sfsh=='是'?'通过':'未通过'}}</span>
                    <el-button  type="text" icon="el-icon-edit" size="small" @click="shDialog(scope.row)">审核</el-button>
                  </template>
              </el-table-column>
                        <el-table-column
                header-align="center"
                align="center"
                label="操作">
                <template slot-scope="scope">
                                <el-button v-if="isAuth('peisongdan','查看')" type="text" icon="el-icon-edit" size="small" @click="addOrUpdateHandler(scope.row.id,'info')">详情</el-button>
                                                                <el-button v-if="isAuth('peisongdan','评价')" type="text" icon="el-icon-edit" size="small" @click="shangpinpingjiaCrossAddOrUpdateHandler(scope.row,'cross')">评价</el-button>
                                                                <el-button v-if="isAuth('peisongdan','修改')" type="text" icon="el-icon-edit" size="small" @click="addOrUpdateHandler(scope.row.id)">修改</el-button>
                <el-button v-if="isAuth('peisongdan','删除')" type="text" icon="el-icon-delete" size="small" @click="deleteHandler(scope.row.id)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
                                                                                                                                                                                                                                                                                                                <el-pagination
          @size-change="sizeChangeHandle"
          @current-change="currentChangeHandle"
          :current-page="pageIndex"
          :page-sizes="[10, 20, 50, 100]"
          :page-size="pageSize"
          :total="totalPage"
          layout="total, sizes, prev, pager, next, jumper"
          class="pagination-content"
        ></el-pagination>
      </div>
    </div>
    <!-- 添加/修改页面  将父组件的search方法传递给子组件-->
    <add-or-update v-if="addOrUpdateFlag" :parent="this" ref="addOrUpdate"></add-or-update>

            <shangpinpingjia-cross-add-or-update v-if="shangpinpingjiaCrossAddOrUpdateFlag" :parent="this" ref="shangpinpingjiaCrossaddOrUpdate"></shangpinpingjia-cross-add-or-update>
        
        <el-dialog
      title="审核"
      :visible.sync="sfshVisiable"
      width="50%">
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="审核状态">
          <el-select v-model="shForm.sfsh" placeholder="审核状态">
            <el-option label="通过" value="是"></el-option>
            <el-option label="不通过" value="否"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="内容">
          <el-input type="textarea" :rows="8" v-model="shForm.shhf"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="shDialog">取 消</el-button>
        <el-button type="primary" @click="shHandler">确 定</el-button>
      </span>
    </el-dialog>
    
      </div>
</template>
<script>
import AddOrUpdate from "./add-or-update";
import shangpinpingjiaCrossAddOrUpdate from "../shangpinpingjia/add-or-update";
export default {
  data() {
    return {
                                                                                                                                                                                                                                                                                                                                                            searchForm: {
        key: ""
      },
      dataList: [],
      pageIndex: 1,
      pageSize: 10,
      totalPage: 0,
      dataListLoading: false,
      dataListSelections: [],
      showFlag: true,
      sfshVisiable: false,
      shForm: {},
      chartVisiable: false,
      addOrUpdateFlag:false,
                  shangpinpingjiaCrossAddOrUpdateFlag: false,
                };
  },
  mounted() {
    this.init();
    this.getDataList();
  },
  filters: {
    htmlfilter: function (val) {
      return val.replace(/<[^>]*>/g).replace(/undefined/g,'');
    }
  },
  components: {
    AddOrUpdate,
            shangpinpingjiaCrossAddOrUpdate,
          },
  methods: {
            shangpinpingjiaCrossAddOrUpdateHandler(row,type){
      this.showFlag = false;
      this.addOrUpdateFlag = false;
      this.shangpinpingjiaCrossAddOrUpdateFlag = true;
      this.$storage.set('crossObj',row);
      this.$storage.set('crossTable','peisongdan');
      this.$nextTick(() => {
        this.$refs.shangpinpingjiaCrossaddOrUpdate.init(row.id,type);
      });
    },
                payHandler(row){
      this.$storage.set('paytable','peisongdan');
      this.$storage.set('payObject',row);
      this.$router.push('pay');
    },
            init () {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  },
    search() {
      this.pageIndex = 1;
      this.getDataList();
    },
    // 获取数据列表
    getDataList() {
      this.dataListLoading = true;
      let params = {
        page: this.pageIndex,
        limit: this.pageSize,
        sort: 'id',
      }
                                          if(this.searchForm.mingcheng!='' && this.searchForm.mingcheng!=undefined){
            params['mingcheng'] = '%' + this.searchForm.mingcheng + '%'
          }
                                                                                                                                                                                                                                                                                                                                                                                                                    this.$http({
        url: "peisongdan/page",
        method: "get",
        params: params
      }).then(({ data }) => {
        if (data && data.code === 0) {
          this.dataList = data.data.list;
          this.totalPage = data.data.total;
        } else {
          this.dataList = [];
          this.totalPage = 0;
        }
        this.dataListLoading = false;
      });
    },
    // 每页数
    sizeChangeHandle(val) {
      this.pageSize = val;
      this.pageIndex = 1;
      this.getDataList();
    },
    // 当前页
    currentChangeHandle(val) {
      this.pageIndex = val;
      this.getDataList();
    },
    // 多选
    selectionChangeHandler(val) {
      this.dataListSelections = val;
    },
    // 添加/修改
    addOrUpdateHandler(id,type) {
      this.showFlag = false;
      this.addOrUpdateFlag = true;
      this.crossAddOrUpdateFlag = false;
      if(type!='info'){
        type = 'else';
      }
      this.$nextTick(() => {
        this.$refs.addOrUpdate.init(id,type);
      });
    },
        // 审核窗口
    shDialog(row){
      this.sfshVisiable = !this.sfshVisiable;
      if(row){
        this.shForm = {
                    mingcheng: row.mingcheng,
                    tupian: row.tupian,
                    goumaishuliang: row.goumaishuliang,
                    shangjiabianhao: row.shangjiabianhao,
                    zhanghao: row.zhanghao,
                    beizhu: row.beizhu,
                    qishoushouyi: row.qishoushouyi,
                    jiedanshijian: row.jiedanshijian,
                    yonghuming: row.yonghuming,
                    qishouxingming: row.qishouxingming,
                    dianhua: row.dianhua,
                    dingdanzhuangtai: row.dingdanzhuangtai,
                    sfsh: row.sfsh,
                    shhf: row.shhf,
                    ispay: row.ispay,
                    longitude: row.longitude,
                    latitude: row.latitude,
                    fulladdress: row.fulladdress,
                    id: row.id
        }
      }
    },
    // 审核
    shHandler(){
      this.$confirm(`确定操作?`, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.$http({
          url: "peisongdan/update",
          method: "post",
          data: this.shForm
        }).then(({ data }) => {
          if (data && data.code === 0) {
            this.$message({
              message: "操作成功",
              type: "success",
              duration: 1500,
              onClose: () => {
                this.getDataList();
                this.shDialog()
              }
            });
          } else {
            this.$message.error(data.msg);
          }
        });
      });
    },
        // 下载
    download(file){
      window.open(`${file}`)
    },
    // 删除
    deleteHandler(id) {
      var ids = id
        ? [Number(id)]
        : this.dataListSelections.map(item => {
            return Number(item.id);
          });
      this.$confirm(`确定进行[${id ? "删除" : "批量删除"}]操作?`, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.$http({
          url: "peisongdan/delete",
          method: "post",
          data: ids
        }).then(({ data }) => {
          if (data && data.code === 0) {
            this.$message({
              message: "操作成功",
              type: "success",
              duration: 1500,
              onClose: () => {
                this.search();
              }
            });
          } else {
            this.$message.error(data.msg);
          }
        });
      });
    }
  }
};
</script>
<style lang="scss" scoped>
</style>
