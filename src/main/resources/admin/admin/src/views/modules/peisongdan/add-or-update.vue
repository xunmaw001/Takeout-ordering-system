<template>
  <div>
    <el-form
      class="detail-form-content"
      ref="ruleForm"
      :model="ruleForm"
      :rules="rules"
      label-width="80px"
    >
      <el-row>
                  <el-col :span="12">
        <el-form-item  v-if="type!='info'"  label="名称" prop="mingcheng">
          <el-input v-model="ruleForm.mingcheng" 
              placeholder="名称" clearable></el-input>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.mingcheng" label="名称" prop="mingcheng">
              <el-input v-model="ruleForm.mingcheng" 
                placeholder="名称" readonly></el-input>
          </el-form-item>
        </div>
      </el-col>
                        <el-col :span="24">  
        <el-form-item v-if="type!='info'" label="图片" prop="tupian">
          <file-upload
          tip="点击上传图片"
          action="file/upload"
          :limit="3"
          :multiple="true"
          :fileUrls="ruleForm.tupian?ruleForm.tupian:''"
          @change="tupianUploadChange"
          ></file-upload>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.tupian" label="图片" prop="tupian">
            <img style="margin-right:20px;" v-bind:key="index" v-for="(item,index) in ruleForm.tupian.split(',')" :src="item" width="100" height="100">
          </el-form-item>
        </div>
      </el-col>
                        <el-col :span="12">
        <el-form-item  v-if="type!='info'"  label="购买数量" prop="goumaishuliang">
          <el-input v-model="ruleForm.goumaishuliang" 
              placeholder="购买数量" clearable></el-input>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.goumaishuliang" label="购买数量" prop="goumaishuliang">
              <el-input v-model="ruleForm.goumaishuliang" 
                placeholder="购买数量" readonly></el-input>
          </el-form-item>
        </div>
      </el-col>
                        <el-col :span="12">
        <el-form-item  v-if="type!='info'"  label="商家编号" prop="shangjiabianhao">
          <el-input v-model="ruleForm.shangjiabianhao" 
              placeholder="商家编号" clearable></el-input>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.shangjiabianhao" label="商家编号" prop="shangjiabianhao">
              <el-input v-model="ruleForm.shangjiabianhao" 
                placeholder="商家编号" readonly></el-input>
          </el-form-item>
        </div>
      </el-col>
                        <el-col :span="12">
        <el-form-item  v-if="type!='info'"  label="账号" prop="zhanghao">
          <el-input v-model="ruleForm.zhanghao" 
              placeholder="账号" clearable></el-input>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.zhanghao" label="账号" prop="zhanghao">
              <el-input v-model="ruleForm.zhanghao" 
                placeholder="账号" readonly></el-input>
          </el-form-item>
        </div>
      </el-col>
                        <el-col :span="12">
        <el-form-item  v-if="type!='info'"  label="备注" prop="beizhu">
          <el-input v-model="ruleForm.beizhu" 
              placeholder="备注" clearable></el-input>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.beizhu" label="备注" prop="beizhu">
              <el-input v-model="ruleForm.beizhu" 
                placeholder="备注" readonly></el-input>
          </el-form-item>
        </div>
      </el-col>
                        <el-col :span="12">
        <el-form-item  v-if="type!='info'"  label="骑手收益" prop="qishoushouyi">
          <el-input v-model="ruleForm.qishoushouyi" 
              placeholder="骑手收益" clearable></el-input>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.qishoushouyi" label="骑手收益" prop="qishoushouyi">
              <el-input v-model="ruleForm.qishoushouyi" 
                placeholder="骑手收益" readonly></el-input>
          </el-form-item>
        </div>
      </el-col>
                        <el-col :span="12">
        <el-form-item v-if="type!='info'" label="接单时间" prop="jiedanshijian">
            <el-date-picker
                value-format="yyyy-MM-dd HH:mm:ss"
                v-model="ruleForm.jiedanshijian" 
                type="datetime"
                placeholder="接单时间">
            </el-date-picker>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.jiedanshijian" label="接单时间" prop="jiedanshijian">
              <el-input v-model="ruleForm.jiedanshijian" 
                placeholder="接单时间" readonly></el-input>
          </el-form-item>
        </div>
      </el-col>
                        <el-col :span="12">
        <el-form-item  v-if="type!='info'"  label="用户名" prop="yonghuming">
          <el-input v-model="ruleForm.yonghuming" 
              placeholder="用户名" clearable></el-input>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.yonghuming" label="用户名" prop="yonghuming">
              <el-input v-model="ruleForm.yonghuming" 
                placeholder="用户名" readonly></el-input>
          </el-form-item>
        </div>
      </el-col>
                        <el-col :span="12">
        <el-form-item  v-if="type!='info'"  label="骑手姓名" prop="qishouxingming">
          <el-input v-model="ruleForm.qishouxingming" 
              placeholder="骑手姓名" clearable></el-input>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.qishouxingming" label="骑手姓名" prop="qishouxingming">
              <el-input v-model="ruleForm.qishouxingming" 
                placeholder="骑手姓名" readonly></el-input>
          </el-form-item>
        </div>
      </el-col>
                        <el-col :span="12">
        <el-form-item  v-if="type!='info'"  label="电话" prop="dianhua">
          <el-input v-model="ruleForm.dianhua" 
              placeholder="电话" clearable></el-input>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.dianhua" label="电话" prop="dianhua">
              <el-input v-model="ruleForm.dianhua" 
                placeholder="电话" readonly></el-input>
          </el-form-item>
        </div>
      </el-col>
                        <el-col :span="12">
        <el-form-item v-if="type!='info'"  label="订单状态" prop="dingdanzhuangtai">
          <el-select v-model="ruleForm.dingdanzhuangtai" placeholder="请选择订单状态">
            <el-option
                v-for="(item,index) in dingdanzhuangtaiOptions"
                v-bind:key="index"
                :label="item"
                :value="item">
            </el-option>
          </el-select>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.dingdanzhuangtai" label="订单状态" prop="dingdanzhuangtai">
              <el-input v-model="ruleForm.dingdanzhuangtai" 
                placeholder="订单状态" readonly></el-input>
          </el-form-item>
        </div>
      </el-col>
                                                                                                                                    <el-col :span="12">
        <el-form-item  v-if="type!='info'"  label="地址" prop="fulladdress">
          <el-input   @click.native="openMapDiolag"  v-model="ruleForm.fulladdress" 
              placeholder="请选择地址"></el-input>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.fulladdress" label="地址" prop="fulladdress">
              <el-input v-model="ruleForm.fulladdress" 
                placeholder="请选择地址" readonly></el-input>
          </el-form-item>
        </div>
      </el-col>
            </el-row>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          <el-form-item>
                <el-button v-if="type!='info'" type="primary" @click="onSubmit">提交</el-button>
        <el-button v-if="type!='info'" @click="back()">取消</el-button>
        <el-button v-if="type=='info'" @click="back()">返回</el-button>
      </el-form-item>
    </el-form>
    
        <el-dialog
      width="50%"
      title="坐标查询"
      :visible.sync="mapVisiable"
      append-to-body>
      <el-amap-search-box class="search-box" :on-search-result="onSearchResult" :search-option="searchOption" ></el-amap-search-box>
      <div class="amap-wrapper">
        <el-amap class="amap-box" :vid="'amap-vue'" 
        :center="center"
        :zoom="zoom"
        :events="events" >
          <el-amap-marker v-bind:key="marker" v-for="marker in markers" :position="marker" ></el-amap-marker>
        </el-amap>
      </div>
      <div>坐标：[{{ ruleForm.longitude }}, {{ ruleForm.latitude }}],地址：{{ruleForm.fulladdress}}</div>
    </el-dialog>
    
  </div>
</template>
<script>
// 数字，邮件，手机，url，身份证校验
import { isNumber,isIntNumer,isEmail,isMobile,isURL,checkIdCard } from "@/utils/validate";
export default {
  data() {
    let self = this
    var validateIdCard = (rule, value, callback) => {
      if(!value){
        callback();
      } else if (!checkIdCard(value)) {
        callback(new Error("请输入正确的身份证号码"));
      } else {
        callback();
      }
    };
    var validateUrl = (rule, value, callback) => {
      if(!value){
        callback();
      } else if (!isURL(value)) {
        callback(new Error("请输入正确的URL地址"));
      } else {
        callback();
      }
    };
    var validatePhone = (rule, value, callback) => {
      if(!value){
        callback();
      } else if (!isMobile(value)) {
        callback(new Error("请输入正确的电话号码"));
      } else {
        callback();
      }
    };
    var validateEmail = (rule, value, callback) => {
      if(!value){
        callback();
      } else if (!isEmail(value)) {
        callback(new Error("请输入正确的邮箱地址"));
      } else {
        callback();
      }
    };
    var validateNumber = (rule, value, callback) => {
      if(!value){
        callback();
      } else if (!isNumber(value)) {
        callback(new Error("请输入数字"));
      } else {
        callback();
      }
    };
    var validateIntNumber = (rule, value, callback) => {
      if(!value){
        callback();
      } else if (!isIntNumer(value)) {
        callback(new Error("请输入整数"));
      } else {
        callback();
      }
    };
    return {
      id: '',
      type: '',
            // 地图
      mapVisiable: false,
      zoom: 12,
      center: [116.410426, 39.934946],
      markers: [],
      searchOption: {
        citylimit: false
      },
      events: {
        click (e) {
          let { lng, lat } = e.lnglat
          self.ruleForm.longitude = lng
          self.ruleForm.latitude = lat
          // 这里通过高德 SDK 完成。
          /* eslint-disable */
          var geocoder = new AMap.Geocoder({
            radius: 1000,
            extensions: 'all'
          })
          geocoder.getAddress([lng, lat], function (status, result) {
            if (status === 'complete' && result.info === 'OK') {
              if (result && result.regeocode) {
                console.log(result)
                self.ruleForm.fulladdress = result.regeocode.formattedAddress
              }
            }
          })
        }
      },
            ruleForm: {
                        mingcheng: '',
                                tupian: '',
                                goumaishuliang: '',
                                shangjiabianhao: '',
                                zhanghao: '',
                                beizhu: '',
                                qishoushouyi: '',
                                jiedanshijian: '',
                                yonghuming: '',
                                qishouxingming: '',
                                dianhua: '',
                                dingdanzhuangtai: '',
                                sfsh: '',
                                shhf: '',
                                ispay: '',
                                longitude: '',
                                latitude: '',
                                fulladdress: '',
                      },
                                                                                                                                                                                  dingdanzhuangtaiOptions: [],
                                                                                                        rules: {
                  mingcheng: [
                                                                                              ],
                  tupian: [
                                                                                              ],
                  goumaishuliang: [
                                                                                              ],
                  shangjiabianhao: [
                                                                                              ],
                  zhanghao: [
                                                                                              ],
                  beizhu: [
                                                                                              ],
                  qishoushouyi: [
                                        { validator: validateIntNumber, trigger: 'blur' },
                                                                                  ],
                  jiedanshijian: [
                                                                                              ],
                  yonghuming: [
                                                                                              ],
                  qishouxingming: [
                                                                                              ],
                  dianhua: [
                                                                                              ],
                  dingdanzhuangtai: [
                                                                                              ],
                  sfsh: [
                                                                                              ],
                  shhf: [
                                                                                              ],
                  ispay: [
                                                                                              ],
                  longitude: [
                                                    { validator: validateNumber, trigger: 'blur' },
                                                                      ],
                  latitude: [
                                                    { validator: validateNumber, trigger: 'blur' },
                                                                      ],
                  fulladdress: [
                                                                                              ],
              }
    };
  },
  props: ["parent"],
  computed: {
                                                                                                                                                                                                                              },
  methods: {
        // 打开坐标定位窗口
    openMapDiolag () {
      this.mapVisiable = true
    },
    // 查询
    onSearchResult (pois) {
      let latSum = 0;
      let lngSum = 0;
      if (pois.length > 0) {
        pois.forEach(poi => {
          let {lng, lat} = poi;
          lngSum += lng;
          latSum += lat;
          this.markers.push([poi.lng, poi.lat]);
        });
        let center = {
          lng: lngSum / pois.length,
          lat: latSum / pois.length
        };
        this.center = [center.lng, center.lat];
      }
    },
        // 下载
    download(file){
      window.open(`${file}`)
    },
    // 初始化
    init(id,type) {
      if (id) {
        this.id = id;
        this.type = type;
      }
      if(this.type=='info'||this.type=='else'){
        this.info(id);
      }else if(this.type=='cross'){
        var obj = this.$storage.getObj('crossObj');
        for (var o in obj){
                    if(o=='mingcheng'){
            this.ruleForm.mingcheng = obj[o];
            continue;
          }
                    if(o=='tupian'){
            this.ruleForm.tupian = obj[o];
            continue;
          }
                    if(o=='goumaishuliang'){
            this.ruleForm.goumaishuliang = obj[o];
            continue;
          }
                    if(o=='shangjiabianhao'){
            this.ruleForm.shangjiabianhao = obj[o];
            continue;
          }
                    if(o=='zhanghao'){
            this.ruleForm.zhanghao = obj[o];
            continue;
          }
                    if(o=='beizhu'){
            this.ruleForm.beizhu = obj[o];
            continue;
          }
                    if(o=='qishoushouyi'){
            this.ruleForm.qishoushouyi = obj[o];
            continue;
          }
                    if(o=='jiedanshijian'){
            this.ruleForm.jiedanshijian = obj[o];
            continue;
          }
                    if(o=='yonghuming'){
            this.ruleForm.yonghuming = obj[o];
            continue;
          }
                    if(o=='qishouxingming'){
            this.ruleForm.qishouxingming = obj[o];
            continue;
          }
                    if(o=='dianhua'){
            this.ruleForm.dianhua = obj[o];
            continue;
          }
                    if(o=='dingdanzhuangtai'){
            this.ruleForm.dingdanzhuangtai = obj[o];
            continue;
          }
                    if(o=='sfsh'){
            this.ruleForm.sfsh = obj[o];
            continue;
          }
                    if(o=='shhf'){
            this.ruleForm.shhf = obj[o];
            continue;
          }
                    if(o=='ispay'){
            this.ruleForm.ispay = obj[o];
            continue;
          }
                    if(o=='longitude'){
            this.ruleForm.longitude = obj[o];
            continue;
          }
                    if(o=='latitude'){
            this.ruleForm.latitude = obj[o];
            continue;
          }
                    if(o=='fulladdress'){
            this.ruleForm.fulladdress = obj[o];
            continue;
          }
                  }
                                                                                                                                                                                                                                                                                                              }
            // 获取用户信息
      this.$http({
        url: `${this.$storage.get('sessionTable')}/session`,
        method: "get"
      }).then(({ data }) => {
        if (data && data.code === 0) {
          var json = data.data;
                                                                                                                                                                                                                    this.ruleForm.yonghuming = json.yonghuming
                                                this.ruleForm.qishouxingming = json.qishouxingming
                                                this.ruleForm.dianhua = json.dianhua
                                                                                                                                                                                        } else {
          this.$message.error(data.msg);
        }
      });
                                                                                                                                                                                                                                                this.dingdanzhuangtaiOptions = "已接单,配送中,已送达".split(',')
                                                                                                                                        },
                                                                                                                                                        // 多级联动参数
                                                                                                                                                                                                info(id) {
      this.$http({
        url: `peisongdan/info/${id}`,
        method: "get"
      }).then(({ data }) => {
        if (data && data.code === 0) {
          this.ruleForm = data.data;
        } else {
          this.$message.error(data.msg);
        }
      });
    },
        // 提交
    onSubmit() {
                  // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                              // ${column.compare}
                                                                                                                                                                                                                                                                                                                                                                        this.$refs["ruleForm"].validate(valid => {
        if (valid) {
          this.$http({
            url: `peisongdan/${!this.ruleForm.id ? "save" : "update"}`,
            method: "post",
            data: this.ruleForm
          }).then(({ data }) => {
            if (data && data.code === 0) {
              this.$message({
                message: "操作成功",
                type: "success",
                duration: 1500,
                onClose: () => {
                  this.parent.showFlag = true;
                  this.parent.addOrUpdateFlag = false;
                  this.parent.peisongdanCrossAddOrUpdateFlag = false;
                  this.parent.search();
                }
              });
            } else {
              this.$message.error(data.msg);
            }
          });
        }
      });
    },
    // 获取uuid
    getUUID () {
      return new Date().getTime();
    },
    // 返回
    back() {
      this.parent.showFlag = true;
      this.parent.addOrUpdateFlag = false;
      this.parent.peisongdanCrossAddOrUpdateFlag = false;
    },
                                    tupianUploadChange(fileUrls) {
                this.ruleForm.tupian = fileUrls;
            },
                                                                                                                                                                                                              }
};
</script>
<style lang="scss">
.editor{
  height: 500px;
}
.amap-wrapper {
  width: 100%;
  height: 500px;
}
.search-box {
  position: absolute;
}
</style>
