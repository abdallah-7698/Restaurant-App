//
//  RestaurantDataSource.swift
//  FlatMapProject2
//
//  Created by Abdallah on 25/01/2023.
//
import RxSwift
import RxCocoa
import RxDataSources

enum RestaurantCVItem{
    case CategoryItem(category : CategoryModel)
    case DishItem(dish : DishModel)
}

enum RestaurantCVSection {
    case CategorySection(items : [RestaurantCVItem])
    case DishSection(items : [RestaurantCVItem])
}

extension RestaurantCVSection : SectionModelType{
    
    typealias Item = RestaurantCVItem
    
    /// modify
    var headers : String{
        switch self {
        case .CategorySection:
            return "Categories"
        case .DishSection:
            return "Dishes"
        }
    }
    
    var items: [RestaurantCVItem] {
        switch self {
        case .CategorySection(let items) :
            return items
        case .DishSection(let items):
            return items
        }
    }
    
    init(original: RestaurantCVSection, items: [RestaurantCVItem]) {
        self = original
    }
    
}

class RestaurantDatasource {
    
    typealias DataSource = RxCollectionViewSectionedReloadDataSource
    static let instance = RestaurantDatasource()
    let selectedIndexesBehavior: BehaviorRelay< [IndexPath] > = .init(value: [])
    private init () {}
    func dataSource()->DataSource<RestaurantCVSection>{
        return .init { (dataSource, collectionView, indexPath, model) -> UICollectionViewCell in
            switch dataSource[indexPath]{
            case .CategoryItem(category: let category):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCVCell.reuseIdentifier(), for: indexPath) as! CategoryCVCell
                cell.set(category: category)
                let isSelected = self.selectedIndexesBehavior.value.contains(indexPath)
                cell.isSelected(isSelected)
                return cell
            case .DishItem(dish: let dish):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishCVCell.reuseIdentifier(), for: indexPath) as! DishCVCell
                cell.set(dish: dish)
                return cell
            }
        } configureSupplementaryView: { (dataSource, collectionView, kind, indexPath) -> UICollectionReusableView in
            switch dataSource[indexPath]{
            case .CategoryItem , .DishItem:
                guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: HeaderView.reuseID, for: indexPath) as? HeaderView else{return UICollectionReusableView()}
                view.title.text = dataSource.sectionModels[indexPath.section].headers
                return view
            }
        }
    }
}
