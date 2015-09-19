//
//  RightViewController.swift
//  variousViewsOfSwift2
//
//  Created by 酒井文也 on 2015/06/02.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

class RightViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var infoTableView: UITableView!
    
    //テーブルビューの要素数
    let sectionCount: Int = 1
    
    //テーブルビューのセル数
    let cellCount: Int = 10
    
    //テーブルビューセルの高さ(Xibのサイズに合わせるのが理想)
    let cellHeight: CGFloat = 80.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //デリゲート
        self.infoTableView.delegate = self
        self.infoTableView.dataSource = self
        
        //Xibのクラスを読み込む宣言を行う
        let nib:UINib = UINib(nibName: "RightViewTableCell", bundle: nil)
        self.infoTableView.registerNib(nib, forCellReuseIdentifier: "RightCell")
    }

    //テーブルの要素数を設定する ※必須
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        //要素数を返す
        return sectionCount
    }
    
    //テーブルの行数を設定する ※必須
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //セクションのセル数
        return cellCount
    }
    
    //表示するセルの中身を設定する ※必須
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //Xibファイルを元にデータを作成する
        let cell = tableView.dequeueReusableCellWithIdentifier("RightCell") as? RightViewTableCell;
            
        //テキスト・画像等の表示
        cell!.rightTableTitle.text = "お知らせ"
        cell!.rightTableDate.text = "2015.06.06"
        cell!.rightTableDescription.text = "新しいメッセージが届きました！"
        
        //セルのアクセサリタイプ
        cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator;

        //セルタップ時の背景を変えない
        cell!.selectionStyle = UITableViewCellSelectionStyle.None;
        
        return cell!
    }
    
    //セルをタップした時に呼び出される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Right TableView Tapped！")
    }
    
    //セルの高さを返す ※必須
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return cellHeight
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
