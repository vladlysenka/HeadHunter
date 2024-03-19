// Created by Vlad Lysenka 19.03.2024 

import SwiftUI

struct OTPView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var emailOrPhone: String
    @State private var otpText: String = ""
    @State private var isCodeValid = false
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Отправили код на \(emailOrPhone)")
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                .font(.system(size: size16px))
            
            HStack {
                ForEach(0..<4, id: \.self) { index in
                    OTPBox(index)
                }
            }
            
            Button("Подтвердить") {
                
            }
            .font(.system(size: size16px, weight: .semibold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, minHeight: 48)
            .background(.blue, in: .rect(cornerRadius: 8))
        }
        .padding(.horizontal, 14)
        
    }
    
    @ViewBuilder func OTPBox(_ index: Int) -> some View {
        ZStack{
            if otpText.count > index {
                
            } else {
                Text ("")
            }
        }
        .frame (width: 48, height: 48)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 12))
        .frame (maxWidth: .infinity)
    }
}

#Preview {
    OTPView(emailOrPhone: .constant("123.com"))
}
