//
//  GroupTableViewCell.swift
//  UI_app
//
//  Created by Вячеслав on 18.08.2021.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet var circleView: CircleView!
    static let identifier = "GroupTableViewCell"

    @IBOutlet private var labelCell: UILabel!
    
    
    func configure(group: GroupModel) {
        circleView.setImage (UIImage(named: group.imageG))
        labelCell.text = group.nameG
    }
    
}
