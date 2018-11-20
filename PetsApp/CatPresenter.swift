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

class CatPresenter {
    
    var catView: CatViewProtocol?
    var catInteractor: CatInteractor()
    
    func loadOnlyCatsWithPhoto() {
        catView?.showProgressBar()
        let cats = catInteractor.getCatListOnlyWithPhoto()
        catView?.showCats(cats: cats)
        catView?.hideProgressBar()
    }
    
    func loadOnlyFurryCats() {
        catView?.showProgressBar()
        let cats = catInteractor.getCatListOnlyWithLongFur()()
        catView?.showCats(cats: cats)
        catView?.hideProgressBar()
    }
    
}
