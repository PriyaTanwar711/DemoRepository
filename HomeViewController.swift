//
//  HomeViewController.swift
//  Demo
//
//  Created by Yogesh Tanwar on 12/05/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    var shim = true {
        didSet {
            collection.isUserInteractionEnabled = !shim
            collection.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        shim = true
        collection.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.shim = false
        }
    }

    
    @IBAction func logoutAction(_ sender: UIButton) {
        // perform logout action
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICalendarViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shim ? 10 : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        cell.backgroundColor = .white
        cell.setTemplateWithSubviews(shim, animate: true, viewBackgroundColor: .systemBackground)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
