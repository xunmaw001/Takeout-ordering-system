<template>
  <div>
    <img class="bg" src="@/assets/img/bg.jpg">
    <el-form :model="ruleForm" :rules="rules" ref="ruleForm" class="login-form">
      <h1 class="h1">外卖点餐系统注册</h1>
                              <el-form-item v-if="tableName=='yonghu'" label="账号" prop="yonghuzhanghao">
        <el-input v-model="ruleForm.zhanghao" placeholder="账号"></el-input>
      </el-form-item>
                        <el-form-item v-if="tableName=='yonghu'" label="密码" prop="yonghumima">
        <el-input v-model="ruleForm.mima" placeholder="密码"></el-input>
      </el-form-item>
                        <el-form-item v-if="tableName=='yonghu'" label="姓名" prop="yonghuxingming">
        <el-input v-model="ruleForm.xingming" placeholder="姓名"></el-input>
      </el-form-item>
                                                            <el-form-item v-if="tableName=='yonghu'" label="手机" prop="yonghushouji">
        <el-input v-model="ruleForm.shouji" placeholder="手机"></el-input>
      </el-form-item>
                        <el-form-item v-if="tableName=='yonghu'" label="地址" prop="yonghudizhi">
        <el-input v-model="ruleForm.dizhi" placeholder="地址"></el-input>
      </el-form-item>
                                                <el-form-item v-if="tableName=='shangjia'" label="商家编号" prop="shangjiashangjiabianhao">
        <el-input v-model="ruleForm.shangjiabianhao" placeholder="商家编号"></el-input>
      </el-form-item>
                        <el-form-item v-if="tableName=='shangjia'" label="密码" prop="shangjiamima">
        <el-input v-model="ruleForm.mima" placeholder="密码"></el-input>
      </el-form-item>
                        <el-form-item v-if="tableName=='shangjia'" label="商家名称" prop="shangjiashangjiamingcheng">
        <el-input v-model="ruleForm.shangjiamingcheng" placeholder="商家名称"></el-input>
      </el-form-item>
                                          <el-form-item v-if="tableName=='shangjia'" label="联系人" prop="shangjialianxiren">
        <el-input v-model="ruleForm.lianxiren" placeholder="联系人"></el-input>
      </el-form-item>
                        <el-form-item v-if="tableName=='shangjia'" label="联系电话" prop="shangjialianxidianhua">
        <el-input v-model="ruleForm.lianxidianhua" placeholder="联系电话"></el-input>
      </el-form-item>
                        <el-form-item v-if="tableName=='shangjia'" label="特色" prop="shangjiatese">
        <el-input v-model="ruleForm.tese" placeholder="特色"></el-input>
      </el-form-item>
                        <el-form-item v-if="tableName=='shangjia'" label="地址" prop="shangjiadizhi">
        <el-input v-model="ruleForm.dizhi" placeholder="地址"></el-input>
      </el-form-item>
                                                                                                      <el-form-item v-if="tableName=='qishou'" label="用户名" prop="qishouyonghuming">
        <el-input v-model="ruleForm.yonghuming" placeholder="用户名"></el-input>
      </el-form-item>
                        <el-form-item v-if="tableName=='qishou'" label="密码" prop="qishoumima">
        <el-input v-model="ruleForm.mima" placeholder="密码"></el-input>
      </el-form-item>
                        <el-form-item v-if="tableName=='qishou'" label="骑手姓名" prop="qishouqishouxingming">
        <el-input v-model="ruleForm.qishouxingming" placeholder="骑手姓名"></el-input>
      </el-form-item>
                                                            <el-form-item v-if="tableName=='qishou'" label="电话" prop="qishoudianhua">
        <el-input v-model="ruleForm.dianhua" placeholder="电话"></el-input>
      </el-form-item>
                                                                              <el-button @click="login()" class="btn-login" type="primary">注册</el-button>
    </el-form>
  </div>
</template>
<script>
export default {
  data() {
    return {
      ruleForm: {
              },
      tableName:"",
      rules: {}
    };
  },
  mounted(){
    let table = this.$storage.get("loginTable");
    this.tableName = table;
  },
  methods: {
    // 获取uuid
    getUUID () {
      return new Date().getTime();
    },
    // 注册
    login() {
                              if((!this.ruleForm.zhanghao) && `yonghu` == this.tableName){
        this.$message.error(`账号不能为空`);
        return
      }
                                                            if((!this.ruleForm.mima) && `yonghu` == this.tableName){
        this.$message.error(`密码不能为空`);
        return
      }
                                                                                                                                                                                                                              if(`yonghu` == this.tableName && this.ruleForm.shouji&&(!this.$validate.isMobile(this.ruleForm.shouji))){
        this.$message.error(`手机应输入电话格式`);
        return
      }
                                                                                                                  if((!this.ruleForm.shangjiabianhao) && `shangjia` == this.tableName){
        this.$message.error(`商家编号不能为空`);
        return
      }
                                                            if((!this.ruleForm.mima) && `shangjia` == this.tableName){
        this.$message.error(`密码不能为空`);
        return
      }
                                                                                                                                                                                                                              if(`shangjia` == this.tableName && this.ruleForm.lianxidianhua&&(!this.$validate.isMobile(this.ruleForm.lianxidianhua))){
        this.$message.error(`联系电话应输入电话格式`);
        return
      }
                                                                                                                                                                                                                                                      if((!this.ruleForm.yonghuming) && `qishou` == this.tableName){
        this.$message.error(`用户名不能为空`);
        return
      }
                                                            if((!this.ruleForm.mima) && `qishou` == this.tableName){
        this.$message.error(`密码不能为空`);
        return
      }
                                                                                                                                                                                                                              if(`qishou` == this.tableName && this.ruleForm.dianhua&&(!this.$validate.isMobile(this.ruleForm.dianhua))){
        this.$message.error(`电话应输入电话格式`);
        return
      }
                                                                                                this.$refs["ruleForm"].validate(valid => {
        if (valid) {
          this.$http({
            url: `${this.tableName}/register`,
            method: "post",
            data:this.ruleForm
          }).then(({ data }) => {
            if (data && data.code === 0) {
              this.$router.replace({ path: "/login" });
            } else {
              this.$message.error(data.msg);
            }
          });
        }
      });
    }
  }
};
</script>
<style lang="scss" scoped>
</style>
