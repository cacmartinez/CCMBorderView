//
//  Copyright 2014 Carlos Compean.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation
import UIKit

@IBDesignable class CCMBorderView: UIView{
    struct Border : RawOptionSetType {
        typealias RawValue = UInt
        private var value: UInt = 0
        init(_ value: UInt) { self.value = value }
        init(rawValue value: UInt) { self.value = value }
        init(nilLiteral: ()) { self.value = 0 }
        static var allZeros: Border { return self(0) }
        static func fromMask(raw: UInt) -> Border { return self(raw) }
        var rawValue: UInt { return self.value }
        
        static var None: Border { return self(0) }
        static var Bottom: Border   { return self(1 << 0) }
        static var Left: Border  { return self(1 << 1) }
        static var Right: Border   { return self(1 << 2) }
        static var Top: Border  { return self(1 << 3) }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var borderBottom: Bool = false {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var borderRight: Bool = false {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var borderLeft: Bool = false {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var borderTop: Bool = false {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var tlCornerRadius: CGFloat = 0.0 {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var trCornerRadius: CGFloat = 0.0 {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var blCornerRadius: CGFloat = 0.0 {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var brCornerRadius: CGFloat = 0.0 {
        didSet{
            updateView()
        }
    }
    
    init(frame: CGRect, borders: Border, radius:CGFloat, color:UIColor, borderWidth:CGFloat){
        super.init(frame: frame)
        if (borders.value & Border.Bottom.value != 0){
            self.borderBottom = true
        }
        if (borders.value & Border.Left.value != 0){
            self.borderLeft = true
        }
        if (borders.value & Border.Right.value != 0){
            self.borderRight = true
        }
        if (borders.value & Border.Top.value != 0){
            self.borderTop = true
        }
        self.cornerRadius = radius
        self.borderColor = color
        self.borderWidth = borderWidth
        self.updateView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        self.updateView()
    }
    
    
    
    func removePreviousBorders(){
        if self.layer.sublayers != nil{
            var toBeRemoved:[CALayer]? = []
            for sublayer in self.layer.sublayers as [CALayer]! {
                if (sublayer.name != nil && sublayer.name == "Border") {
                    //sublayer.removeFromSuperlayer();
                    toBeRemoved?.append(sublayer)
                }
            }
            for sublayer in toBeRemoved!{
                sublayer.removeFromSuperlayer()
            }
            toBeRemoved = nil;
        }
    }
    
    func updateView(){
        self.removePreviousBorders();
        layer.mask = nil
        if (self.cornerRadius != 0.0){
            self.layer.cornerRadius = self.cornerRadius
            self.clipsToBounds = true;
            
            self.layer.borderWidth = self.borderWidth;
            self.layer.borderColor = self.borderColor.CGColor;
            return;
        }
        if (self.borderBottom){
            var sublayerBottom = CALayer()
            sublayerBottom.name = "Border"
            sublayerBottom.backgroundColor = self.borderColor.CGColor
            sublayerBottom.frame = CGRectMake(0, self.frame.size.height - self.borderWidth, self.frame.size.width, self.borderWidth)
            self.layer.addSublayer(sublayerBottom)
        }
        if (self.borderTop){
            var sublayerTop = CALayer()
            sublayerTop.name = "Border"
            sublayerTop.backgroundColor = self.borderColor.CGColor
            sublayerTop.frame = CGRectMake(0, 0, self.frame.size.width, self.borderWidth)
            self.layer.addSublayer(sublayerTop)
        }
        if(self.borderRight){
            var sublayerRight = CALayer()
            sublayerRight.name = "Border"
            sublayerRight.backgroundColor = self.borderColor.CGColor
            sublayerRight.frame = CGRectMake(self.frame.size.width - self.borderWidth, 0, self.borderWidth, self.frame.size.height)
            self.layer.addSublayer(sublayerRight)
        }
        if(self.borderLeft){
            var sublayerLeft = CALayer()
            sublayerLeft.name = "Border"
            sublayerLeft.backgroundColor = self.borderColor.CGColor
            sublayerLeft.frame = CGRectMake(0, 0, self.borderWidth, self.layer.frame.size.height)
            self.layer.addSublayer(sublayerLeft)
        }
        if self.trCornerRadius != 0 ||
            self.tlCornerRadius != 0 ||
            self.blCornerRadius != 0 ||
            self.brCornerRadius != 0 {
                var mask = MTDContextCreateRoundedMask(rect: bounds, radius_tl: tlCornerRadius, radius_tr: trCornerRadius, radius_bl: blCornerRadius, radius_br: brCornerRadius)
                var layerMask = CALayer()
                layerMask.frame = bounds
                layerMask.contents = mask.CGImage
                layer.mask = layerMask
        }
    }
    
    private func MTDContextCreateRoundedMask(#rect: CGRect, radius_tl : CGFloat, radius_tr : CGFloat, radius_bl : CGFloat, radius_br : CGFloat) -> UIImage {
        var context : CGContextRef
        var colorSpace : CGColorSpaceRef
        
        colorSpace = CGColorSpaceCreateDeviceRGB()
        
        // create a bitmap graphics context the size of the image
        context = CGBitmapContextCreate(nil, UInt(rect.size.width), UInt(rect.size.height), 8, 0, colorSpace, CGBitmapInfo(rawValue: 1))
        
        var minx = CGRectGetMinX(rect), midx = CGRectGetMidX(rect), maxx = CGRectGetMaxX(rect)
        var miny = CGRectGetMinY(rect), midy = CGRectGetMidY(rect), maxy = CGRectGetMaxY(rect)
        
        CGContextBeginPath(context)
        CGContextSetGrayFillColor(context, 1.0, 0.0)
        CGContextAddRect( context, rect )
        CGContextClosePath( context )
        CGContextDrawPath( context, kCGPathFill )
        
        CGContextSetGrayFillColor( context, 1.0, 1.0 )
        CGContextBeginPath( context )
        CGContextMoveToPoint( context, minx, midy )
        CGContextAddArcToPoint( context, minx, miny, midx, miny, radius_bl )
        CGContextAddArcToPoint( context, maxx, miny, maxx, midy, radius_br )
        CGContextAddArcToPoint( context, maxx, maxy, midx, maxy, radius_tr )
        CGContextAddArcToPoint( context, minx, maxy, minx, midy, radius_tl )
        CGContextClosePath( context )
        CGContextDrawPath( context, kCGPathFill )
        
        // Create CGImageRef of the main view bitmap content, and then
        // release that bitmap context
        var bitmapContext = CGBitmapContextCreateImage( context )
        
        var theImage = UIImage(CGImage: bitmapContext)
        return theImage!
    }
}