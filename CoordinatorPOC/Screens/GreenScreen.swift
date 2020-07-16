//
//  GreenScreen.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 15/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import Foundation

class GreenScreen: ScreenFactory {
	
	typealias ViewControllerType = GreenScreenViewController
	typealias MainNode = GreenScreenNode
	
	var identifier: String {
		"PIN"
	}
	
	var viewController: GreenScreenViewController
	
	required init(mainNode: GreenScreenNode) {
		
		self.viewController = GreenScreenViewController(node: mainNode)
	}
}
