//
//  OneSelectedTableViewCell.swift
//  variousViewsOfSwift2
//
//  Created by 酒井文也 on 2015/06/05.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

class OneSelectedTableViewCell: UITableViewCell, UITextFieldDelegate {

    //テーブルビューに記載する要素
    @IBOutlet var oneTitle: UILabel!
    @IBOutlet var oneName: UILabel!
    @IBOutlet var oneDate: UILabel!
    @IBOutlet var oneImage: UIImageView!
    @IBOutlet var oneText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //UITextFieldの制御
        self.oneText.editable = false
        self.oneText.userInteractionEnabled = false
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
