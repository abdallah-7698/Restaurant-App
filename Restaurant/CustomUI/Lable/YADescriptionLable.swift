//
//  YADescriptionLable.swift
//  Yummie
//
//  Created by MacOS on 06/08/2022.
//

import UIKit

class YADescriptionLable: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 15, weight: .bold)
        textColor = .secondaryLabel
        numberOfLines = 0
        textAlignment = .center
        
    }

}
