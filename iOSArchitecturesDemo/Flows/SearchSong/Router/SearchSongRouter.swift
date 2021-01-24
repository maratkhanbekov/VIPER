//
//  SearchSongRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Marat Khanbekov on 24.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchSongRouterInput {
    func openDetail(for song: ITunesSong)
    func openAppInItunes(song: ITunesSong)
}


class SearchSongRouter: SearchSongRouterInput {
    weak var viewController: UIViewController?
    
    func openDetail(for song: ITunesSong) {
//        let appDetailViewController = AppDetailViewController(app: app)
//        viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
    
    func openAppInItunes(song: ITunesSong) {
//        guard let urlString = song.appUrl, let url = URL(string: urlString) else {
//            return
//        }
//
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
