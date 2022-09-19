//
//  SignInWithAppleButtonView.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/09/18.
//

import SwiftUI

struct SignInWithAppleButton: View {
    var body: some View {
        Button(action: {
            // userAuth.signIn()
        }) {
            HStack {
                Image(appleLogo)
                    .smallStyle()
                Text("Apple でサインイン")
                    .mainTextStyle(textColor: Color.white)
            }
        }
        .roundedButtonStyle(backgroundColor: Color.black)
    }
}

struct SignInWithAppleButton_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithAppleButton()
    }
}
