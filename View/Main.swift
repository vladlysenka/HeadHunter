// Created by Vlad Lysenka 22.03.2024

import SwiftUI

struct Main: View {
    @State private var searchTF: String = ""
    @State private var vacancies: [Vacancy] = []
    
    func formatLookingNumber(_ number: Int) -> String {
        switch number {
        case _ where number % 10 == 1 && number % 100 != 11:
            return "Сейчас просматривает \(number) человек"
        case _ where number % 10 >= 2 && number % 10 <= 4 && (number % 100 < 10 || number % 100 >= 20):
            return "Сейчас просматривает \(number) человека"
        default:
            return "Сейчас просматривает \(number) человек"
        }
    }
    
    var body: some View {
        ScrollView(.vertical) {
            /// Search
            HStack(spacing: 7) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: size16px))
                        .foregroundStyle(.gray)
                        .frame(width: 24, height: 24)
                        .padding(.leading, 8)
                    
                    TextField("Должность, ключевые слова", text: $searchTF)
                        .frame(height: 40)
                }
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 8))
                
                Image(systemName: "slider.horizontal.3")
                    .font(.system(size: size16px))
                    .frame(width: 40, height: 40)
                    .background(.ultraThinMaterial, in: .rect(cornerRadius: 10))
                
            }
            .padding(.horizontal, 17)
            
            /// Recommendations
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    RecommendationsView(text: "Вакансии рядом с вами", image: "mappin.and.ellipse", color: .blue)
                    RecommendationsView(text: "Поднять резюме в поиске", image: "star", color: .green, "Поднять")
                    RecommendationsView(text: "Временная работа и подработка", image: "app.badge.checkmark", color: .green)
                }
            }
            .padding(.top, 32)
            .safeAreaPadding(.horizontal, 9)
            .scrollIndicators(.hidden)
            
            VStack(spacing: 16) {
                Text("Вакансии для вас")
                    .font(.system(size: 20, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 15)
                
                ForEach(vacancies.prefix(3), id: \.id) { vacancy in
                    VStack(alignment: .leading, spacing: 21) {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                if let lookingNumber = vacancy.lookingNumber {
                                    Text(formatLookingNumber(lookingNumber))
                                        .font(.system(size: size14px))
                                        .foregroundStyle(.green)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "heart")
                                    .font(.system(size: 18))
                                    .foregroundStyle(.gray)
                                    .frame(width: 24, height: 24)
                            }
                            
                            Text(vacancy.title)
                                .font(.system(size: size14px))
                            Text(vacancy.address.town)
                                .font(.system(size: size14px))
                            HStack(spacing: 8) {
                                Text(vacancy.company)
                                    .font(.system(size: size16px))
                                Image(systemName: "checkmark.circle")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.gray)
                                    .frame(width: 16, height: 16)
                            }
                            
                            HStack {
                                Image(systemName: "latch.2.case")
                                    .font(.system(size: 12))
                                    .frame(width: 16, height: 16)
                                
                                Text(vacancy.experience.previewText)
                                    .font(.system(size: size14px))
                            }
                            
                            // Пример использования:
                            if let formattedDate = vacancy.publishedDate.formatDate() {
                                Text(formattedDate)
                                    .font(.system(size: size14px))
                            }
                        }
                                                
                    }

                    .frame(height: 233, alignment: .top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(alignment: .bottom) {
                        Button {

                        } label: {
                            Text("Откликнуться")
                                .font(.system(size: size14px))
                                .foregroundStyle(.white)
                                .frame(height: 32)
                                .frame(maxWidth: .infinity)
                                .background(.green, in: .rect(cornerRadius: 50))
                        }
                    }
                    .padding(16)
                    .background(.ultraThinMaterial, in: .rect(cornerRadius: 8))
                }
                
                Button {

                } label: {
                    Text("Еще \(vacancies.count) вакансии")
                        .font(.system(size: size16px, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                        .background(.blue, in: .rect(cornerRadius: 8))
                        .padding(.top, 42)
                }
            }
            .padding(.horizontal, 17)
        }
        .task {
            await loadData()
        }
    }
    
    @ViewBuilder func RecommendationsView(text: String, image: String, color: Color, _ button: String? = nil) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(systemName: image)
                .font(.system(size: size16px))
                .foregroundStyle(color)
                .frame(width: 32, height: 32)
                .background(color.opacity(0.3), in: .circle)
                .padding(.bottom, 16)
            
            
            Text(text)
                .font(.system(size: size14px, weight: .semibold))
            
            if let button {
                Text(button)
                    .font(.system(size: size14px))
                    .foregroundStyle(color)
            }
        }
        .padding(.vertical, 10)
        .padding(.leading, 8)
        .frame(width: 132, height: 120, alignment: .topLeading)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 8))
    }
    
    func loadData() async {
        guard let url = URL(string: "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            // more code to come
            if let decodedResponse = try? JSONDecoder().decode(Item.self, from: data) {
                vacancies = decodedResponse.vacancies
            }
        } catch {
            print("Invalid data")
        }
        

    }
}

#Preview {
    Main()
}




