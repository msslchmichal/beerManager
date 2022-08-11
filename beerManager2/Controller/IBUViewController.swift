//
//  IBUViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 17/10/2021.
//
//TODO: rounding to 2 digits, sum of added hops, model

import UIKit

class IBUViewController: UITableViewController, NewHopViewControllerDelegate {
    func didFinishAddNewHop(_ controller: NewHopViewController, didFinish newhop: NewHop, didFinish newResult: Double) {
        let newIndex = arrayOfHops.count
        print("newIndex: \(newIndex)")
        arrayOfHops.append(newhop)
        arrayOfResults.append(newResult)
        let indexPath = IndexPath(row: newIndex, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var ibuResult: Double = 0.0
    var arrayOfHops: [NewHop] = []
    var arrayOfResults: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCells()
        resultLabel.text = ""
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfHops.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "IBUTableViewCell") as? IBUTableViewCell {
            cell.hopNameCustomCell?.text = arrayOfHops[indexPath.row].name
            cell.hopResultCustomCell?.text = String(arrayOfResults[indexPath.row])
            let sum = arrayOfResults.reduce(0, +)
            updateResult(x:Double(sum))
            return cell
        }
        return UITableViewCell()
    }
    
    private func registerTableViewCells() {
        let ibucustomcell = UINib(nibName: "IBUTableViewCell",
                                  bundle: nil)
        self.tableView.register(ibucustomcell,
                                forCellReuseIdentifier: "IBUTableViewCell")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItem" {
            let controller = segue.destination as! NewHopViewController
            controller.delegate = self
        }
    }
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    }
    func updateResult(x: Double) {
        resultLabel.text = "RESULT\(x)"
    }
}
