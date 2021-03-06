//
//  MenuListInteractor.swift
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

protocol MenuListBusinessLogic
{
  func fetchTVData(request: MenuList.Something.Request)
}

protocol MenuListDataStore
{
  var menuList: [ResponseMenu] { get set }
}

class MenuListInteractor: MenuListBusinessLogic, MenuListDataStore
{
  var presenter: MenuListPresentationLogic?
  var worker: MenuListWorker?
  var menuList: [ResponseMenu] = []
  
  // MARK: Do something
  
  func fetchTVData(request: MenuList.Something.Request)
  {
    worker = MenuListWorker()
    let dataList = worker?.getData()
    menuList = dataList!
    
    let response = MenuList.Something.Response(menuList: dataList!)
    presenter?.presentMenuList(response: response)
  }
}
