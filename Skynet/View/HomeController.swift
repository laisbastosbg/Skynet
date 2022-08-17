//
//  HomeController.swift
//  Skynet
//
//  Created by Moyses Miranda do Vale Azevedo on 16/08/22.
//

import Foundation
import UIKit

class HomeController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    var album: [String] = ["OI", "blz", "dsfsdf", "fsdfdsfds"]

    lazy var collectionViewPosts: UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        // margens cell
        layout.itemSize = CGSize(width: self.view.frame.width * 0.9, height: self.view.frame.height * 0.2)
        // tamanho da celula

        let collectionViewPosts: UICollectionView  = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionViewPosts.dataSource = self
        collectionViewPosts.delegate = self
        collectionViewPosts.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewPosts")
        collectionViewPosts.backgroundColor = .red
        collectionViewPosts.translatesAutoresizingMaskIntoConstraints = false
        return collectionViewPosts
    }()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return album.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewPosts", for: indexPath)
        let text = UITextView(frame: CGRect())
        text.text = album[indexPath.item]
        text.frame.size = cell.contentView.bounds.size
        cell.addSubview(text)
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.title = "Home"
        view.addSubview(collectionViewPosts)
        self.setUpHomeConstraints()
    }

    func setUpHomeConstraints(){
        NSLayoutConstraint.activate([
            collectionViewPosts.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            collectionViewPosts.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            collectionViewPosts.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            collectionViewPosts.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
