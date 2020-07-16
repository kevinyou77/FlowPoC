//
//  AppCoordinator.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 15/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import UIKit

typealias void = ()

class AppCoordinator: Coordinator, CoordinatorOutput {
	
	typealias Output = Void
	
	var onFinishFlow: ((void) -> Void)?
	
	var rootViewController = UINavigationController()
	
	let greenCoordinator: GreenScreenCoordinator
	let blueCoordinator: BlueScreenCoordinator
	
	var screen: PINScreen?
	
	init() {

		greenCoordinator = GreenScreenCoordinator()
		blueCoordinator = BlueScreenCoordinator()
		
		self.configureFinishFlow()
		self.greenCoordinator.finishFlow = self.onFinishFlow
	}
	
	func start() {
		
		let mainPINNode = makePINNode()
		let pinScreen = PINScreen(mainNode: mainPINNode)
		
		// hold reference to pin screen so it doesnt deallocate
		self.screen = pinScreen
		
		// Or Router.shared.push(pinScreen, on: self)
		Router.shared.push(pinScreen.viewController, on: self)
	}
	
	private func makePINNode() -> MainPINNode {
		
		let viewModel = PINViewModel()
		let pinNode = MainPINNode(viewModel: viewModel)
		
		pinNode.onBlueButtonTap =  {
			
			self.blueCoordinator.start()
			Router.shared.present(self.blueCoordinator.rootViewController, on: self)
		}
		
		pinNode.onGreenButtonTap = {
			
			self.greenCoordinator.start()
			Router.shared.present(self.greenCoordinator.rootViewController, on: self)
		}
		
		pinNode.onFinish = { [weak self] _ in
			
			self?.onFinishFlow?(())
		}
		
		return pinNode
	}
	
	private func configureFinishFlow() {
		
		self.onFinishFlow = { _ in
			
			print("flow completed")
		}
	}
}
