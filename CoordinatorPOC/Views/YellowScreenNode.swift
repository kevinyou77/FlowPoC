//
//  YellowScreenNode.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 20/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import AsyncDisplayKit

class YellowScreenNode: ASDisplayNode {
	
	var onFinish: ((void) -> Void)?
	
	private let viewModel: PINViewModel
	
	private let someText: ASTextNode
	
	private let popButton: ASButtonNode
	
	init(viewModel: PINViewModel) {
		
		self.viewModel = viewModel
		
		self.someText = ASTextNode()
		self.popButton = ASButtonNode()

		super.init()
		
		automaticallyManagesSubnodes = true
		self.backgroundColor = .yellow
		self.view.backgroundColor = .yellow
		
		configureText()
		popButton.addTarget(self, action: #selector(finish), forControlEvents: .touchUpInside)
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		
		popButton.setTitle("Pop to root", with: .boldSystemFont(ofSize: 20), with: .red, for: .normal)
		
		let stack = ASStackLayoutSpec(
			direction: .vertical,
			spacing: 2,
			justifyContent: .center,
			alignItems: .center,
			children: [
				someText,
				popButton
			]
		)
		
		stack.style.width = ASDimensionMake(500)
		stack.style.height = ASDimensionMake(500)
		
		return stack
	}
	
	private func configureText() {
		
		someText.attributedText = NSAttributedString(string: "some text")
		someText.backgroundColor = .brown
	}
	
	@objc private func finish() {
		
		self.onFinish?(())
	}
}
