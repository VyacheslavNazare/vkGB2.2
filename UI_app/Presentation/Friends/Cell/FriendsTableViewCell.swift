//
//  FriendsTableViewCell.swift
//  UI_app
//
//  Created by Вячеслав on 11.08.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    static let identifier = "FriendsTableViewCell"

    @IBOutlet weak var circleView: CircleView!
    @IBOutlet private var labelCell: UILabel!
    
    func configure(friend: FriendModel) {
        circleView.setImage(UIImage(named: friend.avatarName))
        labelCell.text = friend.name
    }
}
