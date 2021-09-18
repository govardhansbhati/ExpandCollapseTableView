//
//  BodyCell.swift
//  ExpandCollapseTableView
//
//  Created by govardhan singh on 18/09/21.
//

import UIKit

class BodyCell: UITableViewCell {
    @IBOutlet private weak var neumorphicView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var bindData: String?{
        didSet{
            titleLabel.text = bindData ?? ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.backgroundColor = .offWhite
        DispatchQueue.main.async {
            self.neumorphicView.applyNeumorphicEffect(shadowRadiusValue: -2.0, backgroundColorValue: .offWhite)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
