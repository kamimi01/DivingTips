//
//  SignInButtonView.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/09/18.
//

import SwiftUI

struct SignInWithGoogleButtonView: View {
    var body: some View {
        Button(action: {
            // userAuth.signIn()
        }) {
            HStack {
                Text("Google でサインイン")
            }
        }
    }
}

struct SignInButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithGoogleButtonView()
    }
}
