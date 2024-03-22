// Created by Vlad Lysenka 19.03.2024 

import SwiftUI

struct OTPView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var emailOrPhone: String
    @State private var otpText: String = ""
    @State private var isCodeValid = false
    /// - Keyboard State
    @FocusState private var isKeyboardShowing: Bool
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
            .background {
                TextField("", text: $otpText.limit(4))
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .frame(width: 1, height: 1)
                    .opacity(0.001)
                    .blendMode(.screen)
                    .focused($isKeyboardShowing)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                isKeyboardShowing.toggle()
            }
            
            Button("Подтвердить") {
                
            }
            .font(.system(size: size16px, weight: .semibold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, minHeight: 48)
            .background(.blue, in: .rect(cornerRadius: 8))
            .disableWithOpacity(otpText.count < 4)
        }
        .padding(.horizontal, 14)
        
    }
    
    @ViewBuilder func OTPBox(_ index: Int) -> some View {
        ZStack{
            if otpText.count > index {
                /// - Finding Char At Index
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
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
    @State var emailOrPhone: String = ""
    return OTPView(emailOrPhone: $emailOrPhone)
}




