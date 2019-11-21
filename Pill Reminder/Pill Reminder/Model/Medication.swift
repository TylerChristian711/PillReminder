//
//  Medication.swift
//  Daily Dose
//
//  Created by Chad Rutherford on 11/18/19.
//  Copyright © 2019 Chad & Tyler. All rights reserved.
//

import Foundation

struct Medication: Equatable, Codable {
    let name: String
    var dosage: Int
    let units: MedicationUnit
    var quantity: UInt32
    var times: [Date]
    
    var lowDoseId: String {
        return "\(name)\(dosage)\(quantity)"
    }
    
    var timesId: [String] {
        var stringArray = [String]()
        for time in times {
            let components = Calendar.current.dateComponents([.hour], from: time)
            let hour = components.hour ?? 0
            stringArray.append("\(name)\(dosage)\(hour)")
        }
        return stringArray
    }
}

/// Enumeration describing the units for the medicaiton
enum MedicationUnit: String, Codable {
    case mg = "miligrams"
    case U = "units"
}
