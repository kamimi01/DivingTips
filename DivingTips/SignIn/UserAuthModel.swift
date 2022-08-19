//
//  UserAuthModel.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/20.
//

import SwiftUI
import GoogleSignIn
import Firebase

class UserAuthModel: ObservableObject {
    @Published var givenName = ""
    @Published var profilePictureURL = ""
    @Published var isLoggedIn = false
    @Published var errorMessage = ""

    init() {
        check()
    }

    /// 現在のGoogleのユーザーの状態をチェックする
    /// ユーザーがサインインしていれば、ユーザー情報を取得する
    func checkStatus() {
        // サインインしている
        if GIDSignIn.sharedInstance.currentUser != nil {
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else { return }
            isLoggedIn = true
            if let givenName = user.profile?.givenName {
                self.givenName = givenName
            }
            if let profilePictureURL = user.profile?.imageURL(withDimension: 100)?.absoluteString {
                self.profilePictureURL = profilePictureURL
            }
            return
        }
        // サインインしていない
        isLoggedIn = false
        givenName = "サインインしてない"
        profilePictureURL = ""
    }

    func check() {
        // ユーザーの前回のサインイン状態を確認し、それに応じて変数を変える
        GIDSignIn.sharedInstance.restorePreviousSignIn { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                self.errorMessage = "error: \(error.localizedDescription)"
            }
            self.checkStatus()
        }
    }

    func signIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID,
              let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController
        else { return }

        let signInConfig = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(
            with: signInConfig,
            presenting: presentingViewController,
            callback: { user, error in
                if let error = error {
                    self.errorMessage = "error: \(error.localizedDescription)"
                }
                self.checkStatus()
            }
        )
    }

    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        self.checkStatus()
    }
}
