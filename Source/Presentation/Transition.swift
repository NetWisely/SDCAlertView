import UIKit

class Transition: NSObject, UIViewControllerTransitioningDelegate {

    private let visualStyle: AlertVisualStyle

    init(visualStyle: AlertVisualStyle) {
        self.visualStyle = visualStyle
    }

    func presentationController(forPresented presented: UIViewController,
        presenting: UIViewController?, source: UIViewController)
        -> UIPresentationController?
    {
        return PresentationController(presentedViewController: presented,
                                      presenting: presenting,
                                      dimmingViewColor: self.visualStyle.dimmingColor)
    }

    func animationController(forPresented presented: UIViewController,
        presenting: UIViewController, source: UIViewController)
        -> UIViewControllerAnimatedTransitioning?
    {
        if self.visualStyle.alertStyle == .actionSheet {
            return nil
        }

        return AnimationController(presentation: true)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.visualStyle.alertStyle == .alert ? AnimationController(presentation: false) : nil
    }
}
