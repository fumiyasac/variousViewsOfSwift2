//
//  BaseViewController.swift
//  variousViewsOfSwift2
//
//  Created by 酒井文也 on 2015/06/02.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    //コンテンツのコンテナビュー
    @IBOutlet var oneContainer: UIView!
    @IBOutlet var twoContainer: UIView!
    
    //コンテンツの切り替え用のセグメントコントロール
    @IBOutlet var selectControl: UISegmentedControl?
    
    //現在の状態を判定する
    var state: BaseState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初期状態
        self.state = BaseState.One
        self.switchingDisplayContainer(self.state)
    }

    //表示コンテナを切り替える
    @IBAction func changeContainer(sender: UISegmentedControl) {
        
        switch (sender.selectedSegmentIndex) {
            case 0:
                self.state = BaseState.One
            case 1:
                self.state = BaseState.Two
            default:
                self.state = BaseState.One
        }
        self.switchingDisplayContainer(self.state)
    }
    
    //コンテンツ全体をスイッチするメソッド
    func switchingWholeContainer(displayState: BaseState) {
        
        //アニメーション位置を決める
        UIView.animateWithDuration(0.2, delay: 0, options: nil, animations: {
            
            //表示コンテナの制御を行う
            self.switchingDisplayContainer(displayState)
            
        }, completion: nil)
    }
    
    //表示するコンテナビューを決定するメソッド
    func switchingDisplayContainer(displayState: BaseState) {
        
        if(displayState.toSegmentControlNum() == BaseState.One.toSegmentControlNum()){
            
            self.oneContainer.alpha = 1;
            self.view.addSubview(self.oneContainer)
            
            self.twoContainer.alpha = 0;
            self.twoContainer.removeFromSuperview()
            
        }else if(displayState == BaseState.Two){
            
            self.oneContainer.alpha = 0;
            self.oneContainer.removeFromSuperview()
            
            self.twoContainer.alpha = 1;
            self.view.addSubview(self.twoContainer)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
