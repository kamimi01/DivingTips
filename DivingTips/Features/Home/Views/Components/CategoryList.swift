//
//  CategoryListView.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/15.
//

import SwiftUI

struct CategoryList: View {
    private let categories: [String] = ["機材", "潜航", "ナビゲーション", "上昇", "フィンワーク"]
    @State private var selectedCategory = ""
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    categoryView(name: category, selectedCategory: selectedCategory)
                        .padding(.trailing, 5)
                }
            }
        }
        .padding(.top, 10)
    }
}

private extension CategoryList {
    func categoryView(name: String, selectedCategory: String) -> some View {
        Button(action: {
            self.selectedCategory = name
        }) {
            Text(name)
                .foregroundColor(name == selectedCategory ? .white : .black)
                .padding(13)
                .background(name == selectedCategory ? Color.gray : Color.white)
                .cornerRadius(24)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.gray, lineWidth: 1.0)
                )
                .padding(5)
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
            .previewLayout(.fixed(width: 450, height: 100))
    }
}
