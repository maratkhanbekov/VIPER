//
//  SearchSongPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Marat Khanbekov on 24.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchSongViewInput {
    var searchResults: [ITunesSong] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SearchSongViewOutput {
    func viewDidSearch(with query: String)
    func viewDidSelectApp(song: ITunesSong)
}


class SearchSongPresenter {
    weak var viewInput: (UIViewController & SearchSongViewInput)?
    
    //    private let searchService = ITunesSearchService()
    let interactor: SearchSongInteractor
    let router: SearchSongRouter
    
    init(interactor: SearchSongInteractor, router: SearchSongRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    
    private func requestApp(with query: String) {
        interactor.requestSongs(with: query) { [weak self] result in
            guard let self = self else { return }
            
            self.viewInput?.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = apps
                }
                .withError { (error) in
                    self.viewInput?.showError(error: error)
                }
        }
    }
    
    private func openDetails(for song: ITunesSong) {
        router.openDetail(for: song)
    }
}

extension SearchSongPresenter: SearchSongViewOutput {
    func viewDidSearch(with query: String) {
        viewInput?.throbber(show: true)
        requestApp(with: query)
    }
    
    func viewDidSelectApp(song: ITunesSong) {
        openDetails(for: song)
    }    
    
}
