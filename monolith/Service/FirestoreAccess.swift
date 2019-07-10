//
//  FirestoreAccess.swift
//  monolith
//
//  Created by Takahiro Ishitsuka  on 2019/07/10.
//  Copyright © 2019 Taka. All rights reserved.
//

import Foundation
import Firebase

class FirestoreAccess {
    
    static func getLives() {
        Firestore.firestore().collection("lives").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                querySnapshot!.documents.map({ document -> Live in
                    let data = document.data()
                return Live(name: data["name"] as! String, place: data["place"] as! String, date: data["date"] as! [String], officialSiteURL: data["officialSiteURL"] as! String, mainImageURL: data["mainImageURL"] as! String)
                })
            }
        }
    }
}
