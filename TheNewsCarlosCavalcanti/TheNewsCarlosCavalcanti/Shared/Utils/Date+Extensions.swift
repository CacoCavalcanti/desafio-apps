//
//  Date+Extensions.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 14/02/22.
//

import UIKit

extension Date {
    static var dateFormaterToTimestamp: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-SSS'Z"
        return formatter
    }
    
    static var dateFormaterToDefaultWithTime: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        return formatter
    }
    
    func toDefaultWithTime() -> String {
        return Date.dateFormaterToDefaultWithTime.string(from: self)
    }
    
    static func create(byTimeStamp value: String) -> String {
        let date = Date.dateFormaterToTimestamp.date(from: value)
        
        return date?.toDefaultWithTime() ?? ""
    }
}
