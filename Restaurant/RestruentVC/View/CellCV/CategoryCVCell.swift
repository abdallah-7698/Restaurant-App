//
//  CategoryCVCell.swift
//  FlatMapProject2
//
//  Created by Abdallah on 25/01/2023.
//

import UIKit
import Kingfisher

class CategoryCVCell: UICollectionViewCell {
    
    //MARK: - IBOutlet
    let view            = UIView()
    let imageView       = UIImageView()
    let categoryName    = YAHeaderLable(size: 20)
    //MARK: - Variables
    var categoryID : String = ""
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    //MARK: - configure func
    private func configure(){
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .blue.withAlphaComponent(0.1)
        view.layer.cornerRadius = contentView.bounds.height / 2
        contentView.addSubview(view)
        view.setToEdges(containerView: contentView)
        view.addSubview(imageView)
        view.addSubview(categoryName)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemGreen
        
        categoryName.textColor = .label
        categoryName.textAlignment = .center
        categoryName.numberOfLines = 1
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 10),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor , multiplier: 0.7),
            imageView.widthAnchor.constraint(equalTo: view.heightAnchor , multiplier: 0.7),
            
            categoryName.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            categoryName.leadingAnchor.constraint(equalTo: imageView.trailingAnchor , constant: 10),
            categoryName.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -20)
        ])
    }
    
    func isSelected(_ isSeleced: Bool) {
        // Set is Selected and not selected
        categoryName.textColor = isSeleced ? .systemBackground:.label
        view.backgroundColor   = isSeleced ? .systemRed:.blue.withAlphaComponent(0.1)
    }
    
    //MARK: - HelperFunctions
    func set(category : CategoryModel){
        if let url = URL(string: category.image ?? ""){
            imageView.kf.setImage(with: url, placeholder: UIImage(named: "blank-avatar"))
        }
        categoryID = category.id!
        categoryName.text = category.title
    }
}
