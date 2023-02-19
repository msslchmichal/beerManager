//
//  IBUViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 17/10/2021.
//
// TODO: result

import UIKit
import CoreData

class IBUViewController: UITableViewController, NewHopViewControllerDelegate {

    func add(_ controller: NewHopViewController, didFinish hop: Hop) {
        hopArray.append(hop)
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    var hopArray = [Hop]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCells()
        loadItems()
        resultLabel.text = ""
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hopArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "IBUTableViewCell") as? IBUTableViewCell {
            cell.hopNameCustomCell?.text = hopArray[indexPath.row].name
            cell.hopResultCustomCell?.text = hopArray[indexPath.row].result
            //updateResult(resultValue:Double(hopArray[indexPath.row].result.reduce(0, +)))
            return cell
        }
        return UITableViewCell()
    }
    
    private func registerTableViewCells() {
        let ibucustomcell = UINib(nibName: "IBUTableViewCell", bundle: nil)
        self.tableView.register(ibucustomcell, forCellReuseIdentifier: "IBUTableViewCell")
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        context.delete(hopArray[indexPath.row])
        hopArray.remove(at: indexPath.row)
        saveItems()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "fromTableToDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("in prepare")
        if segue.identifier == "addItem" {
            let controller = segue.destination as! NewHopViewController
            controller.delegate = self
        }
        else {
        guard let detailViewController = segue.destination as? HopDetailViewController,
                  let index = tableView.indexPathForSelectedRow?.row
                else {
                    return
            }
        detailViewController.hop = hopArray[index]
        }
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    func updateResult(resultValue: Double) {
        resultLabel.text = "RESULT: \(resultValue)" 
    }
    
    func saveItems(){
        do {
            try context.save()
        } catch {
            print(error)
        }
        self.tableView.reloadData()
    }
    func loadItems(with request: NSFetchRequest<Hop> = Hop.fetchRequest()) {
        do {
            hopArray = try context.fetch(request)
        } catch {
            print(error)
        }
        tableView.reloadData()
    }
}
