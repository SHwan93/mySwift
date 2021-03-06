//
//  MenuListWorker.swift
//  CleanSwiftExample
//
//  Created by 최승환 on 2019. 3. 9..
//  Copyright (c) 2019년 최승환. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class MenuListWorker
{
    func getData() -> [ResponseMenu] {
        
        let data = [
            ResponseMenu(name: "Americano", price: 4100),
            ResponseMenu(name: "Latte", price: 4600),
            ResponseMenu(name: "Caffe Moca", price: 5100),
            ResponseMenu(name: "Caramel Maki", price: 5600),
            ResponseMenu(name: "Espresso", price: 3300),
            ResponseMenu(name: "Soft Icecream", price: 3500),
            ResponseMenu(name: "Milk Shake", price: 5500)
        ]
        return data
    }
}
