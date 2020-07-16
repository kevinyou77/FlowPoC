//
//  GreenScreenCoordinator.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 15/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import UIKit

class GreenScreenCoordinator: Coordinator {
	
	var finishFlow: ((void) -> Void)?
	
	var rootViewController = UINavigationController()
	
	var screen: GreenScreen?
	
	func start() {
		
		let greenScreenNode = GreenScreenNode(viewModel: PINViewModel())
		greenScreenNode.onFinish = self.finishFlow
		let greenScreen = GreenScreen(mainNode: greenScreenNode)
		Router.shared.push(greenScreen.viewController, on: self)
	}
}
