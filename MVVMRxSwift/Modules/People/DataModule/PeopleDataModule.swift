//
//  PeopleDataModule.swift
//  MVVMRxSwift
//
//  Created by asfcarvalho on 30/10/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class APIRequest {
    var baseURL: URL!
    var method = "GET"
    var parameters = [String: String]()
    
    func request(with baseURL: URL) -> URLRequest {
          var request = URLRequest(url: baseURL)
           request.httpMethod = method
           request.allHTTPHeaderFields = ["Accept" : "application/json"]
           return request
    }
}

class PeopleDataModule {
    
    func peopleFetch() -> Observable<People> {
        let apiRequest = APIRequest()
        apiRequest.baseURL = URL(string: "https://swapi.co/api/peoplesw/?page=1")
        
        let result : Observable<People> = APICalling().fetch(apiRequest: apiRequest)
        
        return result
    }
    
    func teste() -> Observable<String> {
        
        return Observable.just("teste")
    }
}


class APICalling {
    // create a method for calling api which is return a Observable
    func fetch<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = apiRequest.request(with: apiRequest.baseURL)
            
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

                guard let data = data, error == nil else {
                    observer.onError(error!)
                    return

                }

                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    observer.onNext( model )
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create()
        }
    }
}
