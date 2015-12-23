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

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface CCMBorderView: UIView

typedef NS_OPTIONS(NSInteger, CCMBorder){
    CCMBorder_None,
    CCMBorder_Bottom,
    CCMBorder_Left,
    CCMBorder_Top,
    CCMBorder_Right
};

@property IBInspectable CGFloat   borderWidth;
@property IBInspectable CGFloat   cornerRadius;
@property IBInspectable UIColor*  borderColor;
@property IBInspectable BOOL      borderBottom;
@property IBInspectable BOOL      borderRight;
@property IBInspectable BOOL      borderLeft;
@property IBInspectable BOOL      borderTop;
@property IBInspectable CGFloat   tlCornerRadius;
@property IBInspectable CGFloat   trCornerRadius;
@property IBInspectable CGFloat   blCornerRadius;
@property IBInspectable CGFloat   brCornerRadius;

- (id)initWithFrame:(CGRect)frame border:(CCMBorder)border radius:(CGFloat)radius color:(UIColor *)color borderWidth:(CGFloat)width;
- (void)updateView;

@end
