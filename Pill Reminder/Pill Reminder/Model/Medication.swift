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
    let schedule: MedicationSchedule
}

enum MedicationUnit: String, Codable {
    case mg = "miligrams"
    case U = "units"
}

enum MedicationSchedule: Int, Codable {
    case onceADay = 1
    case twiceADay
    case threeTimesADay
    case fourTimesADay
    case asNeeded
}
