//
//  YellowViewController.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 20/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import UIKit

class YellowScreenCoordinator: Coordinator {
	
	var finishFlow: ((void) -> Void)?
	
	var rootViewController: UIViewController {
		navigationController
	}
	
	private var navigationController: UINavigationController
	
	var screen: YellowScreen?
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		
		let yellowScreenNode = YellowScreenNode(viewModel: PINViewModel())
		yellowScreenNode.onFinish = self.finishFlow
		let yellowScreen = YellowScreen(mainNode: yellowScreenNode)

		Router.shared.push(yellowScreen.viewController, on: self)
	}
}
