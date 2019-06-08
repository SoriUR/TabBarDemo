import UIKit
import RAMAnimatedTabBarController
 
class CustomTabBar: RAMAnimatedTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let green = GreenVC()
        let yellow = YellowVC()
        let red = RedVC()
        
        let item1 = RAMAnimatedTabBarItem(title: "Red", image: #imageLiteral(resourceName: "Image-2"), tag: 0)
        item1.animation = RAMFlipLeftTransitionItemAnimations()
        
        let item2 = RAMAnimatedTabBarItem(title: "Green", image: #imageLiteral(resourceName: "Image-1"), tag: 1)
        item2.animation = RAMFlipTopTransitionItemAnimations()
        
        let item3 = RAMAnimatedTabBarItem(title: "Yellow", image: #imageLiteral(resourceName: "Image-1"), tag: 2)
        item3.animation = CustomAnimation()
        
        green.tabBarItem = item1
        yellow.tabBarItem = item2
        red.tabBarItem = item3
        
        viewControllers = [green, yellow, red]
    }
}

class GreenVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .green
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tabBarItem.badgeValue = "3"
        tabBarItem.badgeColor = .blue
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        tabBarItem.badgeValue = nil
    }
}

class YellowVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
    }
}

class RedVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }    
}


class CustomAnimation : RAMItemAnimation {
    
    override func playAnimation(_ icon: UIImageView, textLabel: UILabel) {
        textLabel.textColor = .red
        
        icon.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        UIView.animate(withDuration: 0.3) {
            icon.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    override func deselectAnimation(_ icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor, defaultIconColor: UIColor) {
        textLabel.textColor = .blue

        icon.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        UIView.animate(withDuration: 0.3) {
            icon.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }
    }
}
