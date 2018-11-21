//
//  ViewController.swift
//  PetsApp
//
//  Created by Herbert Caller on 19/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import UIKit
import Business

extension ViewController: CatViewProtocol {
    
    func showCats(cats: [CatEntity]) {
        self.cats = cats
        //performSegue(withIdentifier: "CatSegue", sender: self)
        goToCatView()
    }
    
}

extension ViewController: DogViewProtocol {
    
    func showDogs(dogs: [DogEntity]) {
        self.dogs = dogs
        //performSegue(withIdentifier: "DogSegue", sender: self)
        goToDogView()
    }
    
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
    
    var cats: [CatEntity] = []
    var dogs: [DogEntity] = []
    
    var catPresenter = CatPresenter()
    var dogPresenter =  DogPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        catPresenter.catView = self
        dogPresenter.dogView = self
        
        indicatorView?.style = .gray
        indicatorView?.hidesWhenStopped = true
        indicatorView?.stopAnimating()
        
    }
    
    func goToCatView() {
        let catSb = UIStoryboard.init(name: "CatStoryboard", bundle: nil)
        let catView = catSb.instantiateViewController(withIdentifier: "CatViewController") as! CatViewController
        catView.cats = self.cats
        //present(catView, animated: true, completion: nil)
        self.navigationController?.pushViewController(catView, animated: true)
    }
    
    func goToDogView() {
        
        let dogSb = UIStoryboard.init(name: "DogStoryboard", bundle: nil)
        let dogView = dogSb.instantiateViewController(withIdentifier: "DogViewController") as! DogViewController
        dogView.dogs = self.dogs
        //present(dogView, animated: true, completion: nil)
        self.navigationController?.pushViewController(dogView, animated: true)
    }

}

