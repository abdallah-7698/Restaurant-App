//
//  NetworkManager.swift
//  FlatMapProject2
//
//  Created by Abdallah on 25/01/2023.
//

import Foundation
import RxSwift


class NetworkManager {
    
    let bag = DisposeBag()
    
    func feachData<T : Decodable>(stringUrl : Route ,method : Method, modelType : T.Type) -> Observable<T>{
        return Observable.of(stringUrl.description)
            .map { sURL -> URL in
                return URL(string: sURL)!
            }
            .map { url -> URLRequest in
                var request = URLRequest(url: url)
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpMethod = method.rawValue
                print(request)
                return request
            }
            .flatMap { request -> Observable<(response : HTTPURLResponse , data : Data)> in
                return URLSession.shared.rx.response(request: request)
            }
            .share(replay: 1)
            .filter { (response,_) in
                return 200..<400 ~= response.statusCode
            }
            .compactMap { (_, data) -> T? in
               let model =  try? JSONDecoder().decode(T.self, from: data)
                print("model is ",model)
                return model
            }.share(replay: 1)
    }
    
}
