//
//  HomeView.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/15.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    CategoryList()
                        .padding(.leading, 16)
                    Divider()
                        .background(Color.gray)
                    TipsList()
                    Spacer()
                }
                PostButton()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
