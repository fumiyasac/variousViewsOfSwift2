//
//  ContentTableViewController.swift
//  variousViewsOfSwift2
//
//  Created by 酒井文也 on 2015/06/02.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

class ContentOneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //コンテンツ用テーブルビュー
    @IBOutlet var contentOneTableView: UITableView!
    
    //テーブルビューの要素数
    let sectionCount: Int = 1
    
    //テーブルビューのセル数
    let cellCount: Int = 16
    
    //テーブルビューセルの高さ(Xibのサイズに合わせるのが理想)
    let cellDefaultHeight: CGFloat = 60.0
    let cellSelectedHeight: CGFloat = 320.0
    
    var selectedIndexPath: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectedIndexPath = nil;
        
        //デリゲート
        self.contentOneTableView.delegate = self
        self.contentOneTableView.dataSource = self
        
        //Xibのクラスを読み込む宣言を行う
        let nibDefault:UINib = UINib(nibName: "OneDefaultTableViewCell", bundle: nil)
        self.contentOneTableView.registerNib(nibDefault, forCellReuseIdentifier: "oneDefaultCell")
        
        let nibSelected:UINib = UINib(nibName: "OneSelectedTableViewCell", bundle: nil)
        self.contentOneTableView.registerNib(nibSelected, forCellReuseIdentifier: "oneSelectedCell")
        
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

        //開閉の制御をするための条件分岐
        if(self.targetCellSelected(indexPath)){
            
            //Xibファイルを元にデータを作成する
            let cell = tableView.dequeueReusableCellWithIdentifier("oneSelectedCell") as? OneSelectedTableViewCell;
            
            //テキスト・画像等の表示
            cell!.oneTitle.text = "2015年梅雨入り宣言"
            cell!.oneDate.text = "2015.06.06"
            cell!.oneName.text = "fumiyasac"
            cell!.oneText.text = "もうそろそろ梅雨入りすると思いますので、健康や体調の管理はもちろんなんですがもろもろ気を付けましょう。"
            
            //セルのアクセサリタイプと背景の設定
            cell!.accessoryType = UITableViewCellAccessoryType.None;
            cell!.selectionStyle = UITableViewCellSelectionStyle.None;
            
            return cell!
            
        }else{
            
            //Xibファイルを元にデータを作成する
            let cell = tableView.dequeueReusableCellWithIdentifier("oneDefaultCell") as? OneDefaultTableViewCell;
            
            //テキスト・画像等の表示
            cell!.oneTitle.text = "2015年梅雨入り宣言"
            cell!.oneDate.text = "2015.06.06"
            cell!.oneName.text = "fumiyasac"
            
            //セルのアクセサリタイプと背景の設定
            cell!.accessoryType = UITableViewCellAccessoryType.None;
            cell!.selectionStyle = UITableViewCellSelectionStyle.None;
            
            return cell!
        }

    }
    
    //セルをタップした時に呼び出される
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("Contents One TableView Tapped！")
        if (self.targetCellSelected(indexPath)) {
            self.selectedIndexPath = nil;
        } else {
            self.selectedIndexPath = indexPath;
        }
        self.reloadData();
    }
    
    //セルの高さを返す ※必須
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if(self.targetCellSelected(indexPath)){
            return cellSelectedHeight
        }else{
            return cellDefaultHeight
        }
    }
    
    //トグルさせるビューを決定する
    func targetCellSelected(tagetIndexPath: NSIndexPath) -> Bool {
        
        if(self.selectedIndexPath != nil
            && tagetIndexPath.row == self.selectedIndexPath!.row
            && tagetIndexPath.section == self.selectedIndexPath!.section){
            return true
        }else{
            return false
        }
    }
    
    //テーブルビューをリロードする
    func reloadData(){
        self.contentOneTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
