// Created by Vlad Lysenka 19.03.2024 

import SwiftUI

struct Responses: View {
    @State private var isProfile: Bool = false
    var body: some View {
        VStack(spacing: 30) {
            Text("Отклики")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(.regularMaterial, in: .rect(cornerRadius: 20))
            
            Button("Войти в личный кабинет") {
                isProfile.toggle()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.regularMaterial, in: .capsule)
        }
        .padding()
        .sheet(isPresented: $isProfile) {
            SignIn()
                .padding(.top, 20)
        }
    }
}

#Preview {
    Responses()
}
