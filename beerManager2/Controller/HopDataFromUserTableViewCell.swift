//
//  HopDataFromUserTableViewCell.swift
//  beerManager2
//
//  Created by Michał Massloch on 09/03/2023.
//

import UIKit

class HopDataFromUserTableViewCell: UITableViewCell {

    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var gravity: UILabel!
    @IBOutlet weak var alphaAcid: UILabel!
    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
