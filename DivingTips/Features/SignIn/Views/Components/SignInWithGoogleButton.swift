//
//  SignInButtonView.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/09/18.
//

import SwiftUI

struct SignInWithGoogleButton: View {
    var body: some View {
        Button(action: {
            // userAuth.signIn()
        }) {
            HStack {
                Image(googleLogo)
                    .smallStyle()
                Text("Google でサインイン")
                    .mainTextStyle()
            }
        }
    }
}

struct SignInWithGoogleButton_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithGoogleButton()
    }
}
