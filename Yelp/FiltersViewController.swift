//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Ravi Kumar Mandala on 9/24/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var filtersTableView: UITableView!

    let CellIdentifier = "TableViewCell", HeaderViewIdentifier = "TableViewHeaderView"

    var checked: [Bool]!

    override func viewDidLoad() {
        super.viewDidLoad()

        filtersTableView.dataSource = self
        filtersTableView.delegate = self
        filtersTableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier)
        filtersTableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: HeaderViewIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSearchButton(_ sender: Any) {
    }
    
    @IBAction func onCancelButton(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.filtersTableView.deselectRow(at: indexPath, animated: true)
        checked[indexPath.row] = !checked[indexPath.row]
        self.filtersTableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = filtersTableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as UITableViewCell
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "Open Now"
        case 1:
            cell.textLabel?.text = "Offering a Deal"
        case 2:
            let priceSegControl = UISegmentedControl(items: ["$", "$$", "$$$", "$$$$"])
            cell.addSubview(priceSegControl)
        case 3:
            cell.textLabel?.text = "Distance Picker"
        case 4:
            cell.textLabel?.text = "Sort By Picker"
        case 5:
            cell.textLabel?.text = "Category"
        default:
            cell.textLabel?.text = "Default section placeholder"
        }
        
        return cell
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionLabel: UILabel = UILabel()
        
        let sectionLabels = ["Availability", "Dealability", "Price", "Distance", "Sort By", "Category"]
        sectionLabel.text = sectionLabels[section]
        
        return sectionLabel
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:  // Open Now
            return 1
        case 1:  // Offering a deal
            return 1
        case 2:  // Price seg control
            return 1
        case 3:  // Distance Picker
            return 1
        case 4:  // Sort By
            return 1
        case 5:  // Category
            return 4
        default:
            return 0
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
}
