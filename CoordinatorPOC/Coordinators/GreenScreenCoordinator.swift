//
//  GreenScreenCoordinator.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 15/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import UIKit

class GreenScreenCoordinator: ChildCoordinator {
	
	var finishFlow: ((void) -> Void)?
	
	var rootViewController: UIViewController? {
		navigationController
	}
	
	let navigationController: UINavigationController
	
	var screen: GreenScreen?
	
	private var yellowCoordinator: YellowScreenCoordinator?
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		
		let greenScreenNode = GreenScreenNode(viewModel: PINViewModel())
		greenScreenNode.onFinish = { _ in
			
			self.yellowCoordinator = YellowScreenCoordinator(navigationController: self.navigationController)
			self.yellowCoordinator!.finishFlow = self.finishFlow
			self.yellowCoordinator!.start()
		}
		let greenScreen = GreenScreen(mainNode: greenScreenNode)
		Router.shared.push(greenScreen.viewController, on: self)
	}
}
