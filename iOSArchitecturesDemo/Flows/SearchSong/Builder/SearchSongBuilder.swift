//
//  SearchSongBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Marat Khanbekov on 24.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit


class SearchSongBuilder {
    
    static func build() -> (UIViewController & SearchSongViewInput) {
        
        let router = SearchSongRouter()
        let interactor = SearchSongInteractor()
        let presenter = SearchSongPresenter(interactor: interactor, router: router)
        
        let viewController = SearchSongViewController(presenter: presenter)
        
        router.viewController = viewController
        presenter.viewInput = viewController
        
        return viewController
    }
}
