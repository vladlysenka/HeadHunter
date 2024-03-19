// Created by Vlad Lysenka 19.03.2024 

import SwiftUI

struct Messages: View {
    var body: some View {
        Text("Сообщения")
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(.regularMaterial, in: .rect(cornerRadius: 20))
            .padding()
    }
}

#Preview {
    Messages()
}
