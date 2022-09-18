//
//  ProfileImageView.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/09/18.
//

import SwiftUI

struct ProfileImageView: View {
    var URLString = ""

    var body: some View {
        AsyncImage(url: URL(string: URLString))
            .frame(width: 100, height: 100)
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView()
    }
}
