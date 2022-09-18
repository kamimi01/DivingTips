//
//  UIApplication+Extension.swift
//  DivingTips
//
//  Created by mikaurakawa on 2022/08/16.
//

import Foundation
import SwiftUI

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
