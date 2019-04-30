//
//  ViewController.swift
//  draw-something
//
//  Created by imac on 4/30/19.
//  Copyright © 2019 JeguLabs. All rights reserved.
//

import UIKit


class Canvas: UIView {
    
    override func draw(_ rect: CGRect) {
        // Feels custom drawing
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // Lines
        // Test
//        let startPoint = CGPoint(x: 0, y: 0)
//        let endPoint = CGPoint(x: 100, y: 100)
//
//        context.move(to: startPoint)
//        context.addLine(to: endPoint)
//
       
        // Swag
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(10)
        context.setLineCap(.butt)

        lines.forEach { (line) in
            for (i, p) in line.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }
        
        context.strokePath()
        
    }
    
//    var line = [CGPoint]()
    var lines = [[CGPoint]]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    // Track the finger
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
//        print(point)
//        line.append(point)
        
        guard var lastLine = lines.popLast() else { return }
        lastLine.append(point)
        lines.append(lastLine)
        
        setNeedsDisplay()
    }
}

class ViewController: UIViewController {
    
    let canvas = Canvas()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
      
    }


}

