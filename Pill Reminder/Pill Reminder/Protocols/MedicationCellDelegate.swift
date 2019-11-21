//
//  MedicationCellDelegate.swift
//  Daily Dose
//
//  Created by Chad Rutherford on 11/19/19.
//  Copyright © 2019 Chad & Tyler. All rights reserved.
//

import Foundation

protocol MedicationCellDelegate: class {
    func didUpdateMedicationCount(for cell: PillsTableViewCell)
}
