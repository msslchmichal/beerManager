//
//  IBUViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 17/10/2021.
//
// TODO: tableview to extension

import UIKit
import CoreData

class IBUViewController: UITableViewController {
    
    var hopArray = [Hop]()
    let coreDataManager = CoreDataManager()
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCells()
        loadItems()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hopArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "IBUTableViewCell") as? IBUTableViewCell {
            cell.hopNameCustomCell?.text = hopArray[indexPath.row].name
            cell.hopResultCustomCell?.text = hopArray[indexPath.row].result
            return cell
        }
        return UITableViewCell()
    }
    
    private func registerTableViewCells() {
        let ibucustomcell = UINib(nibName: "IBUTableViewCell", bundle: nil)
        self.tableView.register(ibucustomcell, forCellReuseIdentifier: "IBUTableViewCell")
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        coreDataManager.delete(hopArray[indexPath.row])
        hopArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        updateResult()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "fromTableToDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let segueIdentifier = segue.identifier
        else { return }
        if segueIdentifier == "addItem" {
            guard let newHopViewController = segue.destination as? NewHopViewController
            else { return }
            newHopViewController.delegate = self
            newHopViewController.coreDataManager = coreDataManager
        }
        else if segueIdentifier == "fromTableToDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow
            else { return }
            let hop = hopArray[indexPath.row]
            if let detailViewController = segue.destination as? HopDetailViewController {
                detailViewController.hop = hop
            }
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    func updateResult() {
        let totalResult = hopArray.reduce(0) { (partialResult, hop) in
            guard let result = hop.result,
                  let sumOfResults = Double(result)
            else { return partialResult }
            return partialResult + sumOfResults
        }
        resultLabel.text = "RESULT: \(totalResult)"
    }
    
    func loadItems() {
        hopArray = coreDataManager.fetchHops()
        updateResult()
        tableView.reloadData()
    }
}

extension IBUViewController: NewHopViewControllerDelegate {
    func add(_ controller: NewHopViewController, didFinish hop: Hop) {
        coreDataManager.save(hop)
        hopArray.append(hop)
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
        updateResult()
    }
}
