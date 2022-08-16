//
//  TipDetail.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/15.
//

import Foundation

struct TipDetail: Hashable {
    let id = UUID()
    let category: String
    let accountName: String
    let imageURL: URL
    
    private(set) var title = "テスト"
    var detail: String {
        didSet {
            title = ""  // 切り取っていれる
        }
    }
    private(set) var publishedDate = Date()
    var publishedDateString: String {
        didSet {
            publishedDate = Date()  // publishedDateから計算する
        }
    }
    
    init(category: String, accountName: String, imageURL: URL, detail: String, publishedDateString: String) {
        self.category = category
        self.accountName = accountName
        self.imageURL = imageURL
        self.detail = detail
        self.publishedDateString = publishedDateString
    }
}

let tip = TipDetail(category: "2", accountName: "2", imageURL: URL(string: "2")!, detail: "2", publishedDateString: "2")
