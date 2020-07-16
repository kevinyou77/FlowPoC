//
//  PINScreen.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 15/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import Foundation

class PINScreen: ScreenFactory {
	
	typealias ViewControllerType = PINViewController
	typealias MainNode = MainPINNode
	
	var identifier: String {
		"PIN"
	}
	
	var viewController: PINViewController
	
	required init(mainNode: MainPINNode) {
		
		self.viewController = PINViewController(mainNode: mainNode)
	}
}
