// Created by Vlad Lysenka 19.03.2024 

import SwiftUI

enum Tab: String {
    case search    = "magnifyingglass"
    case favorites = "heart"
    case responses = "envelope"
    case messages  = "message"
    case profile   = "person"
    
    var title: String {
        switch self {
        case .search    : "Поиск"
        case .favorites : "Избранное"
        case .responses : "Отклики"
        case .messages  : "Сообщения"
        case .profile   : "Профиль"
        }
    }
}
