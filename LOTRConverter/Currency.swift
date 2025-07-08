//
//  Currency.swift
//  LOTRConverter
//
//  Created by Fernanda on 08/07/25.
//
import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    // var id: Double { rawValue }
    var id: Currency { self }
    
    var image: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
    
    func convert(_ amountString: String, to currency: Currency) -> String {
        // guard é tipo um, se não der certo, pode fazer outra coisa, que fica no else
        guard let doubleAmount = Double(amountString) else {
            return ""
        }
        
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        let convertedString = String(format: "%.2f", convertedAmount)
        
        // format string to 0.00
        return convertedString.hasSuffix(".00") ? String(format: "%.0f", convertedAmount) : convertedString
    }
}
