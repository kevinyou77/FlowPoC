//
//  BlueScreenCoordinator.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 15/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import UIKit

class BlueScreenCoordinator: Coordinator {
	
	var rootViewController: UIViewController {
		navigationController
	}
	
	private let navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		
		Router.shared.present(BlueScreenViewController(), on: self)
	}
}
