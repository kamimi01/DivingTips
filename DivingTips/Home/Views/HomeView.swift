//
//  HomeView.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/15.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    CategoryListView()
                        .padding(.leading, 16)
                    Divider()
                        .background(Color.gray)
                    TipsListView()
                    Spacer()
                }
                PostButton()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
