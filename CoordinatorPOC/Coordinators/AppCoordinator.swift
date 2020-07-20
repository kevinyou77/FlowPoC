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

	var rootViewController: UIViewController {
		navigationController
	}
	private let navigationController: UINavigationController = UINavigationController()
	
	typealias Output = Void
	
	var onFinishFlow: ((void) -> Void)?
	
	var greenCoordinator: GreenScreenCoordinator?
	var blueCoordinator: BlueScreenCoordinator?
	
	var screen: PINScreen?
	
	init() {

		greenCoordinator = GreenScreenCoordinator(navigationController: navigationController)
//		blueCoordinator = BlueScreenCoordinator()
		
		self.configureFinishFlow()
		self.greenCoordinator?.finishFlow = self.onFinishFlow
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
			
			self.blueCoordinator = nil
		}
		
		pinNode.onGreenButtonTap = {
			
			self.greenCoordinator = nil
			self.greenCoordinator = GreenScreenCoordinator(navigationController: self.navigationController)
			self.greenCoordinator?.finishFlow = self.onFinishFlow
			self.greenCoordinator?.start()
		}
		
		pinNode.onFinish = { _ in
			
			print("noice")
		}
		
		return pinNode
	}
	
	private func configureFinishFlow() {
		
		self.onFinishFlow = { _ in
			self.navigationController.popToRootViewController(animated: true)
		}
	}
}
