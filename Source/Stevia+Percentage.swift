//
//  Stevia+Percentage.swift
//  Stevia
//
//  Created by Sacha Durand Saint Omer on 21/01/2017.
//  Copyright © 2017 Sacha Durand Saint Omer. All rights reserved.
//

import UIKit

public struct SteviaPercentage {
    let value: CGFloat
}

postfix operator %
public postfix func % (v: CGFloat) -> SteviaPercentage {
    return SteviaPercentage(value: v)
}

public extension UIView {
    /**
     Adds an Autolayout constraint for sizing the view.

     ```
     image.size(100)
     image.size(100%)

     // is equivalent to

     image.steviaWidth(100).steviaHeight(100)
     ```

     - Returns: Itself, enabling chaining,

     */
    @discardableResult
    func size(_ p: SteviaPercentage) -> UIView {
        steviaWidth(p)
        steviaHeight(p)
        return self
    }

    /**
     Adds an Autolayout constraint for setting the view's width.

     ```
     image.steviaWidth(100)
     image.steviaWidth(<=100)
     image.steviaWidth(>=100)
     image.steviaWidth(100%)
     ```

     - Returns: Itself, enabling chaining,

     */
    @discardableResult
    func steviaWidth(_ p: SteviaPercentage) -> UIView {
        if let spv = superview {
            Width == p.value % spv.Width
        }
        return self
    }

    /**
     Adds an Autolayout constraint for setting the view's height.

     ```
     image.steviaHeight(100)

     // is equivalent to

     image ~~ 100

     // Flexible margins
     image.steviaHeight(<=100)
     image.steviaHeight(>=100)
     image.steviaHeight(100%)
     ```

     - Returns: Itself, enabling chaining,

     */
    @discardableResult
    func steviaHeight(_ p: SteviaPercentage) -> UIView {
        if let spv = superview {
            Height == p.value % spv.Height
        }
        return self
    }

    /** Sets the top margin for a view.

     Example Usage :

     label.steviaTop(20)
     label.steviaTop(<=20)
     label.steviaTop(>=20)
     label.steviaTop(20%)

     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func steviaTop(_ p: SteviaPercentage) -> UIView {
        if let spv = superview {
            Top == p.value % spv.Bottom
        }
        return self
    }

    /** Sets the left margin for a view.

     Example Usage :

     label.steviaLeft(20)
     label.steviaLeft(<=20)
     label.steviaLeft(>=20)
     label.steviaLeft(20%)

     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func steviaLeft(_ p: SteviaPercentage) -> UIView {
        if let spv = superview {
            Left == p.value % spv.Right
        }
        return self
    }

    /** Sets the right margin for a view.

     Example Usage :

     label.steviaRight(20)
     label.steviaRight(<=20)
     label.steviaRight(>=20)
     label.steviaRight(20%)

     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func steviaRight(_ p: SteviaPercentage) -> UIView {
        if let spv = superview {
            if p.value == 100 {
                Right == spv.Left
            } else {
                Right == (100 - p.value) % spv.Right
            }
        }
        return self
    }

    /** Sets the bottom margin for a view.

     Example Usage :

     label.steviaBottom(20)
     label.steviaBottom(<=20)
     label.steviaBottom(>=20)
     label.steviaBottom(20%)

     - Returns: Itself for chaining purposes
     */
    @discardableResult
    func steviaBottom(_ p: SteviaPercentage) -> UIView {
        if let spv = superview {
            if p.value == 100 {
                Bottom == spv.Top
            } else {
                Bottom == (100 - p.value) % spv.Bottom
            }
        }
        return self
    }
}
