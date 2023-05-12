//
//  CollectionViewCell.swift
//  Demo
//
//  Created by Yogesh Tanwar on 12/05/23.
//

import UIKit
import UIView_Shimmer

class CollectionViewCell: UICollectionViewCell, ShimmeringViewProtocol {

    @IBOutlet weak var backVu: UIView!
    
    @IBOutlet weak var imgVu: UIImageView!
    
    @IBOutlet weak var lbl: UILabel!
    
    var shimmeringAnimatedItems: [UIView] {
           [
            imgVu,
            lbl
           ]
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension UILabel: ShimmeringViewProtocol { }
extension UIImageView: ShimmeringViewProtocol { }
