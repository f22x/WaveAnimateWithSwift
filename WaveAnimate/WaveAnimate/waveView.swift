//
//  waveView.swift
//  WaveAnimate
//
//  Created by xinglei on 15/7/3.
//  Copyright (c) 2015年 ZPlay. All rights reserved.
//

import UIKit

class waveView: UIView {
    
    var imageBig : UIImageView!
    var top : CGFloat = 0
    var bottom : CGFloat = 0
    var left : CGFloat = 0
    var right : CGFloat = 0
    var width : CGFloat = 0
    var height : CGFloat = 0
    var centerx : CGFloat = 0
    var centery : CGFloat = 0
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        //        子类背景为黑色
        self.backgroundColor = UIColor.blackColor()
        //       创建一个基础动画
        var transformRoate = CABasicAnimation(keyPath: "transform.rotation")
        //        按圆周旋角度(每个圆周率算作转一圈)
        transformRoate.byValue = 2 * M_PI
        //        持续时间（2秒转2圈）
        transformRoate.duration = 2
        //        重复次数
        transformRoate.repeatCount = 2
        //        线图
        var image = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        //        波浪图（处于线图下方）
        imageBig = UIImageView(frame: CGRectMake(0, image.frame.size.height, 450, 300))
        var bigImagePath = NSString()
        bigImagePath = NSBundle.mainBundle().pathForResource("fb_wave.png", ofType: nil)!
        imageBig.image = UIImage(contentsOfFile: bigImagePath as String)
        //        把波浪图加在背景视图上
        var backView = UIView(frame: CGRectMake(0, 0, 100, 100))
        backView.clipsToBounds = true
        backView.layer.cornerRadius = 50
        backView.addSubview(imageBig)
        self.addSubview(backView)
        
        var path = NSString()
        path = NSBundle.mainBundle().pathForResource("fb_rotation.png", ofType: nil)!
        image.image = UIImage(contentsOfFile:path as String)
        //        添加外侧旋转线动画
        image.layer.addAnimation(transformRoate, forKey: "rotationAnimation")
        self.addSubview(image)
        
        self.type()
    }

    //      开始波浪
    func start(start:CGFloat){
    
        var moveAction = CAKeyframeAnimation(keyPath: "position.x")
        //        波动范围
        moveAction.values = [-60,start]
        moveAction.duration = 4
        moveAction.repeatCount = MAXFLOAT
        
        imageBig.layer.addAnimation(moveAction, forKey: "waveMoveAnimation")
    }
    
    func type(){
        
        UIView .animateWithDuration(4, animations: { () -> Void in
//            控制波浪的顶峰位置
            self.imageBig.frame = CGRectMake(0, 300, self.imageBig.frame.size.width, self.imageBig.frame.size.height)
//            由横向位移来造成视觉上的滚动效果(4秒内转移100)
            self.imageBig.frame = CGRectMake(-100, 0, self.imageBig.frame.size.width, self.imageBig.frame.size.height)
        }) { (Bool) -> Void in
            UIView .animateWithDuration(1, animations: { () -> Void in
                self.imageBig.frame = CGRectMake(0, 50, self.imageBig.frame.size.width, self.imageBig.frame.size.height)
            }, completion: { (Bool) -> Void in
                println(self.imageBig.layer.position.x)
                self.start(self.imageBig.layer.position.x)
            })
        }
    
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
