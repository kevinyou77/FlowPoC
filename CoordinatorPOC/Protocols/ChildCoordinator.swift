//
//  ChildCoordinator.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 20/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import UIKit

protocol ChildCoordinator {
	
	var rootViewController: UIViewController? { get }
	
	func start()
}
