//
//  YellowScreen.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 20/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import UIKit

class YellowScreen: ScreenFactory {
	
	typealias ViewControllerType = UIViewController
	typealias MainNode = YellowScreenNode
	
	var identifier: String {
		"PIN"
	}
	
	var viewController: UIViewController
	
	required init(mainNode: YellowScreenNode) {
		
		self.viewController = YellowScreenViewController(node: mainNode)
	}
}
