//
//  DogPresenter.swift
//  PetsApp
//
//  Created by Herbert Caller on 20/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import Foundation
import Business
import Service

class DogPresenter: DogPlumblingProtocol {
    
    var dogView: MainViewProtocol?
    var dogInteractor = DogInteractor()
    var navController: UINavigationController?
    var dogs: [DogEntity] = []
    
    init(){
        dogInteractor.dogService = DogService.init()
    }
    
    func loadOnlyDogsWithPhoto() {
        dogView?.showProgressBar()
        self.dogs = dogInteractor.getDogListOnlyWithSmallPhoto()
        dogView?.hideProgressBar()
        goToDogView()
    }
    
    func goToDogView() {
        let dogSb = UIStoryboard.init(name: "DogStoryboard", bundle: nil)
        let dogView = dogSb.instantiateViewController(withIdentifier: "DogViewController") as! DogViewController
        dogView.dogs = self.dogs
        //present(dogView, animated: true, completion: nil)
        //performSegue(withIdentifier: "DogSegue", sender: self)
        self.navController?.pushViewController(dogView, animated: true)
    }
    
}
