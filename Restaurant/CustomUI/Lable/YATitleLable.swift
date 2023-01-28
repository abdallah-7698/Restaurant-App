//
//  YATitleLable.swift
//  Yummie
//
//  Created by MacOS on 06/08/2022.
//

import UIKit

class YATitleLable: UILabel {

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
        font = UIFont.systemFont(ofSize: 31, weight: .bold)
        numberOfLines = 0
        textColor = .label
        textAlignment = .center
        
    }
    
}
