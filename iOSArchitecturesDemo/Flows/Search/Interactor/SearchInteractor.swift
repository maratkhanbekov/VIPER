//
//  SearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 18.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchInteractorInput {
    func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void)
}

class SearchInteractor: SearchInteractorInput {
    private let searchService = ITunesSearchService()
    
    func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void) {
        searchService.getApps(forQuery: query, then: completion)
    }
}


