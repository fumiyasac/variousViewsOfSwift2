//
//  BaseState.swift
//  variousViewsOfSwift2
//
//  Created by 酒井文也 on 2015/06/05.
//  Copyright (c) 2015年 just1factory. All rights reserved.
//

//表示コンテンツビューの状態のenum
enum BaseState{
    
    //現在の状態
    case One
    case Two
    
    //対応するセグメントコントロールの値を返す
    func toSegmentControlNum() -> Int {
        switch (self){
            case .One:
                return 0
            case .Two:
                return 1
        }
    }
}
