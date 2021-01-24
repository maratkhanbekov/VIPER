//
//  SearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 18.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchRouterInput {
    func openDetail(for app: ITunesApp)
    func openAppInItunes(app: ITunesApp)
}

class SearchRouter: SearchRouterInput {
    weak var viewController: UIViewController?
    
    func openDetail(for app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
    
    func openAppInItunes(app: ITunesApp) {
        guard let urlString = app.appUrl, let url = URL(string: urlString) else {
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}


