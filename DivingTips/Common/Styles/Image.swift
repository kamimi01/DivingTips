//
//  ImageStyles.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/09/19.
//

import SwiftUI

// MARK: - Image Styles
extension Image {
    func smallStyle() -> some View {
        self
            .resizable()
            .frame(width: 30, height: 30)
    }
}
