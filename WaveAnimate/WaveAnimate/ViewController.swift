//
//  ViewController.swift
//  WaveAnimate
//
//  Created by xinglei on 15/7/3.
//  Copyright (c) 2015年 ZPlay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var wave : waveView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wave = waveView(frame: CGRectMake(0, 0, 100, 100))
        view.addSubview(wave)
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

