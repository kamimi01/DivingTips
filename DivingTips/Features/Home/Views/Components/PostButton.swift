//
//  PostButton.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/15.
//

import SwiftUI

struct PostButton: View {
    @State private var isShownTipPost = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    isShownTipPost = true
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                }
                .frame(width: 60, height: 60)
                .background(Color.orange)
                .cornerRadius(30.0)
                .shadow(color: .gray, radius: 3, x: 3, y: 3)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 16.0, trailing: 16.0))
            }
        }
        .fullScreenCover(isPresented: $isShownTipPost) {
            TipsPostScreen()
        }
    }
}

struct PostButton_Previews: PreviewProvider {
    static var previews: some View {
        PostButton()
    }
}
