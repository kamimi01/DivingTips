//
//  SwiftUIView.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/18.
//

import SwiftUI

struct TipsDetailView: View {
    @State private var isShownTipsPostView = false
    private let detail = "テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4vテストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4vテストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4vテストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4テストテストテストテストテストテスト3テスト4テストテスト3テスト4vテストテストテストテストテストテスト3テスト4テストテスト3テスト4"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("@ kamimi01010")
                .padding(.vertical, 5)
            Text("2020/4/11")
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text(detail)
                        .lineLimit(nil)
                    Image(systemName: "house")
                        .frame(width: 200, height: 200)
                        .border(Color.black)
                        .padding(.vertical, 20)
                }
            }
            .padding(.top, 20)
        }
        .padding(.horizontal, 16)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                editButton
            }
        }
    }
}

private extension TipsDetailView {
    var editButton: some View {
        Button(action: {
            isShownTipsPostView = true
        }) {
            Text("編集")
                .foregroundColor(.black)
        }
        .fullScreenCover(isPresented: $isShownTipsPostView) {
            TipsPostView()
        }
    }
}

struct TipsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TipsDetailView()
    }
}
