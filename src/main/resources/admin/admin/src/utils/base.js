const base = {
    get() {
                return {
            url : "http://localhost:8080/springbootXX15T/",
            name: "springbootXX15T",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/springbootXX15T/front/index.html'
        }
            },
    getProjectName(){
        return {
            projectName: "外卖点餐系统"
        } 
    }
}
export default base