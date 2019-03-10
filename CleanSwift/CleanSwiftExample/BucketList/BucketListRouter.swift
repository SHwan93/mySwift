//
//  BucketListRouter.swift
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

@objc protocol BucketListRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
    func backToList(source: BucketListViewController)
}

protocol BucketListDataPassing
{
  var dataStore: BucketListDataStore? { get }
}

class BucketListRouter: NSObject, BucketListRoutingLogic, BucketListDataPassing
{
  weak var viewController: BucketListViewController?
  var dataStore: BucketListDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
//  func navigateToSomewhere(source: BucketListViewController, destination: SomewhereViewController)
//  {
//    source.show(destination, sender: nil)
//  }
    func backToList(source: BucketListViewController) {
        source.navigationController?.popViewController(animated: true)
    }
  // MARK: Passing data
  
  //func passDataToSomewhere(source: BucketListDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
