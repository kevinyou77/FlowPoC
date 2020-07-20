//
//  GreenScreen.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 15/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import UIKit

class GreenScreen: ScreenFactory {
	
	typealias ViewControllerType = UIViewController
	typealias MainNode = GreenScreenNode
	
	var identifier: String {
		"PIN"
	}
	
	var viewController: UIViewController
	
	required init(mainNode: GreenScreenNode) {
		
		self.viewController = GreenScreenViewController(node: mainNode)
	}
}
