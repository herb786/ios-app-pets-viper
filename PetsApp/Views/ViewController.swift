//
//  ViewController.swift
//  PetsApp
//
//  Created by Herbert Caller on 19/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import UIKit
import Business

extension ViewController: MainViewProtocol {
    
    func showProgressBar() {
        self.indicatorView?.startAnimating()
    }
    
    func hideProgressBar() {
        self.indicatorView?.stopAnimating()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetCell", for: indexPath)
        cell.textLabel?.text = self.cells[indexPath.row]
        cell.textLabel?.font = UIFont.init(name: "Gurmukhi MN", size: 40)
        cell.textLabel?.textColor = UIColor.init(red: 0.9, green: 0.5, blue: 0.5, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            catPresenter.loadOnlyFurryCats()
        case 2:
            catPresenter.loadOnlyCatsWithPhoto()
        default:
            dogPresenter.loadOnlyDogsWithPhoto()
        }
    }
    
}


class ViewController: UIViewController {
    
    let cells = ["Dogs", "Furry Cats", "Cats"]
    @IBOutlet weak var petTableView: UITableView?
    @IBOutlet weak var indicatorView: UIActivityIndicatorView?
    
    var dogs: [DogEntity] = []
    
    var catPresenter = CatPresenter()
    var dogPresenter =  DogPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        catPresenter.catView = self
        dogPresenter.dogView = self
        catPresenter.navController = self.navigationController
        dogPresenter.navController = self.navigationController
        
        indicatorView?.style = .gray
        indicatorView?.hidesWhenStopped = true
        indicatorView?.stopAnimating()
        
    }


}

