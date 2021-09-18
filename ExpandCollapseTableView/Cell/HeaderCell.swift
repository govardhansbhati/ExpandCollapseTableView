//
//  HeaderCell.swift
//  ExpandCollapseTableView
//
//  Created by govardhan singh on 18/09/21.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet private weak var neumorphicView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var bindData: DemoDataList?{
        didSet{
            titleLabel.text = bindData?.title ?? ""
        }
    }
    
 
    
    var expandCollapseCell : (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.backgroundColor = UIColor.offWhite
        DispatchQueue.main.async {
            self.neumorphicView.applyNeumorphicEffect(shadowRadiusValue: (self.bindData?.isCollapsed ?? false) ? 2.0 : -2.0,backgroundColorValue: .offWhite)
        }
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapHeader)))
    }
    
    @objc private func didTapHeader() {
        expandCollapseCell?()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

