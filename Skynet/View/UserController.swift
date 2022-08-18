//
//  UserController.swift
//  Skynet
//
//  Created by Moyses Miranda do Vale Azevedo on 16/08/22.
//

import Foundation
import UIKit



class UserController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var album = ["Oi", "dfsfd", "34234", "324234", "dslfnsd", "Oi", "dfsfd", "34234", "324234", "dslfnsd"]

    lazy var imageUser: UIImage = {
        let imageUser = UIImage(systemName: "person")
        return imageUser!
    }()

    lazy var labelName: UILabel = {
        let labelName = UILabel(frame: CGRect())
        labelName.text = "@Mirazev"
        labelName.textAlignment = NSTextAlignment.center;
        labelName.translatesAutoresizingMaskIntoConstraints = false
        return labelName
    }()

    lazy var labelEmail: UILabel = {
        let labelEmail = UILabel(frame: CGRect())
        labelEmail.text = "Name"
        labelEmail.textAlignment = NSTextAlignment.center;
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        return labelEmail
    }()

    lazy var collectionViewPosts: UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        // margens cell
        layout.itemSize = CGSize(width: self.view.frame.width * 0.9, height: self.view.frame.height * 0.2)
        // tamanho da celula

        let collectionViewPosts: UICollectionView  = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionViewPosts.dataSource = self
        collectionViewPosts.delegate = self
        collectionViewPosts.register(CellPost.self, forCellWithReuseIdentifier: "collectionViewPosts")
        collectionViewPosts.backgroundColor = .red
        collectionViewPosts.translatesAutoresizingMaskIntoConstraints = false
        return collectionViewPosts

    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.title = "User"
        view.addSubview(collectionViewPosts)
        self.setUpCollectionViewPostsConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return album.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewPosts", for: indexPath) as! CellPost
        cell.labelPost.text = album[indexPath.item]
        //        let text = UITextView(frame: CGRect())
        //        text.text = album[indexPath.item]
        //        text.frame.size = cell.contentView.bounds.size
        //
        //
        return cell
    }

    func setUpCollectionViewPostsConstraints(){
        NSLayoutConstraint.activate([
            collectionViewPosts.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            collectionViewPosts.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            collectionViewPosts.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            collectionViewPosts.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.height / 3)
        ])
    }
}


