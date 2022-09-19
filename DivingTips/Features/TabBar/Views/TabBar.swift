//
//  TabBarView.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/15.
//

import SwiftUI

enum TabBarType: String, CaseIterable {
    case home
    case account
    
    var tabBarView: some View {
        switch self {
        case .home:
            return AnyView(HomeScreen()
                .tabItem {
                    TabBarItem(imageName: "house", text: "ホーム")
                }).tag(TabBarType.home)
        case .account:
            return AnyView(AccountScreen()
                .tabItem {
                    TabBarItem(imageName: "person.crop.circle", text: "アカウント")
                }).tag(TabBarType.account)
        }
    }
}

struct TabBar: View {
    var body: some View {
        TabView {
            ForEach(TabBarType.allCases, id: \.self) { type in
                type.tabBarView
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
