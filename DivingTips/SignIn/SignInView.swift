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
        NavigationView {
            VStack {
                userInfo
                profilePicture
                if userAuth.isLoggedIn {
                    signOutButton
                } else {
                    signInButton
                }
                errorMessage
            }
        }
    }
}

private extension SignInView {
    var signInButton: some View {
        Button(action: {
            userAuth.signIn()
        }) {
            Text("サインイン")
        }
    }

    var signOutButton: some View {
        Button(action: {
            userAuth.signOut()
        }) {
            Text("サインアウト")
        }
    }

    var profilePicture: some View {
        AsyncImage(url: URL(string: userAuth.profilePictureURL))
            .frame(width: 100, height: 100)
    }

    var userInfo: some View {
        Text(userAuth.givenName)
    }

    var errorMessage: some View {
        Text(userAuth.errorMessage)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
