//
//  ContentScrollViewController.swift
//  variousViewsOfSwift2
//
//  Created by 酒井文也 on 2015/06/02.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

class ContentTwoViewController: UIViewController, UIScrollViewDelegate {

    //ページ数（= 総ページ数 - 1）
    let pageNumber = 6;
    
    //スクロールビューにはめる画像のサイズ
    var deviceImageHeight: CGFloat!
    var deviceImageWidth: CGFloat!
    
    //データを表示するスクロールビュー
    @IBOutlet var twoScrollView: UIScrollView!
    
    //ページコントロール
    @IBOutlet var twoPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //対象画像の縦・横サイズを決定
        self.deviceImageHeight = self.view.frame.size.height - 90
        self.deviceImageWidth = self.view.frame.size.width
        
        //スクロールビューの設定
        self.twoScrollView.contentSize = CGSizeMake(
            self.view.frame.size.width,
            deviceImageHeight * CGFloat(pageNumber + 1)
        )
        
        // ページコントロールの初期値設定
        self.twoPageControl.numberOfPages = pageNumber + 1;
        self.twoPageControl.currentPage = 0
        
        //UIScrollViewの細かい設定
        self.initWithScrollViewSetting()
        
        //画像やテキストの配置に関する設定
        for i in 0...pageNumber{
            
            //配置する要素のY座標を設定
            var imageViewPosY = (Int)(self.deviceImageHeight) * i
            var mainLabelPosY = (Int)(self.deviceImageHeight) * (i + 1) - 70
            var subLabelPosY  = (Int)(self.deviceImageHeight) * (i + 1) - 48
            
            //画像の配置（画像は今回ない）
            var targetImageView = UIImageView()
            targetImageView.frame = CGRectMake(0.0, CGFloat(imageViewPosY), self.deviceImageWidth, self.deviceImageHeight)
            targetImageView.backgroundColor = UIColor.lightGrayColor()
            self.twoScrollView.addSubview(targetImageView)
            
            //メインラベルの配置
            var targetMainLabel = UILabel()
            targetMainLabel.frame = CGRectMake(5.0, CGFloat(mainLabelPosY), CGFloat(self.deviceImageWidth - 10), 20.0)
            targetMainLabel.textAlignment = NSTextAlignment.Left
            targetMainLabel.font = UIFont(name: "System", size: CGFloat(14.0))
            targetMainLabel.textColor = UIColor.whiteColor()
            targetMainLabel.text = "特集記事アーカイブ"
            self.twoScrollView.addSubview(targetMainLabel)
            
            //サブラベルの配置
            var targetSubLabel = UILabel()
            targetSubLabel.frame = CGRectMake(5.0, CGFloat(subLabelPosY), CGFloat(self.deviceImageWidth - 10), 20.0)
            targetSubLabel.textAlignment = NSTextAlignment.Left
            targetSubLabel.font = UIFont(name: "System", size: CGFloat(14.0))
            targetSubLabel.textColor = UIColor.whiteColor()
            targetSubLabel.text = "2015.06.06"
            self.twoScrollView.addSubview(targetSubLabel)
        }
    }
    
    //UIScrollViewの設定
    func initWithScrollViewSetting() {
        
        //オプションの設定（今回は縦にスクロール）
        self.twoScrollView.delegate = self
        self.twoScrollView.pagingEnabled = true
        self.twoScrollView.scrollEnabled = true
        self.twoScrollView.directionalLockEnabled = true
        self.twoScrollView.showsHorizontalScrollIndicator = false
        self.twoScrollView.showsVerticalScrollIndicator = true
        self.twoScrollView.bounces = true
        self.twoScrollView.scrollsToTop = false
    }
    
    //スクロールを検知した際に行われる処理
    func scrollViewDidScroll(scrollview: UIScrollView) {
        
        //画像の位置から画像の番号を判別する
        var pageHeight : CGFloat = (CGFloat)(self.twoScrollView.frame.size.height)
        var fractionalPage : Double = Double(self.twoScrollView.contentOffset.y / pageHeight)
        var page : NSInteger = lround(fractionalPage)
        self.twoPageControl.currentPage = page;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
