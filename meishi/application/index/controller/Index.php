<?php
namespace app\index\controller;
use think\Controller;
use think\View;
use think\Db;
use think\Session;
class Index extends Controller
{
    public function index()
    {
        $re=Db::table('meishi_food')->select();
        $this->assign('re',$re);
        return $this->fetch();
    }

    public function indexdl()
    {
        $re=Db::table('meishi_food')->select();
        //dump($re);
        $this->assign('re',$re);
        return $this->fetch();
    }

    public function login()
    {
        return $this->fetch();
    }

    public function register()
    {
        return $this->fetch();
    }

    public function denglu(){
    	$data = [       								
                'username' => input('username'),  
                'password' => input('password'),
            ];

        //与数据库数据匹配
        $result=Db::query("select * from meishi_user where username='{$data['username']}' and password='{$data['password']}'");
        $result2=Db::query("select * from meishi_admin where username='{$data['username']}' and password='{$data['password']}'");
        $result3=Db::query("select * from meishi_seller where username='{$data['username']}' and password='{$data['password']}'");
        if ($result){
            session('user',$data['username']);       
        	$this->success('登陆成功!',url('indexdl'));
        }
        elseif ($result2) {
        	session('admin',$data['username']); 
            $time=time();
            session('time',$time);       
        	$this->success('登陆成功!',url('admin/index'));
        }
        elseif ($result3) {
        	session('seller',$data['username']);  
            $time=time();
            session('time',$time);       
        	$this->success('登陆成功!',url('seller/index'));
        }
        else{
        	$this->error('登陆失败!');
        }
    }

    public function zhuce(){
    	$data = [       								  
                'username' => input('username'),  
                'password' => input('password'),
            ]; 

            //将注册信息插入数据库      	
			if(Db::table('meishi_user')->insert($data)){          
   				$this->success('注册成功!',url('login'));
   			}else{  
   				$this->error('注册失败!'); 
   			}
    }

    public function diancan($id,$username){
        $time=time();
        $re=Db::table('meishi_food')->where('id',$id)->find();
        $data = [     
                'username' => $username,  
                'name' => $re['name'],  
                'price' => $re['price'],
                'time'=>$time,
            ];
        if(Db::table('meishi_order')->insert($data)){        //添加数据  
            $this->success('点餐成功!',url('indexdl'));          //成功后跳转   
            }else{  
            $this->error('点餐失败!'); 
            }
    }

    public function gerenzhongxin($username){
        $re=Db::table('meishi_order')->where('username',$username)->select();
        $this->assign('re',$re);
        return $this->fetch();
    }

    public function sousuo(){
        $data=input('sousuo');
        $re=Db::table('meishi_food')->where('name','like','%'.$data.'%')->select();
        $this->assign('re',$re);
        return $this->fetch();
    }

    public function sousuodl(){
        $data=input('sousuodl');
        $re=Db::table('meishi_food')->where('name','like','%'.$data.'%')->select();
        $this->assign('re',$re);
        return $this->fetch();
    }
}
