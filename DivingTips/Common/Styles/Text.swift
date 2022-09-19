//
//  TextStyles.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/09/19.
//

import SwiftUI

// MARK: - Text Styles
extension View {
    func mainTextStyle(textColor: Color) -> some View {
        self
            .foregroundColor(textColor)
            .font(.title3)
    }
}
