

import UIKit

class VervangingTableViewController: UITableViewController {
    
    var vervangingen: [Vervanging] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        
        if let savedVerv = Vervanging.loadFromFile() {
            vervangingen = savedVerv
        } else {
            vervangingen = Vervanging.loadSampleEmojis()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return vervangingen.count
        }  else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //decue cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "VervangingCell", for: indexPath) as! VervangingTableViewCell
        
        // Fetch model object tot display
        let verv = vervangingen[indexPath.row]
        
        // Configure cell
        cell.update(with: verv)
        cell.showsReorderControl = true
        
        //return cell
        return cell
    }
    
    @IBAction func editButtonTapped(_sender: UIBarButtonItem){
        let tableVieweditingMode = tableView.isEditing
        tableView.setEditing(!tableVieweditingMode, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if segue.identifier == "EditVervanging" {
            let indexPath = tableView.indexPathForSelectedRow!
            let vervanging = vervangingen[indexPath.row]
            let navController = segue.destination as! UINavigationController
            let addVervangingController = navController.topViewController as! AddVervangingController
            addVervangingController.vervanging = vervanging
        }
    }
    
    
    
    
    @IBAction func unwindToVervangingTableView(segue: UIStoryboardSegue)
    {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! AddVervangingController
        if let verv = sourceViewController.vervanging {
            if let selectedIndexPath =
                tableView.indexPathForSelectedRow {
                vervangingen[selectedIndexPath.row] = verv
                tableView.reloadRows(at: [selectedIndexPath],
                                     with: .none)
            } else {
                let newIndexPath = IndexPath(row: vervangingen.count,
                                             section: 0)
                vervangingen.append(verv)
                tableView.insertRows(at: [newIndexPath],
                                     with: .automatic)
            }
        }
        
        Vervanging.saveToFile(verv: vervangingen)
    }
    
    
    
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedVervanging = vervangingen.remove(at: fromIndexPath.row)
        vervangingen.insert(movedVervanging, at: to.row)
        tableView.reloadData()
    }
    
    // icon voor verwijderen
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle{
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            vervangingen.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: . automatic)
        }
    }
    
    
    
}
