// Created by Vlad Lysenka 19.03.2024 

import SwiftUI

struct TabBar: View {
    @State private var activeTab: Tab = .search
    var body: some View {
        TabView(selection: $activeTab) {
            Search().tabLabel(.search)
            Favorites().tabLabel(.favorites)
            Responses().tabLabel(.responses)
            Messages().tabLabel(.messages)
            Profile().tabLabel(.profile)
        }
        
    }
}

#Preview {
    TabBar()
}
