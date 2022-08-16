//
//  TipsListView.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/15.
//

import SwiftUI

struct TipsListView: View {
    private let list = [
        TipDetail(category: "機材", accountName: "kamimi0101010", imageURL: URL(string: "2")!, detail: "テストテストテストテストテストテスト3テスト4", publishedDateString: "2022/4/11"),
        TipDetail(category: "潜航", accountName: "kamimi0101010", imageURL: URL(string: "2")!, detail: "テストテストテストテストテストテスト3テスト4", publishedDateString: "2022/4/11"),
        TipDetail(category: "ナビゲーション", accountName: "kamimi0101010", imageURL: URL(string: "2")!, detail: "テストテストテストテストテストテスト3テスト4", publishedDateString: "2022/4/11"),
        TipDetail(category: "機材", accountName: "kamimi0101010", imageURL: URL(string: "2")!, detail: "テストテストテストテストテストテスト3テスト4", publishedDateString: "2022/4/11"),
        TipDetail(category: "機材", accountName: "kamimi0101010", imageURL: URL(string: "2")!, detail: "テストテストテストテストテストテスト3テスト4", publishedDateString: "2022/4/11"),
        TipDetail(category: "機材", accountName: "kamimi0101010", imageURL: URL(string: "2")!, detail: "テストテストテストテストテストテスト3テスト4", publishedDateString: "2022/4/11")
    ]
    
    var body: some View {
        List {
            ForEach(Array(list.enumerated()), id: \.element) { index, data in
                tipCell(tip: data)
                    .padding(.vertical, 5)
                    .padding(.bottom, isLastCell(index: index) ? 60 : 0)
            }
        }
        .listStyle(.plain)
    }
}

private extension TipsListView {
    func tipCell(tip: TipDetail) -> some View {
        Button(action: {
            
        }) {
            VStack {
                HStack(alignment: .top) {
                    Text(tip.category)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.green)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("@ " + tip.accountName)
                        Text(tip.publishedDateString)
                    }
                }
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(tip.title)
                            .lineLimit(1)
                        Text(tip.detail)
                            .padding(.top, 5)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "house")
                        .frame(width: 100, height: 100)
                        .border(Color.black)
                }
            }
        }
    }
    
    func isLastCell(index: Int) -> Bool {
        if index == (list.count - 1) {
            return true
        }
        return false
    }
}

struct TipsListView_Previews: PreviewProvider {
    static var previews: some View {
        TipsListView()
            .previewLayout(.fixed(width: 450, height: 600))
    }
}
