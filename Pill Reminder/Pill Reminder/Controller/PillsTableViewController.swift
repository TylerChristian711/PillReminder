//
//  PillsTableViewController.swift
//  Pill Reminder
//
//  Created by Lambda_School_Loaner_218 on 11/18/19.
//  Copyright © 2019 Chad & Tyler. All rights reserved.
// comment for commit 

import UIKit

class PillsTableViewController: UITableViewController,MedicationCellDelegate {
    
    
    func didUpdateMedicationCount(for cell: PillsTableViewCell) {

        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let medication = medicationController.medications[indexPath.row]
        medicationController.updateMedicationCount(with: medication, count: Int(medication.quantity - 1))
    }
    

    let medicationController = MedicationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return medicationController.medications.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationInfoCell", for: indexPath) as? PillsTableViewCell else { return UITableViewCell() }

        let medication = medicationController.medications[indexPath.row]
        
        cell.medication = medication

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddMeds" {
            if let addMedsVc = segue.destination as? AddPillsViewController {
                guard let indexPath = tableView.indexPathForSelectedRow else { return }
                addMedsVc.medication = medicationController.medications[indexPath.row]
                addMedsVc.medicationController = medicationController
               
            }
        }
    }
}
