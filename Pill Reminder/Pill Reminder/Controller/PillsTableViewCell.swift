//
//  PillsTableViewCell.swift
//  Pill Reminder
//
//  Created by Lambda_School_Loaner_218 on 11/18/19.
//  Copyright © 2019 Chad & Tyler. All rights reserved.

import UIKit

class PillsTableViewCell: UITableViewCell {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dosageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    weak var delegate: MedicationCellDelegate?
    
    var medication: Medication? {
        didSet {
            updateViews()
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Cell Configuration
    private func updateViews() {
        guard let medication = medication else { return }
        nameLabel.text = medication.name
        dosageLabel.text = "\(medication.dosage)\(medication.units)"
        timeLabel.text = "\(medication.time)"
        quantityLabel.text = "Qty: \(medication.quantity)"
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Actions
    @IBAction func takenButtonTapped(_ sender: UIButton) {
        delegate?.didUpdateMedicationCount(for: self)
    }
}
