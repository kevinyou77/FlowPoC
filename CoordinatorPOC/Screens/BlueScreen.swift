//
//  BlueScreen.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 15/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import Foundation

class BlueScreen: ScreenFactory {

	typealias ViewControllerType = BlueScreenViewController
	typealias MainNode = BlueScreenNode
	
	var identifier: String {
		"PIN"
	}
	
	var viewController: BlueScreenViewController
	
	required init(mainNode: BlueScreenNode) {
		
		self.viewController = BlueScreenViewController()
	}
}
