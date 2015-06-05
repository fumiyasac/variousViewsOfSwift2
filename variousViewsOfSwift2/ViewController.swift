//
//  ViewController.swift
//  variousViewsOfSwift2
//
//  Created by 酒井文也 on 2015/06/02.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

//ビュー全体の動きを司るためのアクション
class ViewController: UIViewController {

    //ベース・左・右コンテナ
    @IBOutlet var baseContainer: UIView!
    @IBOutlet var leftContainer: UIView!
    @IBOutlet var rightContainer: UIView!

    //透明ボタン
    @IBOutlet var controlButton: UIButton!
    
    //現在の状態を判定する
    var state: ContainerState!
    
    //画面の縦・横のメンバ変数
    var screenWidth: Int!
    var screenHeight: Int!
    
    override func viewWillAppear(animated: Bool) {
        
        //左右の状態がない状態
        self.state = ContainerState.Newtral
        
        //現在起動中のデバイスを取得
        self.screenWidth  = DeviseSize.screenWidth()
        self.screenHeight = DeviseSize.screenHeight()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.enabledSwitchButton(false)
    }
    
    //左スワイプ時のアクション
    @IBAction func leftSubMenuAction(sender: UISwipeGestureRecognizer) {
        self.leftSliderAnimation()
    }
    
    //左スワイプ時のアニメーションを追加する
    func leftSliderAnimation() {
        
        println("Left Swipe Recognized!")
        
        //メンバ変数の値を変更する
        if(self.state == ContainerState.Newtral){
            
            self.state = ContainerState.Right
            self.animateWithContents()
            
        }else if(self.state == ContainerState.Left){
            
            self.state = ContainerState.Newtral
            self.animateWithContents()
        }
    }
    
    //右スワイプ時のアクション
    @IBAction func rightSubMenuAction(sender: UISwipeGestureRecognizer) {
        self.rightSliderAnimation()
    }
    
    //右スワイプ時のアニメーションを追加する
    func rightSliderAnimation() {
        
        println("Right Swipe Recognized!")
        
        //メンバ変数の値を変更する
        if(self.state == ContainerState.Newtral){
            
            self.state = ContainerState.Left
            self.animateWithContents()
            
        }else if(self.state == ContainerState.Right){
            
            self.state = ContainerState.Newtral
            self.animateWithContents()
        }
    }
    
    //アニメーションをさせるための関数
    func animateWithContents() {
        
        //アニメーションをする
        UIView.animateWithDuration(0.2, delay: 0, options: nil, animations: {
            
            self.switchAlphaButton(self.state)
            
        }, completion: nil)
    }
    
    //アニメーション時の位置を設定する
    func switchAlphaButton(toState: ContainerState) {
        
        //各状態に応じて透明ボタンを土台コンテンツの位置を決定する
        if(toState == ContainerState.Left){
            
            self.enabledSwitchButton(true)
            self.controlButton.frame = CGRectMake(80.0, 0.0, (CGFloat)(self.screenWidth - 80), (CGFloat)(self.screenHeight))
            self.baseContainer.frame = CGRectMake(80.0, 0.0, (CGFloat)(self.screenWidth), (CGFloat)(self.screenHeight))
            
        }else if(toState == ContainerState.Right){
            
            self.enabledSwitchButton(true)
            self.controlButton.frame = CGRectMake(0.0, 0.0, (CGFloat)(self.screenWidth - 200), (CGFloat)(self.screenHeight))
            self.baseContainer.frame = CGRectMake(-200.0, 0.0, (CGFloat)(self.screenWidth), (CGFloat)(self.screenHeight))
            
        }else if(toState == ContainerState.Newtral){

            self.enabledSwitchButton(false)
            self.controlButton.frame = CGRectMake(0.0, 0.0, (CGFloat)(self.screenWidth), (CGFloat)(self.screenHeight))
            self.baseContainer.frame = CGRectMake(0.0, 0.0, (CGFloat)(self.screenWidth), (CGFloat)(self.screenHeight))
        }
    }
    
    //ボタンの活性・非活性を決定する
    func enabledSwitchButton(ret: Bool) {
        
        if(ret == true){
            
            self.controlButton.enabled = true
            self.controlButton.alpha = 0.6
            
        }else{
            
            self.controlButton.enabled = false
            self.controlButton.alpha = 0.0
        }
    }
    
    //サブメニューを閉じるボタン
    @IBAction func closeAlphaButton(sender: UIButton) {
        
        //閉じるボタンが押されれば通常状態に戻る
        self.state = ContainerState.Newtral
        self.animateWithContents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

