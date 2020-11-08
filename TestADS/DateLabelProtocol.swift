//
//  DateLabelProtocol.swift
//  TestADS
//
//  Created by Sarah Hebert on 2020-11-07.
//

import UIKit

protocol DateLabelProtocol {
    
    var stackView: UIStackView? { get }
    
    func addDateLabel(notification: NSNotification)
    func getDateAndTime() -> String
}

extension DateLabelProtocol {
    
    func addDateLabel(notification: NSNotification) {
        
        let dateLabel = UILabel()
        dateLabel.text = self.getDateAndTime()
        dateLabel.textAlignment = .center
        dateLabel.textColor = .white
        dateLabel.adjustsFontSizeToFitWidth = true
        
        guard let safeStackView = self.stackView else { return }
        
        safeStackView.addArrangedSubview(dateLabel)
    }
    
    func getDateAndTime() -> String {
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return format.string(from: date)
    }
}
