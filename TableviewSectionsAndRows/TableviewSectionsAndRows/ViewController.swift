//
//  ViewController.swift
//  TableviewSectionsAndRows
//
//  Created by chaitanya on 1/9/23.
//

import UIKit


// MARK: - Create Struct Model

struct Model {
    var tableviewSections:String
    var tableViewRows:[String]
}

class ViewController: UIViewController {
    
    var tableViewData = [Model]()

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.sectionHeaderTopPadding = 0
        
        // Data Assigning
        self.tableViewData.append(Model(tableviewSections: "Vegetables", tableViewRows: ["Tomato","Potato","Mirchi"]))
        self.tableViewData.append(Model(tableviewSections: "Furniture", tableViewRows: ["row1","row2","row3"]))
        self.tableViewData.append(Model(tableviewSections: "Electronics", tableViewRows: ["row1","row2","row3"]))
        self.tableViewData.append(Model(tableviewSections: "Fruits", tableViewRows: ["row1","row2","row3"]))
    }


}



extension ViewController: UITableViewDelegate,UITableViewDataSource {
    // MARK: - Tableview Delegate Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData[section].tableViewRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = tableViewData[indexPath.section].tableViewRows[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = tableViewData[section].tableviewSections
        cell?.backgroundColor = .lightGray
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tableViewData[indexPath.section].tableViewRows[indexPath.row])
    }
}
