//
//  CatPresenter.swift
//  PetsApp
//
//  Created by Herbert Caller on 20/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import Foundation
import Business
import Service

class CatPresenter: CatRoutingProtocol {
    
    var catView: MainViewProtocol?
    var catInteractor = CatInteractor()
    var navController: UINavigationController?
    var cats: [CatEntity] = []
    
    init(){
        catInteractor.catService = CatService.init()
    }
    
    func loadOnlyCatsWithPhoto() {
        catView?.showProgressBar()
        self.cats = catInteractor.getCatListOnlyWithPhoto()
        catView?.hideProgressBar()
        goToCatView()
    }
    
    func loadOnlyFurryCats() {
        catView?.showProgressBar()
        self.cats = catInteractor.getCatListOnlyWithLongFur()
        catView?.hideProgressBar()
        goToCatView()
    }
    
    func goToCatView() {
        let catSb = UIStoryboard.init(name: "CatStoryboard", bundle: nil)
        let catListView = catSb.instantiateViewController(withIdentifier: "CatViewController") as! CatViewController
        catListView.cats = self.cats
        //present(catView, animated: true, completion: nil)
        //performSegue(withIdentifier: "CatSegue", sender: self)
        navController?.navigationController?.pushViewController(catListView, animated:true)
    }
    
}
