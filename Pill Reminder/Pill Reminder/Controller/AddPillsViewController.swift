//
//  AddPillsViewController.swift
//  Pill Reminder
//
//  Created by Lambda_School_Loaner_218 on 11/18/19.
//  Copyright © 2019 Chad & Tyler. All rights reserved.

import UIKit

class AddPillsViewController: UIViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dosageTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var unitSegmentedControl: UISegmentedControl!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    var medicationController: MedicationController?
    var medication: Medication?
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        if let medication = medication {
            titleLabel.text = "Edit Medication"
            nameTextField.text = medication.name
            dosageTextField.text = "\(medication.dosage)"
            quantityTextField.text = "\(medication.quantity)"
            datePicker.setDate(medication.time, animated: false)
            
            switch medication.units {
            case .mg:
                unitSegmentedControl.selectedSegmentIndex = 0
            case .U:
                unitSegmentedControl.selectedSegmentIndex = 1
            }
        } else {
            titleLabel.text = "Add Medication"
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let medicationController = medicationController else { return }
        guard let name = nameTextField.text, let dosageString = dosageTextField.text, let quantityString = quantityTextField.text,
            !name.isEmpty, !dosageString.isEmpty, !quantityString.isEmpty, let dosage = Int(dosageString), let quantity = Int(quantityString) else { return }
        var units: MedicationUnit = .mg
        
        switch unitSegmentedControl.selectedSegmentIndex {
        case 0:
            units = .mg
        case 1:
            units = .U
        default:
            break
        }
        
        if let medication = medication {
            medicationController.updateMedicationCount(with: medication, count: quantity)
        } else {
            medicationController.createMedication(with: name, dosage: dosage, units: units, time: datePicker.date)
        }
    }
}
