<template>
  <div class="main-content">
    <!-- 列表页 -->
    <div v-if="showFlag">
      <el-form :inline="true" :model="searchForm" class="form-content">
                                            <el-form-item label="名称">
                <el-input v-model="searchForm.mingcheng" 
                    placeholder="名称" clearable></el-input>
              </el-form-item>
                                                                  <el-form-item label="类型">
                <el-input v-model="searchForm.leixing" 
                    placeholder="类型" clearable></el-input>
              </el-form-item>
                                                                                                                                          <el-form-item label="商家编号">
                <el-input v-model="searchForm.shangjiabianhao" 
                    placeholder="商家编号" clearable></el-input>
              </el-form-item>
                                                                                                      <el-form-item label="手机">
                <el-input v-model="searchForm.shouji" 
                    placeholder="手机" clearable></el-input>
              </el-form-item>
                                                                                                                                                                                                        <el-form-item>
          <el-button round @click="search()">查询</el-button>
          <el-button
            v-if="isAuth('dingdan','新增')"
            type="primary"
            @click="addOrUpdateHandler()"
            round
          >新增</el-button>
          <el-button
            v-if="isAuth('dingdan','删除')"
            :disabled="dataListSelections.length <= 0"
            type="danger"
            @click="deleteHandler()"
            round
          >删除</el-button>
                  </el-form-item>
      </el-form>
      <div class="table-content">
        <el-table
            v-if="isAuth('dingdan','查看')"
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
                                                            <el-table-column
                    prop="leixing"
                    header-align="center"
                    align="center"
                    sortable
                    label="类型">
                    <template slot-scope="scope">
                      {{scope.row.leixing}}
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
                    prop="jiage"
                    header-align="center"
                    align="center"
                    sortable
                    label="价格">
                    <template slot-scope="scope">
                      {{scope.row.jiage}}
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
                    prop="zongjiage"
                    header-align="center"
                    align="center"
                    sortable
                    label="总价格">
                    <template slot-scope="scope">
                      {{scope.row.zongjiage}}
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
                    prop="shangjiamingcheng"
                    header-align="center"
                    align="center"
                    sortable
                    label="商家名称">
                    <template slot-scope="scope">
                      {{scope.row.shangjiamingcheng}}
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
                    prop="shouji"
                    header-align="center"
                    align="center"
                    sortable
                    label="手机">
                    <template slot-scope="scope">
                      {{scope.row.shouji}}
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
                    prop="xiadanshijian"
                    header-align="center"
                    align="center"
                    sortable
                    label="下单时间">
                    <template slot-scope="scope">
                      {{scope.row.xiadanshijian}}
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
                  prop="ispay"
                  header-align="center"
                  align="center"
                  sortable
                  label="是否支付">
                  <template slot-scope="scope">
                    <span style="margin-right:10px">{{scope.row.ispay=='已支付'?'已支付':'未支付'}}</span>
                    <el-button v-if="scope.row.ispay!='已支付' && isAuth('dingdan','支付') " type="text" icon="el-icon-edit" size="small" @click="payHandler(scope.row)">支付</el-button>
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
                  v-if="isAuth('dingdan','审核')"
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
                                <el-button v-if="isAuth('dingdan','查看')" type="text" icon="el-icon-edit" size="small" @click="addOrUpdateHandler(scope.row.id,'info')">详情</el-button>
                                                                <el-button v-if="isAuth('dingdan','配送')" type="text" icon="el-icon-edit" size="small" @click="peisongdanCrossAddOrUpdateHandler(scope.row,'cross')">配送</el-button>
                                                                <el-button v-if="isAuth('dingdan','修改')" type="text" icon="el-icon-edit" size="small" @click="addOrUpdateHandler(scope.row.id)">修改</el-button>
                <el-button v-if="isAuth('dingdan','删除')" type="text" icon="el-icon-delete" size="small" @click="deleteHandler(scope.row.id)">删除</el-button>
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

            <peisongdan-cross-add-or-update v-if="peisongdanCrossAddOrUpdateFlag" :parent="this" ref="peisongdanCrossaddOrUpdate"></peisongdan-cross-add-or-update>
        
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
import peisongdanCrossAddOrUpdate from "../peisongdan/add-or-update";
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
                  peisongdanCrossAddOrUpdateFlag: false,
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
            peisongdanCrossAddOrUpdate,
          },
  methods: {
            peisongdanCrossAddOrUpdateHandler(row,type){
      this.showFlag = false;
      this.addOrUpdateFlag = false;
      this.peisongdanCrossAddOrUpdateFlag = true;
      this.$storage.set('crossObj',row);
      this.$storage.set('crossTable','dingdan');
      this.$nextTick(() => {
        this.$refs.peisongdanCrossaddOrUpdate.init(row.id,type);
      });
    },
                payHandler(row){
      this.$storage.set('paytable','dingdan');
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
                                                            if(this.searchForm.leixing!='' && this.searchForm.leixing!=undefined){
            params['leixing'] = '%' + this.searchForm.leixing + '%'
          }
                                                                                                                                                    if(this.searchForm.shangjiabianhao!='' && this.searchForm.shangjiabianhao!=undefined){
            params['shangjiabianhao'] = '%' + this.searchForm.shangjiabianhao + '%'
          }
                                                                                                        if(this.searchForm.shouji!='' && this.searchForm.shouji!=undefined){
            params['shouji'] = '%' + this.searchForm.shouji + '%'
          }
                                                                                                                                                                                                                                    this.$http({
        url: "dingdan/page",
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
                    leixing: row.leixing,
                    tupian: row.tupian,
                    jiage: row.jiage,
                    goumaishuliang: row.goumaishuliang,
                    zongjiage: row.zongjiage,
                    shangjiabianhao: row.shangjiabianhao,
                    shangjiamingcheng: row.shangjiamingcheng,
                    zhanghao: row.zhanghao,
                    shouji: row.shouji,
                    qishoushouyi: row.qishoushouyi,
                    xiadanshijian: row.xiadanshijian,
                    beizhu: row.beizhu,
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
          url: "dingdan/update",
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
          url: "dingdan/delete",
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
