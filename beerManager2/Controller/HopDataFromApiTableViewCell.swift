//
//  HopDataFromApiTableViewCell.swift
//  beerManager2
//
//  Created by Michał Massloch on 09/03/2023.
//

import UIKit
import SkeletonView


class HopDataFromApiTableViewCell: UITableViewCell {
    
    @IBOutlet weak var styles: UILabel!
    @IBOutlet weak var alphaAcid: UILabel!
    @IBOutlet weak var betaAcid: UILabel!
    @IBOutlet weak var brewingUsage: UILabel!
    @IBOutlet weak var aroma: UILabel!
    @IBOutlet weak var cohumulone: UILabel!
    @IBOutlet weak var country: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        [styles, alphaAcid, betaAcid, brewingUsage, aroma, cohumulone, country].forEach {
            $0?.isSkeletonable = true
            $0?.linesCornerRadius = 8
            $0?.showAnimatedGradientSkeleton()
        }
    }
    
    func hideAnimation() {
        [styles, alphaAcid, betaAcid, brewingUsage, aroma, cohumulone, country].forEach {
            $0?.hideSkeleton()
        }
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
