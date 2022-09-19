//
//  SignOutButtonView.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/09/18.
//

import SwiftUI

struct SignOutButton: View {
    var body: some View {
        Button(action: {
            // do something  userAuth.signOut()
        }) {
            Text("サインアウト")
        }
    }
}

struct SignOutButton_Previews: PreviewProvider {
    static var previews: some View {
        SignOutButton()
    }
}
