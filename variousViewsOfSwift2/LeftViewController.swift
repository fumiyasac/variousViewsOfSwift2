//
//  LeftViewController.swift
//  variousViewsOfSwift2
//
//  Created by 酒井文也 on 2015/06/02.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

//CALayerクラスのインポート
import QuartzCore

class LeftViewController: UIViewController {
    
    //ボタンのサイズと間隔の変数
    var buttonSpace: Int!
    var buttonSize: Int!
    var buttonFont: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //変数に値をセット
        self.buttonSpace = 10
        self.buttonSize = 60
        self.buttonFont = 11.0
        
        //ボタンの配置を行う
        for i in 0...4{
            
            //ボタンをContainerViewのViewControllerへ配置する
            var button: UIButton = UIButton()
            var buttonPosY = 50 + (self.buttonSpace + self.buttonSize) * i
            button.frame = CGRectMake(CGFloat(10.0), CGFloat(buttonPosY), CGFloat(self.buttonSize), CGFloat(self.buttonSize))
            
            //ボタンのセッティング
            button.setTitle("Btn", forState: .Normal)
            button.backgroundColor = UIColor.lightGrayColor()
            button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            button.titleLabel!.font = UIFont(name: "System", size: CGFloat(self.buttonFont))
            button.layer.cornerRadius = CGFloat(self.buttonSize/2)
            
            //配置したボタンに押した際のアクションを設定する
            button.addTarget(self, action: "buttonTapped:", forControlEvents: .TouchUpInside)
            
            //ボタンを配置する
            self.view.addSubview(button)
        }
    }

    //ボタンをタップした時のアクション
    func buttonTapped(button: UIButton){
        println("Left Button Tapped！")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
