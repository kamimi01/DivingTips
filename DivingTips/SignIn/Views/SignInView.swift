//
//  ContentView.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/15.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var userAuth: UserAuthModel

    var body: some View {
        VStack {
            WelcomeImageView()
            Spacer()
//            UserNameView()
//            ProfileImageView()
//            if userAuth.isLoggedIn {
//                SignOutButtonView()
//            } else {
//                SignInButtonView()
//            }
            SignInWithGoogleButtonView()
            SignInWithAppleButtonView()
//            errorMessage
            Spacer()
        }
    }
}

private extension SignInView {
    var errorMessage: some View {
        Text(userAuth.errorMessage)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(UserAuthModel())
    }
}
