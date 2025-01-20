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
        <el-form-item v-if="type!='info'"  label="菜品评分" prop="caipinpingfen">
          <el-select v-model="ruleForm.caipinpingfen" placeholder="请选择菜品评分">
            <el-option
                v-for="(item,index) in caipinpingfenOptions"
                v-bind:key="index"
                :label="item"
                :value="item">
            </el-option>
          </el-select>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.caipinpingfen" label="菜品评分" prop="caipinpingfen">
              <el-input v-model="ruleForm.caipinpingfen" 
                placeholder="菜品评分" readonly></el-input>
          </el-form-item>
        </div>
      </el-col>
                        <el-col :span="12">
        <el-form-item v-if="type!='info'"  label="配送评分" prop="peisongpingfen">
          <el-select v-model="ruleForm.peisongpingfen" placeholder="请选择配送评分">
            <el-option
                v-for="(item,index) in peisongpingfenOptions"
                v-bind:key="index"
                :label="item"
                :value="item">
            </el-option>
          </el-select>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.peisongpingfen" label="配送评分" prop="peisongpingfen">
              <el-input v-model="ruleForm.peisongpingfen" 
                placeholder="配送评分" readonly></el-input>
          </el-form-item>
        </div>
      </el-col>
                        <el-col :span="12">
        <el-form-item v-if="type!='info'"  label="商家评分" prop="shangjiapingfen">
          <el-select v-model="ruleForm.shangjiapingfen" placeholder="请选择商家评分">
            <el-option
                v-for="(item,index) in shangjiapingfenOptions"
                v-bind:key="index"
                :label="item"
                :value="item">
            </el-option>
          </el-select>
        </el-form-item>
        <div v-else>
          <el-form-item v-if="ruleForm.shangjiapingfen" label="商家评分" prop="shangjiapingfen">
              <el-input v-model="ruleForm.shangjiapingfen" 
                placeholder="商家评分" readonly></el-input>
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
                                                            </el-row>
                                                                                                                                                                                                                                                                                                        <el-row>
            <el-col :span="24">
              <el-form-item v-if="type!='info'"  label="评语" prop="pingyu">
                <editor 
                    style="min-width: 200px; max-width: 600px;"
                    v-model="ruleForm.pingyu" 
                    class="editor" 
                    action="file/upload">
                </editor>
              </el-form-item>
              <div v-else>
                <el-form-item v-if="ruleForm.pingyu" label="评语" prop="pingyu">
                    <span v-html="ruleForm.pingyu"></span>
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
            ruleForm: {
                        mingcheng: '',
                                tupian: '',
                                goumaishuliang: '',
                                shangjiabianhao: '',
                                caipinpingfen: '',
                                peisongpingfen: '',
                                shangjiapingfen: '',
                                pingyu: '',
                                zhanghao: '',
                                beizhu: '',
                                sfsh: '',
                                shhf: '',
                      },
                                                                                caipinpingfenOptions: [],
                                peisongpingfenOptions: [],
                                shangjiapingfenOptions: [],
                                                                                          rules: {
                  mingcheng: [
                                                                                              ],
                  tupian: [
                                                                                              ],
                  goumaishuliang: [
                                                                                              ],
                  shangjiabianhao: [
                                                                                              ],
                  caipinpingfen: [
                                                                                              ],
                  peisongpingfen: [
                                                                                              ],
                  shangjiapingfen: [
                                                                                              ],
                  pingyu: [
                                                                                              ],
                  zhanghao: [
                                                                                              ],
                  beizhu: [
                                                                                              ],
                  sfsh: [
                                                                                              ],
                  shhf: [
                                                                                              ],
              }
    };
  },
  props: ["parent"],
  computed: {
                                                                                                                                                      },
  methods: {
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
                    if(o=='caipinpingfen'){
            this.ruleForm.caipinpingfen = obj[o];
            continue;
          }
                    if(o=='peisongpingfen'){
            this.ruleForm.peisongpingfen = obj[o];
            continue;
          }
                    if(o=='shangjiapingfen'){
            this.ruleForm.shangjiapingfen = obj[o];
            continue;
          }
                    if(o=='pingyu'){
            this.ruleForm.pingyu = obj[o];
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
                    if(o=='sfsh'){
            this.ruleForm.sfsh = obj[o];
            continue;
          }
                    if(o=='shhf'){
            this.ruleForm.shhf = obj[o];
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
                                                                                                                                                                                                                                                                                          } else {
          this.$message.error(data.msg);
        }
      });
                                                                                                                  this.caipinpingfenOptions = "1,2,3,4,5".split(',')
                                        this.peisongpingfenOptions = "1,2,3,4,5".split(',')
                                        this.shangjiapingfenOptions = "1,2,3,4,5".split(',')
                                                                                                                      },
                                                                                                        // 多级联动参数
                                                                                                                                    info(id) {
      this.$http({
        url: `shangpinpingjia/info/${id}`,
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
                                                                                                                                                                                                                                                            this.$refs["ruleForm"].validate(valid => {
        if (valid) {
          this.$http({
            url: `shangpinpingjia/${!this.ruleForm.id ? "save" : "update"}`,
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
                  this.parent.shangpinpingjiaCrossAddOrUpdateFlag = false;
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
      this.parent.shangpinpingjiaCrossAddOrUpdateFlag = false;
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
