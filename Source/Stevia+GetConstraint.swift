//
//  Stevia+GetConstraint.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 12/03/16.
//  Copyright © 2016 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public extension UIView {
    /** Gets the left constraint if found.

     Example Usage for changing left margin of a label :
     ```
     label.steviaLeftConstraint?.constant = 10

     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The left NSLayoutConstraint if found.
     */
    var steviaLeftConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .left)
    }

    /** Gets the right constraint if found.

     Example Usage for changing right margin of a label :

     ```
     label.steviaRightConstraint?.constant = 10

     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The right NSLayoutConstraint if found.
     */
    var steviaRightConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .right)
    }

    /** Gets the top constraint if found.

     Example Usage for changing top margin of a label :

     ```
     label.steviaTopConstraint?.constant = 10

     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The top NSLayoutConstraint if found.
     */
    var steviaTopConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .top)
    }

    /** Gets the bottom constraint if found.

     Example Usage for changing bottom margin of a label :

     ```
     label.steviaBottomConstraint?.constant = 10

     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The bottom NSLayoutConstraint if found.
     */
    var steviaBottomConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .bottom)
    }

    /** Gets the height constraint if found.

     Example Usage for changing height property of a label :

     ```
     label.steviaHeightConstraint?.constant = 10

     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The height NSLayoutConstraint if found.
     */
    var steviaHeightConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .height)
    }

    /** Gets the width constraint if found.

     Example Usage for changing width property of a label :

     ```
     label.steviaWidthConstraint?.constant = 10

     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The width NSLayoutConstraint if found.
     */
    var steviaWidthConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .width)
    }

    /** Gets the trailing constraint if found.

     Example Usage for changing width property of a label :

     ```
     label.steviaTrailingConstraint?.constant = 10

     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The trailing NSLayoutConstraint if found.
     */
    var steviaTrailingConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .trailing)
    }

    /** Gets the leading constraint if found.

     Example Usage for changing width property of a label :

     ```
     label.steviaLeadingConstraint?.constant = 10

     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The leading NSLayoutConstraint if found.
     */
    var steviaLeadingConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .leading)
    }

    /** Gets the centerX constraint if found.

     Example Usage for changing width property of a label :

     ```
     label.steviaCenterXConstraint?.constant = 10

     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The width NSLayoutConstraint if found.
     */
    var steviaCenterXConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .centerX)
    }

    /** Gets the centerY constraint if found.

     Example Usage for changing width property of a label :

     ```
     label.steviaCenterYConstraint?.constant = 10

     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The width NSLayoutConstraint if found.
     */
    var steviaCenterYConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .centerY)
    }
}

func constraintForView(_ v: UIView, attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
    func lookForConstraint(in view: UIView?) -> NSLayoutConstraint? {
        guard let constraints = view?.constraints else {
            return nil
        }
        for c in constraints {
            if let fi = c.firstItem as? NSObject, fi == v && c.firstAttribute == attribute {
                return c
            } else if let si = c.secondItem as? NSObject, si == v && c.secondAttribute == attribute {
                return c
            }
        }
        return nil
    }

    // Width and height constraints added via widthAnchor/heightAnchors are
    // added on the view itself.
    if attribute == .width || attribute == .height {
        return lookForConstraint(in: v.superview) ?? lookForConstraint(in: v)
    }

    // Look for constraint on superview.
    return lookForConstraint(in: v.superview)
}
