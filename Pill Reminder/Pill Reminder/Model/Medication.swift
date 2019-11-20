//
//  Medication.swift
//  Pill Reminder
//
//  Created by Chad Rutherford on 11/18/19.
//  Copyright © 2019 Chad & Tyler. All rights reserved.
//

import Foundation

struct Medication: Equatable, Codable {
    let name: String
    let dosage: Int
    let units: MedicationUnit
    var quantity: UInt32
    let times: [Date]
    var lowDoseId: String {
        return "\(name)\(dosage)\(quantity)"
    }
    
    var timesId: String {
        let components = DateComponents()
        let hour = components.hour ?? 0
        return "\(name)\(dosage)\(hour)"
    }
}

/// Enumeration describing the units for the medicaiton
enum MedicationUnit: String, Codable {
    case mg = "miligrams"
    case U = "units"
}
