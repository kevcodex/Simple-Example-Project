//
//  SimpleDisplayTableViewCell.swift
//  MoveMedicalTechnicalActivity
//
//  Created by Kevin Chen on 5/14/20.
//  Copyright © 2020 Kevin Chen. All rights reserved.
//

import UIKit

class SimpleDisplayTableViewCell: UITableViewCell {
    let simpleView = SimpleDisplayView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
        simpleView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(simpleView)
        
        NSLayoutConstraint.activate([
            simpleView.topAnchor.constraint(equalTo: contentView.topAnchor),
            simpleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            simpleView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            simpleView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
}
