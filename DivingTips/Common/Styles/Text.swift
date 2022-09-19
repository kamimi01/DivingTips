//
//  TextStyles.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/09/19.
//

import SwiftUI

// MARK: - Text Styles
extension View {
    func mainTextStyle() -> some View {
        self
            .foregroundColor(Color.extendedColorGray)
            .font(.title2)
    }
}
