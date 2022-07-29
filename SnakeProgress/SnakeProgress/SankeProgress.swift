//
//  SankeProgress.swift
//  SnakeProgress
//
//  Created by Moeen Arif on 29/07/2022.
//

import Foundation
import UIKit

public class CircularView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private var endingAnle: Int = 320
    private var startingAngle : Int = 90
    private var initialWidth : CGFloat = 5.0
    private var incrementalWidth : CGFloat = 0.05
    private var curveAngle: Int = 310
    private var circularProgress: CGFloat = 0
    var empColor: UIColor = UIColor(red: 91/255, green: 175/255, blue: 158/255, alpha: 1.00) {
        didSet {
            self.configureCircularView(progress: circularProgress, filledColor: trackFillColor , emptyColor: empColor)
        }
    }
    
    var trackFillColor: UIColor = UIColor.init(red: 0.00, green: 0.51, blue: 0.41, alpha: 1.00) {
        didSet {
            self.configureCircularView(progress: circularProgress, filledColor: trackFillColor , emptyColor: empColor)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    public func configureCircularView(progress: CGFloat, filledColor: UIColor, emptyColor: UIColor) {

        for layer in self.layer.sublayers ?? [] {
           if layer.isKind(of: CAShapeLayer.self) {
              layer.removeFromSuperlayer()
           }
        }
        
        endingAnle = 320
        startingAngle = 90
        initialWidth = 5.0
        incrementalWidth = 0.05
        curveAngle = 310
        circularProgress = 0
        let totalCircle = endingAnle - startingAngle
        circularProgress = progress
        let percentage = (CGFloat(totalCircle)/100.0) * progress
        let range = CGFloat(startingAngle) + percentage
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = self.bounds.height/3
        for index in startingAngle...endingAnle {
         
            let shapelayer = CAShapeLayer()
            initialWidth = initialWidth + incrementalWidth
            let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: self.degreesToRadians(CGFloat(index)), endAngle: self.degreesToRadians(CGFloat(index+1)), clockwise: true)
            shapelayer.path = circularPath.cgPath
            if index <= Int(range) {
                shapelayer.strokeColor = filledColor.cgColor
            }
            else {
                shapelayer.strokeColor = emptyColor.cgColor
            }
            shapelayer.fillColor = UIColor.clear.cgColor
            shapelayer.lineWidth = CGFloat(initialWidth)
            
            if index == startingAngle || index > curveAngle {
                
                shapelayer.lineCap = .round
            }
            else {
                shapelayer.lineCap = .square
            }
            self.layer.addSublayer(shapelayer)
        }
    }
    
    private func degreesToRadians(_ degrees: CGFloat) -> CGFloat {
      return CGFloat.pi * degrees/180.0
    }
}

