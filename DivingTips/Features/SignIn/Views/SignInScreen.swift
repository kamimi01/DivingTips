//
//  ContentView.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/15.
//

import SwiftUI

struct SignInScreen: View {
    @EnvironmentObject var userAuth: UserAuthModel

    var body: some View {
        VStack {
            WelcomeImage()
            Spacer()
//            UserNameView()
//            ProfileImageView()
//            if userAuth.isLoggedIn {
//                SignOutButtonView()
//            } else {
//                SignInButtonView()
//            }
            SignInWithGoogleButton()
            SignInWithAppleButton()
//            errorMessage
            Spacer()
        }
    }
}

private extension SignInScreen {
    var errorMessage: some View {
        Text(userAuth.errorMessage)
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
            .environmentObject(UserAuthModel())
    }
}
