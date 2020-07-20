import AsyncDisplayKit

class YellowScreenViewController: ASViewController<ASDisplayNode> {
	
	init(node: YellowScreenNode) {

		super.init(node: node)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
