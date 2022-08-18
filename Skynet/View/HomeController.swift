//
//  HomeController.swift
//  Skynet
//
//  Created by Moyses Miranda do Vale Azevedo on 16/08/22.
//

import Foundation
import UIKit

class Cell: UICollectionViewCell {
    lazy var labelName: UILabel = {
        let labelName = UILabel(frame: CGRect())
        labelName.text = "Name"
        labelName.textAlignment = NSTextAlignment.center;
        labelName.translatesAutoresizingMaskIntoConstraints = false
        return labelName
    }()

    lazy var labelHours: UILabel = {
        let labelHours = UILabel(frame: CGRect())
        labelHours.text = "Horas"
        labelHours.textAlignment = NSTextAlignment.center;
        labelHours.translatesAutoresizingMaskIntoConstraints = false
        return labelHours
    }()

    lazy var labelPost: UILabel = {
        let labelPost = UILabel(frame: CGRect())
        labelPost.text = "Post"
        labelPost.textAlignment = NSTextAlignment.center;
        labelPost.translatesAutoresizingMaskIntoConstraints = false
        return labelPost
    }()

    lazy var buttonLike: UIButton = {
        let labelPost = UIButton(frame: CGRect())
        labelPost.backgroundColor = .systemPink
        labelPost.setTitle("Login", for: .normal)
        labelPost.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        labelPost.setTitleColor(.white, for: .normal)
        //labelPost.addTarget(self, action: #selector(login), for: .touchUpInside)
        labelPost.translatesAutoresizingMaskIntoConstraints = false
        return labelPost
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemRed
        addSubview(labelName)
        addSubview(labelHours)
        addSubview(labelPost)

       setConstraints()
    }

    func setConstraints(){
        setConstraintLabelName()
        setConstraintLabelHours()
        setConstraintLabelPost()
    }

    func setConstraintLabelName(){
        NSLayoutConstraint.activate(
            [
                labelName.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -self.frame.width/2.5),
                labelName.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -self.frame.height/2.5),
                labelName.heightAnchor.constraint(equalTo: self.heightAnchor,
                                                  multiplier: 0.8),
                labelName.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            ]
        )
    }

    func setConstraintLabelHours(){
        NSLayoutConstraint.activate(
            [
                labelHours.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: self.frame.width/2.5),
                labelHours.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: self.frame.height/2.5),
                labelHours.heightAnchor.constraint(equalTo: self.heightAnchor,
                                                  multiplier: 0.1),
                labelHours.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25),
            ]
        )
    }

    func setConstraintLabelPost(){
        NSLayoutConstraint.activate(
            [
                labelPost.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                labelPost.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                labelPost.heightAnchor.constraint(equalTo: self.heightAnchor,
                                                  multiplier: 0.8),
                labelPost.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            ]
        )
    }

    func setConstraint(){
        NSLayoutConstraint.activate(
            [

            ]
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

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
        collectionViewPosts.register(Cell.self, forCellWithReuseIdentifier: "collectionViewPosts")
        collectionViewPosts.backgroundColor = .red
        collectionViewPosts.translatesAutoresizingMaskIntoConstraints = false
        return collectionViewPosts

    }()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return album.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewPosts", for: indexPath) as! Cell
        cell.labelPost.text = album[indexPath.item]
        //        let text = UITextView(frame: CGRect())
        //        text.text = album[indexPath.item]
        //        text.frame.size = cell.contentView.bounds.size
        //
        //
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.title = "Home"
        view.addSubview(collectionViewPosts)
        self.setUpHomeConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func setUpHomeConstraints(){
        NSLayoutConstraint.activate([
            collectionViewPosts.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            collectionViewPosts.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            collectionViewPosts.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            collectionViewPosts.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

    func setUpConstraintCollectionViewPosts(){

    }
}
