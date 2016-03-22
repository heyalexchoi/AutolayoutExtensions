//
//  UIViewExtensions.swift
//  AutolayoutExtensions
//
//  Created by Alex Choi on 3/22/16.
//  Copyright © 2016 CHOI. All rights reserved.
//


public extension UIView {
    
    public func addConstraintsWithVisualFormatStrings(formatStrings: [String], options: NSLayoutFormatOptions = [], metrics: [String: AnyObject] = [:], views: [String: AnyObject]) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        
        for formatString in formatStrings {
            constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat(formatString, options: options, metrics: metrics, views: views))
        }
        
        addConstraints(constraints)
        return constraints
    }
    
    public func addSubviewsWithAutoLayout(views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
    
    /** Insets are applied as constants. bottom and trailing constants are applied in negative to produce an inset effect. */
    public func anchorAllEdgesToView(view: UIView, topInset: CGFloat = 0, leadingInset: CGFloat = 0, bottomInset: CGFloat = 0, trailingInset: CGFloat = 0) -> (top: NSLayoutConstraint, leading: NSLayoutConstraint, bottom: NSLayoutConstraint, trailing: NSLayoutConstraint) {
        return (top: anchorTopToTopEdgeOfView(view, constant: topInset), leading: anchorLeadingToLeadingEdgeOfView(view, constant: leadingInset), bottom: anchorBottomToBottomEdgeOfView(view, constant: -bottomInset), trailing: anchorTrailingToTrailingEdgeOfView(view, constant: -trailingInset))
    }
    
    /** Insets are applied as constants. trailing is applied in negative to produce an inset effect */
    public func anchorLeadingAndTrailingEdgesToView(view: UIView, leadingInset: CGFloat = 0, trailingInset: CGFloat = 0) -> (leading: NSLayoutConstraint, trailing: NSLayoutConstraint) {
        return (leading: anchorLeadingToLeadingEdgeOfView(view, constant: leadingInset), trailing: anchorTrailingToTrailingEdgeOfView(view, constant: -trailingInset))
    }
    
    /** Left and right insets are ignored. */
    public func anchorTopAndBottomEdgesToView(view: UIView, topInset: CGFloat = 0, bottomInset: CGFloat = 0) -> (top: NSLayoutConstraint, bottom: NSLayoutConstraint) {
        return (top: anchorTopToTopEdgeOfView(view, constant: topInset), bottom: anchorBottomToBottomEdgeOfView(view, constant: -bottomInset))
    }
    
    public func anchorWidthAndHeightToSize(size: CGSize) -> (width: NSLayoutConstraint, height: NSLayoutConstraint) {
        return (width: anchorWidthToConstant(size.width), height: anchorHeightToConstant(size.height))
    }
    
    public func anchorHeightToConstant(height: CGFloat) -> NSLayoutConstraint {
        let height = heightAnchor.constraintEqualToConstant(height)
        height.active = true
        return height
    }
    
    public func anchorWidthToConstant(width: CGFloat) -> NSLayoutConstraint {
        let width = widthAnchor.constraintEqualToConstant(width)        
        width.active = true
        return width
    }
    
    public func anchorWidthToViewWidth(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: multiplier, constant: constant)
        constraint.active = true
        return constraint
    }
    
    public func anchorTopToTopEdgeOfView(view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let top = topAnchor.constraintEqualToAnchor(view.topAnchor, constant: constant)
        top.active = true
        return top
    }
    
    public func anchorBottomToBottomEdgeOfView(view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let bottom = bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: constant)
        bottom.active = true
        return bottom
    }
    
    public func anchorLeftToLeftEdgeOfView(view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let left = leftAnchor.constraintEqualToAnchor(view.leftAnchor, constant: constant)
        left.active = true
        return left
    }
    
    public func anchorLeadingToLeadingEdgeOfView(view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let leading = leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: constant)
        leading.active = true
        return leading
    }
    
    public func anchorLeadingToTrailingEdgeOfView(view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = leadingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: constant)
        constraint.active = true
        return constraint
    }
    
    public func anchorTrailingToLeadingEdgeOfView(view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = trailingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: constant)
        constraint.active = true
        return constraint
    }
    
    public func anchorRightToRightEdgeOfView(view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let right = rightAnchor.constraintEqualToAnchor(view.rightAnchor, constant: constant)
        right.active = true
        return right
    }
    
    public func anchorTrailingToTrailingEdgeOfView(view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let trailing = trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: constant)
        trailing.active = true
        return trailing
    }
    
    public func anchorBottomToTopEdgeOfView(view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraintEqualToAnchor(view.topAnchor, constant: constant)
        constraint.active = true
        return constraint
    }
    
    public func anchorTopToBottomEdgeOfView(view: UIView, constant: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = topAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: constant)
        constraint.active = true
        return constraint
    }
    
    public func anchorCenterToCenterOfView(view: UIView) -> (centerX: NSLayoutConstraint, centerY: NSLayoutConstraint) {
        return (centerX: anchorCenterXToCenterXOfView(view), centerY: anchorCenterYToCenterYOfView(view))
    }
    
    public func anchorCenterYToCenterYOfView(view: UIView) -> NSLayoutConstraint {
        let y = centerYAnchor.constraintEqualToAnchor(view.centerYAnchor)
        y.active = true
        return y
    }
    
    public func anchorCenterXToCenterXOfView(view: UIView) -> NSLayoutConstraint {
        let x = centerXAnchor.constraintEqualToAnchor(view.centerXAnchor)
        x.active = true
        return x
    }
    
}

