//
//  MedicationController.swift
//  Pill Reminder
//
//  Created by Chad Rutherford on 11/18/19.
//  Copyright © 2019 Chad & Tyler. All rights reserved.
//

import Foundation

class MedicationController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    var medications = [Medication]()
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Initialization
    init() {
        loadFromPersistentStore()
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Persistence
    private var persistentFileURL: URL? = {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentsDirectory.appendingPathComponent("Medications.plist")
    }()
    
    private func saveToPersistentStore() {
        let encoder = PropertyListEncoder()
        guard let fileURL = persistentFileURL else { return }
        do {
            let medicationData = try encoder.encode(medications)
            try medicationData.write(to: fileURL)
        } catch let saveError {
            print("Error saving medications to file: \(saveError.localizedDescription)")
        }
    }
    
    private func loadFromPersistentStore() {
        let decoder = PropertyListDecoder()
        let fileManager = FileManager.default
        guard let fileURL = persistentFileURL, fileManager.fileExists(atPath: fileURL.path) else { return }
        do {
            let medicationData = try Data(contentsOf: fileURL)
            medications = try decoder.decode([Medication].self, from: medicationData)
        } catch let loadError {
            print("Error loading medications from file: \(loadError.localizedDescription)")
        }
    }
}
