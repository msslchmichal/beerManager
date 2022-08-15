//
//  BeersTableViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 09/01/2022.
//

import UIKit

class BeersTableViewController: UITableViewController {
    
    let beerData = DataLoader().beerData
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//MARK: - BeersTableVC Table View methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = beerData[indexPath.row].name
        return cell
    }
    
//MARK: - Data Passed to DetailVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! BeerDetailViewController
        let selectedRow = tableView.indexPathForSelectedRow!.row
        detailVC.name = beerData[selectedRow].name
        detailVC.og = beerData[selectedRow].og_plato
        detailVC.fg = beerData[selectedRow].fg_plato
        detailVC.ab = beerData[selectedRow].abv
        detailVC.ibu = beerData[selectedRow].ibu
        detailVC.glass = beerData[selectedRow].prefered_glass
        detailVC.colour = beerData[selectedRow].color_ebc
        detailVC.notes = beerData[selectedRow].notes
    }
}
