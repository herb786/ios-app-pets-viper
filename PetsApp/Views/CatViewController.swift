//
//  CatViewController.swift
//  PetsApp
//
//  Created by Herbert Caller on 21/11/2018.
//  Copyright © 2018 hacaller. All rights reserved.
//

import UIKit
import Business


class CatViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cats?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetCollectionCell", for: indexPath) as! PetCollectionViewCell
        let urlPhoto = cats?[indexPath.row].photo
        DispatchQueue.global(qos: .background).async {
            do {
                if let urlImg = URL.init(string: urlPhoto!) {
                    let data = try Data.init(contentsOf: urlImg)
                    DispatchQueue.main.async {
                        cell.photo?.image = UIImage.init(data: data)
                    }
                }
            } catch {}
        }
        cell.label?.text = cats?[indexPath.row].breed
        return cell
    }
    
    
    @IBOutlet weak var petCollectionView: UICollectionView?
    var cats: [CatEntity]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        petCollectionView?.register(UINib.init(nibName: "PetCollectionCell", bundle: nil), forCellWithReuseIdentifier: "PetCollectionCell")
    }
    
    
}
