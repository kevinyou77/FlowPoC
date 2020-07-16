//
//  ScreenFactory.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 15/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import Foundation

protocol ScreenFactory: class {
	
	associatedtype ViewControllerType
	associatedtype MainNode
	
	var identifier: String { get }
	var viewController: ViewControllerType { get set }
	
	init(mainNode: MainNode)
}
