//
//  YAHeaderLable.swift
//  Yummie
//
//  Created by MacOS on 07/08/2022.
//

import UIKit

class YAHeaderLable: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(size : CGFloat){
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 25, weight: .bold)
        textColor = .systemGray
        numberOfLines = 0
        textAlignment = .left
        
    }

}
