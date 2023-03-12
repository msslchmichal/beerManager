//
//  HopDetailViewController.swift
//  beerManager2
//
//  Created by Michał Massloch on 18/02/2023.
//
// TODO: handle SkeletonView when there is no remote data about hop

import UIKit
import SkeletonView

class HopDetailViewController: UIViewController {
    
    var hop: Hop?
    var apiData: HopData?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = hop?.name
        
        fetchData()
        registerTableViewCells()
        tableView.rowHeight = UITableView.automaticDimension
        
        // configure SkeletonView appearance
        SkeletonAppearance.default.gradient = SkeletonGradient(baseColor: .lightGray)
        SkeletonAppearance.default.multilineCornerRadius = 5
        SkeletonAppearance.default.multilineHeight = 20
    }
    
    func registerTableViewCells() {
        let userTableViewCell = UINib(nibName: "HopDataFromUserTableViewCell", bundle: nil)
        let apiTableViewCell = UINib(nibName: "HopDataFromApiTableViewCell", bundle: nil)
        self.tableView.register(userTableViewCell, forCellReuseIdentifier: "HopDataFromUserTableViewCell")
        self.tableView.register(apiTableViewCell, forCellReuseIdentifier: "HopDataFromApiTableViewCell")
    }
    
    func fetchData() {
        
        let endpoint = "https://beermanager-c8146.firebaseio.com/hops/\((hop?.name)?.lowercased() ?? "costam").json"
        let requestForHopData = NetworkManager(endpoint: endpoint)
        requestForHopData.sendRequest { (data, response, error) in
            guard let data = data
            else {
                print("Error in guard requestForHopData: \(error?.localizedDescription ?? "Unknown error")")
                return }
            
            let jsonParser = JSONParser<HopData>()
            let result = jsonParser.parse(data: data)
            
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    print(response)
                    self.apiData = response
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Error in failure: \(error.localizedDescription)")
            }
        }
    }
}

extension HopDetailViewController: UITableViewDataSource {
    
    enum Section: Int, CaseIterable {
        case userData, apiData
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("number of sections: \(Section.allCases.count)")
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .userData:
            return 1
        case .apiData:
            return 1
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section) {
        case .userData:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HopDataFromUserTableViewCell", for: indexPath) as! HopDataFromUserTableViewCell
            
            cell.weight.text = hop?.weight
            cell.gravity.text = hop?.gravity
            cell.alphaAcid.text = hop?.alphaAcid
            cell.time.text = hop?.time
            cell.volume.text = hop?.volume
            
            cell.layoutIfNeeded()
            return cell
            
        case .apiData:
            print("in case .apiData")
            let cell = tableView.dequeueReusableCell(withIdentifier: "HopDataFromApiTableViewCell", for: indexPath) as! HopDataFromApiTableViewCell
            
            guard let apiData = apiData else {
                print("in case apiData guard let")
                cell.alphaAcid.text = "Error loading data"
                return cell
            }
            cell.hideAnimation()
            cell.aroma.text = apiData.aroma
            cell.alphaAcid.text = "\(String(apiData.alphaMin)) -  \(String(apiData.alphaMax))"
            cell.betaAcid.text = "\(String(apiData.betaMin)) - \(String(apiData.betaMax))"
            cell.brewingUsage.text = apiData.brewingUsage
            cell.cohumulone.text = "\(String(apiData.cohumuloneMin)) - \(String(apiData.cohumuloneMax))"
            cell.country.text = apiData.country
            cell.styles.text = apiData.styles
            cell.layoutIfNeeded()
            return cell
            
        case .none:
            fatalError("Invalid section")
        }
    }
        
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Section(rawValue: indexPath.section) {
        case .userData:
            return UITableView.automaticDimension
        case .apiData:
            return UITableView.automaticDimension
        case .none:
            return UITableView.automaticDimension
        }
    }
}
