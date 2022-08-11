//
//  IBUTableViewCell.swift
//  beerManager2
//
//  Created by Michał Massloch on 08/02/2022.
//

import UIKit

class IBUTableViewCell: UITableViewCell {

    @IBOutlet weak var hopNameCustomCell: UILabel! // Hop Name
    @IBOutlet weak var hopResultCustomCell: UILabel! // IBU
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
