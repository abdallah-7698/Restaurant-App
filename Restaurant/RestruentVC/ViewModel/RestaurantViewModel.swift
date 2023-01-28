//
//  RestaurantViewModel.swift
//  FlatMapProject2
//
//  Created by Abdallah on 25/01/2023.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

class RestaurantViewModel{
    
    private let bag = DisposeBag()
    private let networkManager = NetworkManager()
    
    let categoryBehavior : PublishSubject< [CategoryModel] > = .init()
    let dishBehavior : PublishSubject< [DishModel] > = .init()
    
    // MARK:  Bind with section to pass the data to the collectionView
    let itemsDatasources : BehaviorSubject<[RestaurantCVSection]> = .init(value: [])
    let selectedIndexies: BehaviorRelay< [IndexPath] > = .init(value: [])
    
    var categoryDectionary : [String : [DishModel]] = [:]
    // MARK: - Data sources
    var dataSection = RestaurantDatasource.instance.dataSource()
    
    init() {
        bindingWithSelectedIndex()
    }
    
    func bindingWithSelectedIndex(){
        selectedIndexies.bind(to: RestaurantDatasource.instance.selectedIndexesBehavior).disposed(by: bag)
    }
    
    func updateSelectedIndex(_ indexPath: IndexPath , categoryID : String){
        if selectedIndexies.value.contains(indexPath) {
            // Remove
            let lastSelectedIndexes = selectedIndexies.value.filter({$0 != indexPath})
            selectedIndexies.accept(lastSelectedIndexes)
            categoryDectionary[categoryID] = nil
            if lastSelectedIndexes.isEmpty {
                getAllCategories()
            }else{
                let allDishes = categoryDectionary.map {$1}.flatMap { $0 }
                self.dishBehavior.onNext(allDishes)
            }
        }else{
            // add
            getAllDishesFor(categoryID: categoryID)
            let lastSelectedIndexes = selectedIndexies.value + [indexPath]
            selectedIndexies.accept(lastSelectedIndexes)
            insertInDictionary(categoryID: categoryID)
        }
    }
    
    func insertInDictionary(categoryID : String){
        categoryDectionary[categoryID] = []
    }
    
    // MARK: - Prepare data to pass it to itemsDatasources
    func observeToCreateDatasourceSection() {
        // Convert Catigory Behavior To Restorant Section
        let catigorySection = categoryBehavior.asObservable()
            .compactMap({
                $0.compactMap({RestaurantCVItem.CategoryItem(category: $0)})
            }).map({
                RestaurantCVSection.CategorySection(items: $0)
            })
        // Convert Dish Behavior To Restorant Section
        let dishSection = dishBehavior.asObservable()
            .compactMap({
                $0.compactMap({RestaurantCVItem.DishItem(dish: $0)})
            }).compactMap({
                RestaurantCVSection.DishSection(items: $0)
            })
        // Combine Them to [Section]
        Observable.combineLatest(catigorySection, dishSection)
            .compactMap({ [$0] + [$1] })
            .subscribe(onNext: { value in
                self.itemsDatasources.onNext(value)
            }).disposed(by: bag)
    }
    
    // MARK:  Get Data from API
    
    func getAllCategories(){
        networkManager.feachData(stringUrl: .feachAllCategories, method: .get, modelType: AllDishes.self)
            .compactMap({($0.data?.categories, $0.data?.populars)})
            .subscribe(onNext: { [unowned self] (catigories, dishes) in
                self.categoryBehavior.onNext(catigories ?? [])
                self.dishBehavior.onNext(dishes ?? [])
            }).disposed(by: bag)
    }
    
    func getAllDishesFor(categoryID : String){
        networkManager.feachData(stringUrl: .feachCategoryDishes(categoryID), method: .get, modelType: Dishes.self)
            .compactMap { $0.data }
            .subscribe(onNext: { [weak self] dishes in
                guard let self = self else {return}
                self.categoryDectionary[categoryID] = dishes
                let allDishes = self.categoryDectionary.map {$1}.flatMap { $0 }
                self.dishBehavior.onNext(allDishes)
            }).disposed(by: bag)
    }
    
}
