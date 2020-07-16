
import AsyncDisplayKit

class BlueScreenViewController: ASViewController<ASDisplayNode> {
	
	override init() {
		
		super.init()
		self.view.backgroundColor = .blue
		
		self.navigationItem.title = "Blue"
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
