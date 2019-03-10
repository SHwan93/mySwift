//
//  Bucket.swift
//  CleanSwiftExample
//
//  Created by 최승환 on 2019. 3. 10..
//  Copyright © 2019년 최승환. All rights reserved.
//

import Foundation


class Bucket {
    
    static let sharedInstance = Bucket()
    
    var List: [ResponseMenu] = []
    
    private init() {
        
    }
    
}
