//
//  DishCVCell.swift
//  FlatMapProject2
//
//  Created by Abdallah on 25/01/2023.
//

import UIKit
import Kingfisher

class DishCVCell: UICollectionViewCell {
    
    //MARK: - IBOutlet
    let view = UIView()
    let imageView = UIImageView()
    let title = YATitleLable(size: 25)
    let price = YATitleLable(size: 20)
    
    //MARK: - Constant
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        contentView.addSubview(view)
        view.backgroundColor = YAColors.gray
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setToEdges(containerView: contentView)
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemBackground
        view.addSubviews(imageView , title , price)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.tintColor = .systemRed
        
        let padding : CGFloat = 10
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 15),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor , multiplier: 0.8),
            imageView.widthAnchor.constraint(equalTo: view.heightAnchor , multiplier: 0.8),
            
            title.topAnchor.constraint(equalTo: view.topAnchor , constant: padding),
            title.leadingAnchor.constraint(equalTo: imageView.trailingAnchor , constant: padding),
            
            price.topAnchor.constraint(equalTo: title.bottomAnchor , constant: padding),
            price.leadingAnchor.constraint(equalTo: imageView.trailingAnchor , constant: padding),
        ])
    }
    
    func set(dish : DishModel){
        if let url = URL(string: dish.image ?? ""){
            imageView.kf.setImage(with: url, placeholder: UIImage(named: "blank-avatar"))
        }
        title.text = dish.name ?? "NO Name"
        price.text = "$\(Int.random(in: 5...99))"
    }
    
}
