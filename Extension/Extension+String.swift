// Created by Vlad Lysenka 22.03.2024 

import SwiftUI

extension String {
    func formatDate() -> String? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatterGet.date(from: self) else { return nil }
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.locale = Locale(identifier: "ru_RU")
        dateFormatterPrint.dateFormat = "d MMMM"
        
        return "Опубликована \(dateFormatterPrint.string(from: date))"
    }
}
