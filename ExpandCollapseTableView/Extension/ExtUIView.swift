//
//  ExtUIView.swift
//  ExpandCollapseTableView
//
//  Created by govardhan singh on 18/09/21.
//

import UIKit
extension UIView {
    
    /*
     * Method name: applyNeumorphicEffect
     * Description: Use for neumorpic UI effect on UIView
     * Parameters: shadowRadius and backgroundColor
     * Return:  nil
     */
    func applyNeumorphicEffect(shadowRadiusValue: CGFloat = 2, backgroundColorValue: UIColor){
        let layersArrayForUIView: [CAShapeLayer] = [CAShapeLayer(), CAShapeLayer()]
        let sizeArray: [CGSize] = [.init(width: shadowRadiusValue, height: shadowRadiusValue), .init(width: -shadowRadiusValue, height: -shadowRadiusValue)]
        let colorArray: [UIColor] = [.lightGray, .white]
        self.layer.cornerRadius = 8
        
        // removing all sublayers that are already created
        if self.layer.sublayers?.count != 0 {
            self.layer.sublayers = self.layer.sublayers?.filter({
                return ($0.name != "0" && $0.name != "1")
            })
        }
        
        // applying shadow on view
        for (index, item) in layersArrayForUIView.enumerated() {
            item.name = "\(index)"
            item.frame = self.layer.bounds
            item.cornerRadius = 8
            item.backgroundColor = backgroundColorValue.cgColor
            item.shadowRadius = abs(shadowRadiusValue)
            item.shadowOpacity = abs(0.8)
            item.shadowColor = colorArray[index].cgColor
            item.shadowOffset = sizeArray[index]

            self.layer.insertSublayer(item, at: 0)

        }
    }
}
