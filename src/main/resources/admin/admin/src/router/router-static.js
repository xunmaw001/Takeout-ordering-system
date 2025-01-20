import Vue from 'vue';
//配置路由
import VueRouter from 'vue-router'
Vue.use(VueRouter);
//1.创建组件
import Index from '@/views/index'
import Home from '@/views/home'
import Login from '@/views/login'
import NotFound from '@/views/404'
import UpdatePassword from '@/views/update-password'
import pay from '@/views/pay'
import register from '@/views/register'
import center from '@/views/center'
import adminexam from '@/views/modules/shijuanliebiao/exam'
    import news from '@/views/modules/news/list'
    import qishou from '@/views/modules/qishou/list'
    import caipin from '@/views/modules/caipin/list'
    import shangpinpingjia from '@/views/modules/shangpinpingjia/list'
    import lunbotuguanli from '@/views/modules/lunbotuguanli/list'
    import yonghu from '@/views/modules/yonghu/list'
    import dingdan from '@/views/modules/dingdan/list'
    import peisongdan from '@/views/modules/peisongdan/list'
    import storeup from '@/views/modules/storeup/list'
    import shangjia from '@/views/modules/shangjia/list'
    import caipinfenlei from '@/views/modules/caipinfenlei/list'

//2.配置路由   注意：名字
const routes = [
    {
        path: '/index', name:'index', component: Index, children: [{
            // 这里不设置值，是把main作为默认页面
            path: '/',
            name: 'home',
            component: Home
        },{
            path: '/updatePassword',
            name: 'updatePassword',
            component: UpdatePassword
        } ,{
            path: '/pay',
            name: 'pay',
            component: pay
        } ,{
            path: '/center',
            name: 'center',
            component: center
        } 
                    ,{
                path: '/news',
                name: 'news',
                component: news
            } 
                    ,{
                path: '/qishou',
                name: 'qishou',
                component: qishou
            } 
                    ,{
                path: '/caipin',
                name: 'caipin',
                component: caipin
            } 
                    ,{
                path: '/shangpinpingjia',
                name: 'shangpinpingjia',
                component: shangpinpingjia
            } 
                    ,{
                path: '/lunbotuguanli',
                name: 'lunbotuguanli',
                component: lunbotuguanli
            } 
                    ,{
                path: '/yonghu',
                name: 'yonghu',
                component: yonghu
            } 
                    ,{
                path: '/dingdan',
                name: 'dingdan',
                component: dingdan
            } 
                    ,{
                path: '/peisongdan',
                name: 'peisongdan',
                component: peisongdan
            } 
                    ,{
                path: '/storeup',
                name: 'storeup',
                component: storeup
            } 
                    ,{
                path: '/shangjia',
                name: 'shangjia',
                component: shangjia
            } 
                    ,{
                path: '/caipinfenlei',
                name: 'caipinfenlei',
                component: caipinfenlei
            } 
                ]
    },
    { path: '/adminexam', name: 'adminexam', component: adminexam },
    { path: '/login', name:'login', component: Login },
    { path: '/register', name:'register', component: register },
    { path: '/', redirect: '/index/' },      /*默认跳转路由*/
    { path: '*', component: NotFound }
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
    mode: 'hash',   /*hash模式改为history*/
    routes // （缩写）相当于 routes: routes
})

export default router;

