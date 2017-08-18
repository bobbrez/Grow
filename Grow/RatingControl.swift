//
//  RatingControl.swift
//  Grow
//
//  Created by Bob Breznak on 8/18/17.
//  Copyright © 2017 Bob Breznak. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    // MARK: Properties

    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    private var ratingsButtons = [UIButton]()
    
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButtons()
    }
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        guard let index = ratingsButtons.index(of: button) else {
            fatalError("Non-ratings button tapped")
        }
        
        rating = index + 1
        print("👍 Rating set to: \(rating)")
    }
    
    
    // MARK: Private Methods
    
    private func setupButtons() {
        // clear any existing buttons
        for button in ratingsButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingsButtons.removeAll()
        
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
            let button = UIButton()
            button.backgroundColor = UIColor.red
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            button.addTarget(self, action:
                #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            addArrangedSubview(button)
            
            ratingsButtons.append(button)
        }
        
        updateButtonSelectionStates()
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in ratingsButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
}
