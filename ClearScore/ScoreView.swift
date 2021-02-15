//
//  ScoreView.swift
//  ClearScore
//
//  Created by Lshiva on 14/02/2021.
//

import UIKit

class ScoreView: UIView {
        
    var shapeLayer: CAShapeLayer!
    let gradientLayer = CAGradientLayer()
    var timer: Timer!
    
    /**
     * TITLE LABEL
     */
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Config.General.titleTxt
        label.textAlignment = .center
        label.font = UIFont(name: Config.General.fontName, size: 18)
        label.textColor = .black
        return label

    }()
    
    /**
     * SCORE LABEL
     */
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: Config.General.fontName, size: 120)
        label.textColor = Config.Color.scoreFont
        return label
    }()
    
     /**
     * SUBTITLE LABEL
     */
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Config.General.subTitletxt
        label.textAlignment = .center
        label.font = UIFont(name: Config.General.fontName, size: 18)
        label.textColor = .black
        return label
    }()
    /**
     * create circle shape
     */
    private func createCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor, radius: CGFloat, lineWidth: CGFloat) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = lineWidth
        layer.fillColor = UIColor.clear.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        layer.position = self.center
        return layer
    }
    /**
     * INITIALISERS
     */
    init() {
        super.init(frame: CGRect.zero)
        self.frame = UIScreen.main.bounds
        self.backgroundColor = Config.Color.background
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /**
     * CUSTOM METHODS
     */
    public func startAnimation() {
        beginanimation()
    }

    public func setup() {
        setupCircleLayers()
        setupUILabels()
    }
    
    //UIl
    private func setupUILabels() {
        setupScoreLbl()
        setupTitleLbl()
        setupsubtitleLbl()
    }
    
    //circle layers
    private func setupCircleLayers() {
        self.setupOuterCircleLayer()
        self.setupProgessCircleLayer()
    }
    
    //score label
    private func setupScoreLbl() {
        self.addSubview(scoreLabel)
        self.scoreLabel.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 100)
        self.scoreLabel.center = self.center
    }
    
    //title 1
    private func setupTitleLbl() {
        self.addSubview(titleLabel)
        self.titleLabel.frame = CGRect(x: 0, y: 0, width: self.scoreLabel.frame.width, height: 100)
        var startingPoint = self.center
        startingPoint.y += -70
        self.titleLabel.center = startingPoint
    }
    
    //title 2
    private func setupsubtitleLbl() {
        self.addSubview(subTitleLabel)
        self.subTitleLabel.frame = CGRect(x: 0, y: 0, width: self.scoreLabel.frame.width, height: 100)
        var startingPoint = self.center
        startingPoint.y += 70
        self.subTitleLabel.center = startingPoint
    }
    
    //Outer circle layer
    private func setupOuterCircleLayer() {
        let trackLayer = createCircleShapeLayer(strokeColor: Config.Color.trackStroke, fillColor: .clear, radius: 150, lineWidth: 3)
        self.layer.addSublayer(trackLayer)
    }
    
    // set up circle layer
    private func setupProgessCircleLayer() {
        self.shapeLayer = createCircleShapeLayer(strokeColor: Config.Color.trackStroke, fillColor: .clear, radius: 140, lineWidth: 5)
        self.shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        self.shapeLayer.strokeEnd = 0
        self.gradientLayer.mask = shapeLayer
        self.gradientLayer.frame = self.frame
        self.gradientLayer.contentsScale = UIScreen.main.scale
        self.gradientLayer.colors = [Config.Color.Gradientfrom.cgColor, Config.Color.Gradientto.cgColor]
        self.layer.addSublayer(gradientLayer)
    }

    // update credit score
    public func update(score value: CGFloat) {
        DispatchQueue.main.async() {
            if (value != 1.0) {
                self.alpha = 1.0
                self.shapeLayer.strokeEnd = CGFloat(value / 1000)
                self.scoreLabel.text = "\(Int(value))"
            } else {
                UIView.animate(withDuration: 3.0, animations: {
                    self.shapeLayer.strokeEnd = value
                    self.scoreLabel.text = "\(Int(value * 100))"
                    self.alpha = 0
                }, completion: { _ in
                    self.removeFromSuperview()
                    self.resetAll()
                })
            }
        }
    }
    
    //reset score label text
    fileprivate func resetAll() {
        DispatchQueue.main.async() {
            self.scoreLabel.text = "0"
        }
    }
    
    //force reload score, if needed
    public func remove() {
        DispatchQueue.main.async() {
            self.resetAll()
            self.removeFromSuperview()
        }
    }
    
    // start animation
    fileprivate func beginanimation() {
        self.shapeLayer.strokeEnd = 0
        self.alpha = 1.0
        superview?.addSubview(self)
    }
    
    // TODO: SCORE INCREMENT/COUNT ANIMATION
    // WOULD BE GREAT TO ADD PARABOLIC CURVE LIKE EASEIONOUT
}
