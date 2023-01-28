//
//  YAButton.swift
//  Yummie
//
//  Created by MacOS on 06/08/2022.
//

import UIKit

class YAButton: UIButton {

    override init(frame: CGRect){
        super.init(frame: frame)
        configue()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(background : UIColor){
        self.init(frame: .zero)
        self.backgroundColor = background
    }
    
    private func configue(){
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        clipsToBounds = true
        layer.cornerRadius = 10
    }
    
}
