//
//  ViewController.swift
//  Skynet
//
//  Created by Moyses Miranda do Vale Azevedo on 09/08/22.
//

import UIKit

class MainController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setUpView()
    }

    func setUpView() {
        let homeController = UINavigationController(rootViewController: HomeController())
        let seachController = UINavigationController(rootViewController: SeachController())
        let publishController = UINavigationController(rootViewController: PublishController())
        let notificationController = UINavigationController(rootViewController: NotificationController())
        let userController = UINavigationController(rootViewController: UserController())



        self.setViewControllers([homeController, seachController, publishController, notificationController, userController], animated: true)
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false

        guard let items = self.tabBar.items else {return}

        items[0].title = "Home"
        items[0].image = UIImage(systemName: "house.fill")
        //gearshape engrenagem config
        items[1].title = "Seach"
        items[1].image = UIImage(systemName: "magnifyingglass")

        items[2].title = "Publish"
        items[2].image = UIImage(systemName: "rectangle.and.pencil.and.ellipsis")

        items[3].title = "Notification"
        items[3].image = UIImage(systemName: "star")

        items[4].title = "User"
        items[4].image = UIImage(systemName: "person")
    }
}






