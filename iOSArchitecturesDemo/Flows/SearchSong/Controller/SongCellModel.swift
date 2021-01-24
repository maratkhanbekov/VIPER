//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Marat Khanbekov on 24.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
    let title: String
    let subtitle: String?
}

final class SongCellModelFactory {
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(title: model.trackName,
                            subtitle: model.artistName)
    }
}
