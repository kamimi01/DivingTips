//
//  DivingTipsApp.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/15.
//

import SwiftUI
import Firebase

@main
struct DivingTipsApp: App {
//    @StateObject var userAuth = UserAuthModel()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}
