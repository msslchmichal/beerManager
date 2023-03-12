//
//  BeersTableViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 09/01/2022.
//

import UIKit

class BeersTableViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var beerData = [Style]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLocalData()
    }
    
    func fetchLocalData() {
        let loadFile = JSONParser<[Style]>()
        let result = loadFile.parseLocalFile(named: "beerStyles")
        switch result {
        case.success(let response):
            self.beerData = response
            self.tableView.reloadData()
        case.failure(let error):
            print("error: \(error.localizedDescription)")
        }
    }
}

extension BeersTableViewController: UITableViewDataSource {
    
    //MARK: - BeersTableViewController Table View methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = beerData[indexPath.row].name
        return cell
    }
    
    //MARK: - Data Passed to BeerDetailViewController
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
        detailVC.malt = beerData[selectedRow].perceived_malt
        detailVC.hop = beerData[selectedRow].perceived_hop
        detailVC.fermentation = beerData[selectedRow].fermentation
        detailVC.notes = beerData[selectedRow].notes
        detailVC.colorImage = beerData[selectedRow].color_image
    }
}
