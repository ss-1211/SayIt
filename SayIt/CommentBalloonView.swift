//
//  CommentBalloonView.swift
//  SayIt
//
//  Created by 佐々木駿 on 2019/08/27.
//  Copyright © 2019 shun.sasaki. All rights reserved.
//

import UIKit

class CommentBalloonView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        let line = UIBezierPath()//吹き出しの口部分を描画
        UIColor(red: 204/255, green: 204/255, blue: 255/255, alpha: 1).setFill()
        UIColor.clear.setStroke()
        line.move(to: CGPoint(x: 0, y: 10))
        line.addQuadCurve(to: CGPoint(x: 20, y: -10), controlPoint: CGPoint(x: 10, y: 20))
        line.addQuadCurve(to: CGPoint(x: 5, y: 20), controlPoint: CGPoint(x: 13, y: 30))
        line.close()
        line.fill()
        line.stroke()
    }

}
