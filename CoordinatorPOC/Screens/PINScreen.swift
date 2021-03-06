//
//  PINScreen.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 15/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import UIKit

class PINScreen: ScreenFactory {
	
	typealias ViewControllerType = UIViewController
	typealias MainNode = MainPINNode
	
	var identifier: String {
		"PIN"
	}
	
	var viewController: UIViewController
	
	required init(mainNode: MainPINNode) {
		
		self.viewController = PINViewController(mainNode: mainNode)
	}
}
