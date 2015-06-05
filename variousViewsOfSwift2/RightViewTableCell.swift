//
//  RightViewTableCell.swift
//  variousViewsOfSwift2
//
//  Created by 酒井文也 on 2015/06/04.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

import UIKit

class RightViewTableCell: UITableViewCell {
    
    //セル内の要素の設定
    @IBOutlet var rightTableImage: UIImageView!
    @IBOutlet var rightTableTitle: UILabel!
    @IBOutlet var rightTableDate: UILabel!
    @IBOutlet var rightTableDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
