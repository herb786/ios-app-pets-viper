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

struct DogPresenter {
    
    var dogView: DogViewProtocol?
    var dogInteractor = DogInteractor()
    
    init(){
        dogInteractor.dogService = DogService.init()
    }
    
    func loadOnlyDogsWithPhoto() {
        dogView?.showProgressBar()
        let dogs = dogInteractor.getDogListOnlyWithSmallPhoto()
        dogView?.showDogs(dogs: dogs)
        dogView?.hideProgressBar()
    }
    
}
