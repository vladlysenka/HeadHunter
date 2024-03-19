// Created by Vlad Lysenka 19.03.2024

import SwiftUI

struct SignIn: View {
    @State private var emailOrPhone: String = ""
    @State private var isEmailValid: Bool = true
    @State private var showError: Bool = false
    @State private var isShowOTP: Bool = false

    func validateEmail() {
        // Паттерн для проверки email
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        // Создание объекта NSPredicate с использованием emailRegex
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)

        // Применение NSPredicate к переданному email и возврат результата
        isEmailValid = emailPredicate.evaluate(with: emailOrPhone)
    }

    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Поиск работы")
                    .font(.system(size: size16px))

                VStack(spacing: 10) {
                    HStack {
                        if emailOrPhone.isEmpty {
                            Image(systemName: "envelope")
                                .font(.system(size: size16px, weight: .light))
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.gray)
                        }
                        TextField("Электронная почта или телефон", text: $emailOrPhone)
                            .font(.system(size: size14px))
                            .keyboardType(.emailAddress)
                            .onChange(of: emailOrPhone) { _, _ in
                                showError = false // Обнуляем флаг при изменении текста в поле ввода
                            }
                        if !emailOrPhone.isEmpty {
                            Image(systemName: "xmark")
                                .font(.system(size: size16px, weight: .light))
                                .frame(width: 28, height: 28)
                                .padding(.trailing, 6)
                                .onTapGesture { emailOrPhone = "" }
                        }
                    }
                    .frame(height: 40)
                    .padding(.leading, 8)
                    .background(.ultraThinMaterial, in: .rect(cornerRadius: 8))
                    .background(.red, in: .rect(cornerRadius: 8).stroke(lineWidth: isEmailValid || !showError ? 0 : 1))

                    if showError && !isEmailValid {
                        Text("Вы ввели неверный e-mail")
                            .font(.footnote)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                HStack(spacing: 24) {
                    Button {
                        withAnimation {
                            validateEmail()
                            if isEmailValid {
                                isShowOTP.toggle()
                            } else {
                                showError = true
                            }
                        }
                    } label: {
                        Text("Продолжить")
                            .font(.system(size: size14px))
                            .foregroundStyle(emailOrPhone.isEmpty ? .white.opacity(0.5) : .white)
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(emailOrPhone.isEmpty ? .blue.opacity(0.5) : .blue, in: .rect(cornerRadius: 8))
                    }
                    .disabled(emailOrPhone.isEmpty)

                    Button("Войти с паролем") {

                    }
                    .font(.system(size: size14px))
                }
            }
            .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
            .background(.ultraThinMaterial, in: .rect(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Поиск сотрудников")
                        .font(.system(size: 16))
                    Text("Размещение вакансий и доступ к базе резюме")
                        .font(.system(size: size14px))
                }

                Button {

                } label: {
                    Text("Я ищу сотрудников")
                        .font(.system(size: size14px))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, minHeight: 32)
                        .background(.green, in: .rect(cornerRadius: 50))
                }
            }
            .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
            .background(.ultraThinMaterial, in: .rect(cornerRadius: 8))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .top) {
            Text("Вход в личный кабинет")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 17)
        .fullScreenCover(isPresented: $isShowOTP) {
            OTPView(emailOrPhone: $emailOrPhone)
        }
    }
}

#Preview {
    SignIn()
}





