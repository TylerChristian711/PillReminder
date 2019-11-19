//
//  PillsTableViewController.swift
//  Pill Reminder
//
//  Created by Lambda_School_Loaner_218 on 11/18/19.
//  Copyright © 2019 Chad & Tyler. All rights reserved.
// comment for commit 

import UIKit

class PillsTableViewController: UITableViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    let medicationController = MedicationController()
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Table View DataSource/Delegate Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicationController.medications.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationInfoCell", for: indexPath) as? PillsTableViewCell else { return UITableViewCell() }
        
        let medication = medicationController.medications[indexPath.row]
        cell.delegate = self
        cell.medication = medication

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            print("Deleting medication")
        default:
            break
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "AddMeds":
            guard let addMedsVC = segue.destination as? AddPillsViewController else { return }
            addMedsVC.medicationController = medicationController
        case "EditMeds":
            guard let addMedsVC = segue.destination as? AddPillsViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
            addMedsVC.medication = medicationController.medications[indexPath.row]
            addMedsVC.medicationController = medicationController
        default:
            break
        }
    }
}

// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
// MARK: - MedicationCellDelegate Extension
extension PillsTableViewController: MedicationCellDelegate {
    func didUpdateMedicationCount(for cell: PillsTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let medication = medicationController.medications[indexPath.row]
        medicationController.update(medication, with: medication.quantity - 1)
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
