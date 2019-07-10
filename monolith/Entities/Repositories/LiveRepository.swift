//
//  LiveRepository.swift
//  monolith
//
//  Created by Takahiro Ishitsuka  on 2019/07/10.
//  Copyright © 2019 Taka. All rights reserved.
//

import Foundation

class LiveRepository {
    
    class func selectAll() -> [Live] {
        return seedsLives()
    }
    
    // 将来的にはサーバーから取得します。
    private static func seedsLives() -> [Live] {
        return [
            Live(name: "SATANIC CARNIBAL", place: "幕張メッセ 国際展示場 9-11(千葉県)", date: ["2019-06-15", "2019-06-16"], officialSiteURL: "https://carnival.satanic.jp", mainImage: R.image.satanic()!),
             Live(name: "DEAD POP FESTIFAL", place: "川崎市東扇島東公園特設会場(神奈川県)", date: ["2019-06-22", "2019-06-23"], officialSiteURL: "https://deadpopfest.com/", mainImage: R.image.dpf()!),
            Live(name: "京都大作戦", place: "京都府立山城総合運動公園(京都府)", date: ["2019-06-29", "2019-06-30", "2019-07-06", "2019-07-07"], officialSiteURL: "https://kyoto-daisakusen.kyoto", mainImage: R.image.kyoto()!),
            Live(name: "ROCK IN JAPAN FESTIVAL", place: "国営ひたち海浜公園(茨城県)", date: ["2019-08-03", "2019-08-04", "2019-08-10", "2019-08-11", "2019-08-12"], officialSiteURL: "http://rijfes.jp/", mainImage: R.image.rijf()!),
            Live(name: "SUMMER SONIC", place: "ZOZOマリンスタジアム＆幕張メッセ(千葉県)\n 舞洲SONIC PARK（大阪)", date: ["2019-08-16", "2019-08-17", "2019-08-18"], officialSiteURL: "http://www.summersonic.com", mainImage: R.image.summer_sonic()!),
            Live(name: "SWEET LOVE SHOWER", place: "山中湖交流プラザ きらら(山梨県)", date: ["2019-08-30", "2019-08-31", "2019-09-01"], officialSiteURL: "https://www.sweetloveshower.com", mainImage: R.image.sls()!)
        ]
    }
    
}

