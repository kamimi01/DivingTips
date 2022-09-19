//
//  View+Extensions.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/09/18.
//

import SwiftUI

// MARK: - Button
extension View {
    func googleButtonStyle() -> some View {
        self.border(Color.blue)
    }

    func switchButtonStyle(isSelected: Bool) -> some View {
        self
            .foregroundColor(isSelected ? .white : .black)
            .padding(13)
            .background(isSelected ? Color.gray : Color.white)
            .cornerRadius(24)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.gray, lineWidth: 1.0)
            )
            .padding(5)
    }

    func roundedButtonStyle(backgroundColor: Color) -> some View {
        self
            .frame(maxWidth: .infinity)
            .frame(height: 25)
            .padding(13)
            .background(backgroundColor)
            .cornerRadius(50)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(backgroundColor, lineWidth: 1.0)
            )
            .padding(5)
    }

    func roundedWithBorderButtonStyle(borderColor: Color) -> some View {
        self
            .frame(maxWidth: .infinity)
            .frame(height: 25)
            .padding(13)
            .background(Color.white)
            .cornerRadius(50)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(borderColor, lineWidth: 1.0)
            )
            .padding(5)
    }
}
