//
//  BucketListModels.swift
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

enum BucketList
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request
    {
    }
    struct Response
    {
        var selectedMenuList: [ResponseMenu]
    }
    struct ViewModel
    {
        struct ViewModelMenu {
            var name: String
            var price: String
        }
        var bucketList: [ViewModelMenu]
    }
  }
}