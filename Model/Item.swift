// Created by Vlad Lysenka 22.03.2024

import SwiftUI

// MARK: - Item
struct Item: Codable {
    //    let offers: [Offer]
    let vacancies: [Vacancy]
}

//// MARK: - Offer
//struct Offer: Codable, Hashable, Equatable {
//    let id: String?
//    let title: String
//    let link: String
//    let button: ButtonText?
//}
//
//// MARK: - Button
//struct ButtonText: Codable, Hashable, Equatable {
//    let text: String
//}

// MARK: - Vacancy
struct Vacancy: Codable, Hashable, Equatable {
    let id: String
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    let isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
}

// MARK: - Address
struct Address: Codable, Hashable, Equatable {
    let town: String
    let street: String
    let house: String
}

// MARK: - Experience
struct Experience: Codable, Hashable, Equatable {
    let previewText, text: String
}

// MARK: - Salary
struct Salary: Codable, Hashable, Equatable {
    let full: String
    let short: String?
}
