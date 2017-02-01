//
//  ListViewController.swift
//  Aviatur360
//
//  Created by Alejandro Rodriguez on 1/31/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let array:[(String, String)] = [("bogota", "Bogotá"), ("cartagena", "Cartagena"), ("medellin", "Medellín"), ("cali", "Cali"),("barranquilla", "Barranquilla"), ("san andres", "San Andrés"),("santa marta", "Santa Marta"), ("eje cafetero", "Eje Cafetero"), ("amazonas", "Amazonas"),("santander", "Santander"), ("guajira", "Guajira"), ("boyaca", "Boyacá"), ("llanos", "Llanos"),("pasto","Pasto")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Regiones"
        
        collectionView.register(UINib(nibName: "SitesCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }
}


extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SitesCell
        
        cell.imgSite.image = UIImage(named: array[indexPath.row].0)
        cell.lblSite.text = array[indexPath.row].1
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController(siteData: array[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let sqWidth = collectionView.frame.size.width/2
        
        return CGSize(width: sqWidth, height: sqWidth * 1.25)
        
        
    }
    
}
