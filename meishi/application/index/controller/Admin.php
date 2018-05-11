<?php
namespace app\index\controller;
use think\Controller;
use think\View;
use think\Db;
class Admin extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function diancanliebiao(){
		$re=Db::query("select * from meishi_order");
		$this->assign('re',$re);
		return $this ->fetch();
	}

	public function tianjiadiancan(){
		return $this ->fetch();
	}

	public function diancantianjia(){
		$time=time();
		$data=input();
		$data = [     
				'username' => input('username'),  
                'name' => input('name'),  
                'price' => input('price'),
                'time'=>$time,
            ];
        if(Db::table('meishi_order')->insert($data)){        //添加数据  
   			$this->success('添加成功!',url('diancanliebiao')); 			//成功后跳转   
   			}else{  
   			$this->error('添加失败!'); 
   			}
	}


	public function diancanxiugai($id){
		$time=time();
		$data = [     
				'username' => input('username'),  
                'name' => input('name'),  
                'price' => input('price'),
                'time'=>$time,
            ];
            // dump($data);
            // dump($id);
            $shu=Db::table('meishi_order')->where('id',$id)->update($data);
            if($shu>0)
            {
            	$this->success('修改成功!',url('diancanliebiao'));
            }else{
            	$this->error('修改失败!');
            }
	}

	public function shanchudiancan($id){
		Db::table('meishi_order')->where('id',$id)->delete();
	}

	public function xiugaidiancan($id){
        $re=Db::table('meishi_order')->where('id',$id)->find();
        $this->assign('re',$re);
        //dump($id);
		return $this->fetch();
	}

	public function yonghuliebiao(){
		$re=Db::query("select * from meishi_user");
		//dump($re);
		$this->assign('re',$re);
		return $this->fetch();
	}

	public function tianjiayonghu(){
		return $this->fetch();
	}

	public function yonghutianjia(){
		$data = [     
				'username' => input('username'),  
                'password' => input('password'),  
            ];
        if(Db::table('meishi_user')->insert($data)){        //添加数据  
   			$this->success('添加成功!',url('yonghuliebiao')); 			//成功后跳转   
   			}else{  
   			$this->error('添加失败!'); 
   			}
	}

	public function shanchuyonghu($id){
		//dump($id);
		Db::table('meishi_user')->where('id',$id)->delete();
	}

		public function shangjialiebiao(){
		$re=Db::query("select * from meishi_seller");
		//dump($re);
		$this->assign('re',$re);
		return $this->fetch();
	}

	public function tianjiashangjia(){
		return $this->fetch();
	}

	public function shangjiatianjia(){
		$data = [     
				'username' => input('username'),  
                'password' => input('password'),  
            ];
        if(Db::table('meishi_seller')->insert($data)){        //添加数据  
   			$this->success('添加成功!',url('shangjialiebiao')); 			//成功后跳转   
   			}else{  
   			$this->error('添加失败!'); 
   			}
	}

	public function shanchushangjia($id){
		//dump($id);
		Db::table('meishi_seller')->where('id',$id)->delete();
	}

	public function tijiaoliuyan($username){
		$time=time();
		$data=[
			'username'=>$username,
			'name'=>input('name'),
			'phone'=>input('phone'),
			'email'=>input('email'),
			'message'=>input('message'),
			'time'=>$time,
		];
		if(Db::table('meishi_liuyan')->insert($data)){        //添加数据  
   			$this->success('留言成功!',url('index/indexdl')); 			//成功后跳转   
   			}else{  
   			$this->error('留言失败!'); 
   			}
	}

	public function shanchuliuyan($id){
		//dump($id);
		Db::table('meishi_liuyan')->where('id',$id)->delete();
	}

	public function liuyanliebiao(){
		$re=Db::query("select * from meishi_liuyan");
		//dump($re);
		$this->assign('re',$re);
		return $this ->fetch();
	}
}
