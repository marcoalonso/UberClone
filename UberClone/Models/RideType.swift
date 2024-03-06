//
//  RideType.swift
//  UberClone
//
//  Created by Marco Alonso on 05/03/24.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable {
    case uberX
    case black
    case uberXL
    case uberLux
    
    var id: Int {
        return rawValue
    }
    
    var description: String {
        switch self {
        case .uberX:
            return "UberX"
        case .black:
            return "UberBlack"
        case .uberXL:
            return "UberXL"
        case .uberLux:
            return "UberLux"
        }
    }
    
    var imageName: String {
        switch self {
        case .uberX:
            return "uber-x"
        case .black:
            return "uber-black"
        case .uberXL:
            return "uber-x"
        case .uberLux:
            return "uber-lux"
        }
    }
}
