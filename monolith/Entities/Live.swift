//
//  Live.swift
//  monolith
//
//  Created by Takahiro Ishitsuka  on 2019/07/07.
//  Copyright © 2019 Taka. All rights reserved.
//

import Foundation
import UIKit

struct Live {
    let name: String
    let place: String
    let date: String
    let officialSiteURL: String
    let mainImage: UIImage

    
    static func seeds() -> [Live] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return [Live(name: "ROCK IN JAPAN FESTIVAL", place: "国営ひたち海浜公園(茨城県)", date: dateFormatter.string(from: Date()), officialSiteURL: "http://rijfes.jp/", mainImage: R.image.rijf()!),
                Live(name: "SATANIC CARNIBAL", place: "幕張メッセ 国際展示場 9-11(千葉県)", date: dateFormatter.string(from: Date()), officialSiteURL: "https://carnival.satanic.jp", mainImage: R.image.satanic()!)]
    }
}
