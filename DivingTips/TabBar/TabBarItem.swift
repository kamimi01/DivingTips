//
//  TabBarItem.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/15.
//

import SwiftUI

struct TabBarItem: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}

struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItem(imageName: "house", text: "ホーム")
    }
}
