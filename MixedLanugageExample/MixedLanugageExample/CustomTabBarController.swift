//
//  CustomTabBarController.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 02/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import UIKit
import SwiftUI

final class CustomTabBarController: UITabBarController {
    private let workoutsVC: UIViewController = UIHostingController<WorkoutsView>(rootView: WorkoutsView(viewModel: .init(service: .live)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = ViewControllerObjC()
        vc1.title = "Home"
        let vc2 = UIFactory.repositoryListViewController()
        vc2.title = "Search"
        let vc3 = workoutsVC
        vc3.navigationItem.title = "Workouts"
        let vc4 = MoreVC()
        vc4.title = "More"
        self.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
    }
    
}
