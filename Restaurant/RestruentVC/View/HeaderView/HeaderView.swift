//
//  HeaderView.swift
//  Yummie
//
//  Created by MacOS on 07/08/2022.
//

import UIKit

class HeaderView: UICollectionReusableView {
        
    //MARK: - IBOutlet
    let title = YAHeaderLable(size: 20)
    
    //MARK: - Constant
    static let reuseID : String = "HeaderView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(){
        addSubview(title)
        backgroundColor = .clear
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}
