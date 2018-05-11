<?php
namespace app\index\controller;
use think\Controller;
use think\View;
use think\Db;
class Seller extends Controller
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

	public function caidanliebiao(){
		$re=Db::query("select * from meishi_food");
		$this->assign('re',$re);
		return $this->fetch();
	}

	public function shangchuancaipin(){
		return $this->fetch();
	}

	public function caipinshangchuan(){
        $file = request()->file('pic');
        $info = $file->move('static/seller/img');
        $pic=$info->getSaveName();
		$data = [     
                'name' => input('name'),  
                'price' => input('price'),
                'num'=>input('num'),
                'pic'=>$pic,
            ];
        if(Db::table('meishi_food')->insert($data)){        //添加数据  
   			$this->success('上传成功!',url('caidanliebiao')); 			//成功后跳转   
   			}else{  
   			$this->error('上传失败!'); 
   			}
	}

	public function xiugaicaipin($id){
		$re=Db::table('meishi_food')->where('id',$id)->find();
        $this->assign('re',$re);
		return $this->fetch();
	}

	public function caipinxiugai($id){
        $file = request()->file('pic');
        $info = $file->move('static/seller/img');
        $pic=$info->getSaveName();
		$data = [     
                'name' => input('name'),  
                'price' => input('price'),
                'num'=>input('num'),
                'pic'=>$pic,
            ];
            // dump($data);
            // dump($id);
            $shu=Db::table('meishi_food')->where('id',$id)->update($data);
            if($shu>0)
            {
            	$this->success('修改成功!',url('caidanliebiao'));
            }else{
            	$this->error('修改失败!');
            }
	}

	public function shanchucaipin($id){
		Db::table('meishi_food')->where('id',$id)->delete();
	}

    public function shouruliebiao(){
        $time=time();
        $day=Db::table('meishi_order')->whereTime('time', 'd')->sum('price');
        $month=Db::table('meishi_order')->whereTime('time', 'm')->sum('price');
        $year=Db::table('meishi_order')->whereTime('time', 'y')->sum('price');
        $money=[
            'day'=>$day,
            'month'=>$month,
            'year'=>$year,
            'time'=>$time,
        ];
        $this->assign('money',$money);
        return $this->fetch();
    }

    public function xiugaizhuangtai($id){
        $re=Db::table('meishi_order')->where('id',$id)->update(['zhuangtai'=>'已配送']);
        if($re>0)
            {
                $this->success('订单配送成功!',url('diancanliebiao'));
            }else{
                $this->error('订单配送失败!');
            }
    }
}
