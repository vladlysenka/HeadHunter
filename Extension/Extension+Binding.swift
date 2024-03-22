// Created by Vlad Lysenka 22.03.2024 

import SwiftUI

// MARK: Binding <String> Extension
extension Binding where Value == String {
    func limit(_ lenght: Int) -> Self {
        if self.wrappedValue.count > lenght {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(lenght))
            }
        }
        return self
    }
}
