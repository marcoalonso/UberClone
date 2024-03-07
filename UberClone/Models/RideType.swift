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
    
    var baseFare: Double {
        switch self {
        case .uberX:
            return 5
        case .black:
            return 10
        case .uberXL:
            return 15
        case .uberLux:
            return 20
        }
    }
    
    func computePrice(for distanceInMeters: Double) -> Double {
        let distanceInMiles = distanceInMeters / 1600
        switch self {
        case .uberX:
            return distanceInMiles * 21.5 + baseFare
        case .black:
            return distanceInMiles * 40.0 + baseFare 
        case .uberXL:
            return distanceInMiles * 35 + baseFare
        case .uberLux:
            return distanceInMiles * 50 + baseFare
        }
    }
}
