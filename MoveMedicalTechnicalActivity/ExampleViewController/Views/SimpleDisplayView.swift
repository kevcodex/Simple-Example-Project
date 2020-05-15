//
//  SimpleDisplayView.swift
//  MoveMedicalTechnicalActivity
//
//  Created by Kevin Chen on 5/14/20.
//  Copyright © 2020 Kevin Chen. All rights reserved.
//

import UIKit

class SimpleDisplayView: UIView {
    
    let stackView = UIStackView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
        setUpStackView()
        setUpTitle()
        setUpSubTitle()
        setUpDescription()
    }
    
    private func setUpStackView() {
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setUpTitle() {
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 17)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.setContentCompressionResistancePriority(.init(800), for: .horizontal)
        
        stackView.addArrangedSubview(titleLabel)
    }
    
    private func setUpSubTitle() {
        subTitleLabel.textAlignment = .center
        subTitleLabel.font = .systemFont(ofSize: 14)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subTitleLabel.setContentCompressionResistancePriority(.init(800), for: .horizontal)
                
        stackView.addArrangedSubview(subTitleLabel)
    }
    
    private func setUpDescription() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 10),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10),
            descriptionLabel.leftAnchor.constraint(equalTo: stackView.rightAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
