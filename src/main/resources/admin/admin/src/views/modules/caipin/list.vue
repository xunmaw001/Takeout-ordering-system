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
                                                                                                                                                                    <el-form-item>
          <el-button round @click="search()">查询</el-button>
          <el-button
            v-if="isAuth('caipin','新增')"
            type="primary"
            @click="addOrUpdateHandler()"
            round
          >新增</el-button>
          <el-button
            v-if="isAuth('caipin','删除')"
            :disabled="dataListSelections.length <= 0"
            type="danger"
            @click="deleteHandler()"
            round
          >删除</el-button>
                  </el-form-item>
      </el-form>
      <div class="table-content">
        <el-table
            v-if="isAuth('caipin','查看')"
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
                    prop="kouwei"
                    header-align="center"
                    align="center"
                    sortable
                    label="口味">
                    <template slot-scope="scope">
                      {{scope.row.kouwei}}
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
                    prop="dizhi"
                    header-align="center"
                    align="center"
                    sortable
                    label="地址">
                    <template slot-scope="scope">
                      {{scope.row.dizhi}}
                    </template>
                </el-table-column>
                                                                                                <el-table-column
                header-align="center"
                align="center"
                label="操作">
                <template slot-scope="scope">
                                <el-button v-if="isAuth('caipin','查看')" type="text" icon="el-icon-edit" size="small" @click="addOrUpdateHandler(scope.row.id,'info')">详情</el-button>
                                                                <el-button v-if="isAuth('caipin','加入订餐车')" type="text" icon="el-icon-edit" size="small" @click="dingdanCrossAddOrUpdateHandler(scope.row,'cross')">加入订餐车</el-button>
                                                                <el-button v-if="isAuth('caipin','修改')" type="text" icon="el-icon-edit" size="small" @click="addOrUpdateHandler(scope.row.id)">修改</el-button>
                <el-button v-if="isAuth('caipin','删除')" type="text" icon="el-icon-delete" size="small" @click="deleteHandler(scope.row.id)">删除</el-button>
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

            <dingdan-cross-add-or-update v-if="dingdanCrossAddOrUpdateFlag" :parent="this" ref="dingdanCrossaddOrUpdate"></dingdan-cross-add-or-update>
        
    
      </div>
</template>
<script>
import AddOrUpdate from "./add-or-update";
import dingdanCrossAddOrUpdate from "../dingdan/add-or-update";
export default {
  data() {
    return {
                                                            leixingOptions: [],
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
                  dingdanCrossAddOrUpdateFlag: false,
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
            dingdanCrossAddOrUpdate,
          },
  methods: {
            dingdanCrossAddOrUpdateHandler(row,type){
      this.showFlag = false;
      this.addOrUpdateFlag = false;
      this.dingdanCrossAddOrUpdateFlag = true;
      this.$storage.set('crossObj',row);
      this.$storage.set('crossTable','caipin');
      this.$nextTick(() => {
        this.$refs.dingdanCrossaddOrUpdate.init(row.id,type);
      });
    },
                    init () {
                                                        this.$http({
            url: `option/caipinfenlei/leixing`,
            method: "get"
          }).then(({ data }) => {
            if (data && data.code === 0) {
              this.leixingOptions = data.data;
            } else {
              this.$message.error(data.msg);
            }
          });
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
                                                                                                                                                                                        this.$http({
        url: "caipin/page",
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
          url: "caipin/delete",
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
