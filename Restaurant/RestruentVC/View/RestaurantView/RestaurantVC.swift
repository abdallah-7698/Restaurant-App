//
//  RestaurantVC.swift
//  FlatMapProject2
//
//  Created by Abdallah on 25/01/2023.
//

import UIKit
import RxSwift
import RxCocoa

class RestaurantVC: UIViewController {
    
    //MARK: - Variables
    private let bag = DisposeBag()
    private let viewModel = RestaurantViewModel()
    //MARK: - IBOutlet
    var collectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.observeToCreateDatasourceSection()
        viewModel.getAllCategories()
        
        configure()
        bindCollectionView()
        selectItemAction()
    }
    
    //MARK: - Helper Function
    private func configure(){
        title = "Restaurant"
        view.backgroundColor = .systemBackground
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: compositionalLayout())
        collectionView.backgroundColor = .systemGray6
        collectionView.allowsMultipleSelection = true
        view.addSubview(collectionView)
        registerCells()
        collectionView.setToEdges(containerView: view)
    }
    
    private func registerCells(){
        collectionView.register(CategoryCVCell.self, forCellWithReuseIdentifier: CategoryCVCell.reuseIdentifier())
        collectionView.register(DishCVCell.self, forCellWithReuseIdentifier: DishCVCell.reuseIdentifier())
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: "header",
                                withReuseIdentifier: HeaderView.reuseID)
    }
    
    private func bindCollectionView(){
        viewModel.itemsDatasources.bind(to: collectionView.rx.items(dataSource: viewModel.dataSection)).disposed(by: bag)
    }
    
    private func selectItemAction(){
        collectionView.rx.itemSelected.subscribe(onNext: { [weak self] selectedIndex in
            guard let self = self else {return}
            switch selectedIndex.section{
            case 0:
                let cell = self.collectionView.cellForItem(at: selectedIndex) as! CategoryCVCell
                self.viewModel.updateSelectedIndex(selectedIndex ,categoryID : cell.categoryID)
            default:
                break
            }
        }).disposed(by: bag)
    }
    
}
