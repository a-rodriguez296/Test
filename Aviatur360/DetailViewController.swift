//
//  DetailViewController.swift
//  Aviatur360
//
//  Created by Alejandro Rodriguez on 2/1/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var imgSite: UIImageView!
    @IBOutlet weak var lblSite: UILabel!

    var data:(String,String)
    
    
    
    init(siteData: (String, String)){
        
        data = siteData
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         edgesForExtendedLayout = []
        
        
        lblSite.text = data.1
        imgSite.image = UIImage(named: data.0)
    }
    

    @IBAction func didPressPhotoGallery(_ sender: Any) {
        
        let photoVC = PhotoViewController()
        navigationController?.pushViewController(photoVC, animated: true)
        
    }
    
    @IBAction func didPressVideoPlayer(_ sender: Any) {
        let videoVC = VideoViewController()
        navigationController?.pushViewController(videoVC, animated: true)
        
    }
    
    
    
}
