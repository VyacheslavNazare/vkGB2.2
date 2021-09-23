//
//  AllGroupHeaderTableView.swift
//  UI_app
//
//  Created by Вячеслав on 03.09.2021.
//

import UIKit

class AllGroupHeaderTableView: UITableViewHeaderFooterView {
    static let identofier = "AllGroupHeaderTableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init has not been implemented")
    }
    
    func configure(_ text: String?) {
        label.text = text
    }
    
    private func setupViews() {
        addSubview(label)
        contentView.backgroundColor = .lightGray
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.heightAnchor.constraint(equalToConstant: 20),
            label.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}
