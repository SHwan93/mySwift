//
//  BucketListViewController.swift
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

protocol BucketListDisplayLogic: class
{
    func displayBucketList(viewModel: BucketList.Something.ViewModel, totalPrice: Int)
}

class BucketListViewController: UIViewController, BucketListDisplayLogic
{
  var interactor: BucketListBusinessLogic?
  var router: (NSObjectProtocol & BucketListRoutingLogic & BucketListDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = BucketListInteractor()
    let presenter = BucketListPresenter()
    let router = BucketListRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
    @IBOutlet var TV: UITableView!
    @IBOutlet weak var totalPriceLbl: UILabel!
    
    var displayedBucketList: [BucketList.Something.ViewModel.ViewModelMenu] = []
    lazy var footerView: UIButton = {
       let btn = UIButton(type: UIButton.ButtonType.system)
        btn.backgroundColor = .lightGray
        btn.setTitle("MORE +", for: .normal)
        btn.setTitleColor(UIColor.orange, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(more(_:)), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad()
  {
    super.viewDidLoad()
    self.navigationController?.navigationBar.isHidden = false
    self.navigationItem.title = "Bucket"
    self.navigationItem.hidesBackButton = true
    
    TV.dataSource = self
    TV.delegate = self
    TV.separatorStyle = .none
    TV.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
    footerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 45)
    TV.tableFooterView = footerView
    
    
    let nibName = UINib(nibName: "MenuListTableViewCell", bundle: nil)
    TV.register(nibName, forCellReuseIdentifier: "myCell")
    fetchTVData()
  }
    
    @objc func more(_ sender: Any) {
        self.router?.backToList(source: self)
    }
    
  // MARK: Do something
    @IBAction func cancel(_ sender: UIButton) {
        let alert = UIAlertController(title: "Are you sure to canel?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "CANCEL", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
            Bucket.sharedInstance.List = []
            self.router?.backToList(source: self)
        }))
        present(alert, animated: true, completion: nil)
    }
    
  //@IBOutlet weak var nameTextField: UITextField!
    @IBAction func buy(_ sender: UIButton) {
        let alert = UIAlertController(title: "Are you sure to buy?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "CANCEL", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
            let alert2 = UIAlertController(title: "Thanks for buying", message: nil, preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                    Bucket.sharedInstance.List = []
                    self.router?.backToList(source: self)
            }))
            
            self.present(alert2, animated: true, completion: nil)

        }))
        present(alert, animated: true) {
            
        }
    }
    
  func fetchTVData()
  {
    let request = BucketList.Something.Request()
    interactor?.fetchTVData(request: request)
  }
  
    func displayBucketList(viewModel: BucketList.Something.ViewModel, totalPrice: Int)
  {
    displayedBucketList = viewModel.bucketList
    totalPriceLbl.text = "Total : ₩ \(totalPrice)"
    TV.reloadData()
  }
}

extension BucketListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedBucketList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MenuListTableViewCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.name?.text = displayedBucketList[indexPath.row].name
        cell.price?.text = displayedBucketList[indexPath.row].price
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let bucket = Bucket.sharedInstance
            bucket.List.remove(at: indexPath.row)
            displayedBucketList.remove(at: 0)
            tableView.deleteRows(at: [indexPath], with: .fade)
            fetchTVData()
        }
    }
}
