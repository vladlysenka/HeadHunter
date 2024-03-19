// Created by Vlad Lysenka 19.03.2024 

import SwiftUI

extension View {
    
    // MARK: Tab Bar
    @ViewBuilder func tabLabel(_ tab: Tab) -> some View {
        self
            .tabItem { 
                Label(tab.title, systemImage: tab.rawValue)
                    .environment(\.symbolVariants, .none)
            }
            .tag(tab)
//            .toolbar(.hidden, for: .tabBar)
    }
    
}


let size14px: CGFloat = 14
let size16px: CGFloat = 16
