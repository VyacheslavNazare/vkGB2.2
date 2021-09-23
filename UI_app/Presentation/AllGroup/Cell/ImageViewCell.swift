//
//  AllGroupViewCell.swift
//  UI_app
//
//  Created by Вячеслав on 23.08.2021.
//

import UIKit

class AllGroupViewCell: UITableViewCell {

    @IBOutlet var circleView: CircleView!
    @IBOutlet var groupNameLabel: UILabel!
   
    static let identifier = "AllGroupViewCell"

    
    
    func configure(group: GroupModel) {
        circleView.setImage (UIImage(named: group.imageG))
        groupNameLabel.text = group.nameG
    }
    
}
