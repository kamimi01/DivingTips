//
//  AccountView.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/15.
//

import SwiftUI

struct AccountScreen: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    profileView
                }
                Section {
                    tipsList
                }
                Section {
                    termsAndUseView
                    privacyPolicyView
                }
                Section {
                    logoutButton
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("アカウント")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private extension AccountScreen {
    var profileView: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .cornerRadius(75)
                .overlay(
                    RoundedRectangle(cornerRadius: 75).stroke(Color.black, lineWidth: 1)
                )
                .padding(.trailing, 10)
            Text("kamimi01")
        }
        .foregroundColor(.black)
        .padding(.vertical, 10)
    }
    
    var tipsList: some View {
        NavigationLink(destination: TipsList()) {
            Text("コツ一覧")
        }
    }
    
    var logoutButton: some View {
        Button(action: {}) {
            Text("ログアウト")
        }
        .foregroundColor(.black)
    }
    
    var termsAndUseView: some View {
        Button(action: {
            openURL(URL(string: "https://kamimi01.github.io/ArticleCollection/privacy_policy/ja.html")!)
        }) {
            Text("利用規約・プライバシーポリシー")
        }
        .foregroundColor(.black)
    }
    
    var privacyPolicyView: some View {
        HStack {
            Text("バージョン")
            Spacer()
            Text(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "")
        }
    }
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
