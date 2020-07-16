//
//  MainPINNode.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 15/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import AsyncDisplayKit

class MainPINNode: ASDisplayNode {
	
	var onFinish: ((void) -> Void)?
	
	var onBlueButtonTap: (() -> Void)?
	var onGreenButtonTap: (() -> Void)?
	
	private let viewModel: PINViewModel
	
	private let someText: ASTextNode
	
	private let blueScreenButton: ASButtonNode
	private let greenScreenButton: ASButtonNode
	
	init(viewModel: PINViewModel) {
		
		self.viewModel = viewModel
		
		self.someText = ASTextNode()
		self.blueScreenButton = ASButtonNode()
		self.greenScreenButton = ASButtonNode()
		
		super.init()
		
		automaticallyManagesSubnodes = true
		self.backgroundColor = .red
		self.view.backgroundColor = .red
		
		configureText()
		configureBlueScreenButton()
		configureGreenScreenButton()
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		
		let stack = ASStackLayoutSpec(
			direction: .vertical,
			spacing: 2,
			justifyContent: .center,
			alignItems: .center,
			children: [
				someText,
				blueScreenButton,
				greenScreenButton
			]
		)
		
		stack.style.width = ASDimensionMake(500)
		stack.style.height = ASDimensionMake(500)
		
		return stack
	}
	
	private func configureBlueScreenButton() {
		
		blueScreenButton.setAttributedTitle(NSAttributedString(string: "blue"), for: .normal)
		blueScreenButton.backgroundColor = .white
		blueScreenButton.addTarget(self, action: #selector(blueScreenTap), forControlEvents: .touchUpInside)
	}
	
	private func configureGreenScreenButton() {
		
		greenScreenButton.setAttributedTitle(NSAttributedString(string: "green"), for: .normal)
		greenScreenButton.backgroundColor = .white
		greenScreenButton.addTarget(self, action: #selector(greenScreenTap), forControlEvents: .touchUpInside)
	}
	
	@objc private func blueScreenTap() {
		
		self.onBlueButtonTap?()
	}
	
	@objc private func greenScreenTap() {
		
		self.onGreenButtonTap?()
	}
	
	private func configureText() {
		
		someText.attributedText = NSAttributedString(string: "some text")
		someText.backgroundColor = .brown
	}
}
