//
//  TipsListView.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/15.
//

import SwiftUI

struct TipsListView: View {
    private let list = [
        TipDetail(category: "機材", accountName: "kamimi0101010", imageURL: URL(string: "2")!, detail: "テストテストテストテストテストテスト3テスト4テストテスト3テスト4", publishedDateString: "2022/4/11"),
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
                    .padding(.vertical, 10)
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
                    Text("@ " + tip.accountName)
                    Spacer()
                }
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(tip.title)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .lineLimit(1)
                        Text(tip.detail)
                            .lineLimit(3)
                            .padding(.top, 5)
                        Spacer()
//                        Text(tip.category)
//                            .foregroundColor(.white)
//                            .padding(13)
//                            .background(Color.blue)
//                            .cornerRadius(24)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 24)
//                                    .stroke(Color.blue, lineWidth: 1.0)
//                            )
                        Text(tip.publishedDateString)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "house")
                        .frame(width: 100, height: 100)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 1.0)
                        )
                        .padding(.leading, 10)
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
