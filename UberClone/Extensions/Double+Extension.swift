//
//  Double+Extension.swift
//  UberClone
//
//  Created by Marco Alonso on 07/03/24.
//

import Foundation

extension Double {
    func formatTwoDecimals() -> String {
        return String(format: "%.2f", self)
    }
}

extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? ""
    }
}
