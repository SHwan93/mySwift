//
//  BucketListInteractor.swift
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

protocol BucketListBusinessLogic
{
  func fetchTVData(request: BucketList.Something.Request)
}

protocol BucketListDataStore
{
  var selectedMenu: [ResponseMenu] { get set }
}

class BucketListInteractor: BucketListBusinessLogic, BucketListDataStore
{
  var presenter: BucketListPresentationLogic?
  var worker: BucketListWorker?
  var selectedMenu: [ResponseMenu] = []
  
  // MARK: Do something
  
  func fetchTVData(request: BucketList.Something.Request)
  {
//    worker = BucketListWorker()
//    worker?.doSomeWork()
    let response = BucketList.Something.Response(selectedMenuList: Bucket.sharedInstance.List)
    presenter?.presentBucketList(response: response)
  }
}
