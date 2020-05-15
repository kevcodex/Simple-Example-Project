//
//  PhoneCell.swift
//  MoveMedicalTechnicalActivity
//
//  Created by Kevin Chen on 5/14/20.
//  Copyright © 2020 Kevin Chen. All rights reserved.
//

import UIKit

final class PhoneCell: UITableViewCell {
    
    let stackView = UIStackView()
    let nameLabel = UILabel()
    let phoneLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setUpStackView()
        setUpName()
        setUpPhone()
    }
    
    private func setUpStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
    
    private func setUpName() {
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(nameLabel)
    }
    
    private func setUpPhone() {
        
        phoneLabel.textColor = .systemBlue
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(phoneLabel)
    }
}
