CCMBorderView
=============

[![License APACHE](https://img.shields.io/hexpm/l/plug.svg)](https://github.com/cacmartinez/CCMBorderView/blob/master/LICENSE)
[![Release](https://img.shields.io/github/release/cacmartinez/CCMBorderView.svg)](https://github.com/cacmartinez/CCMBorderView)

CCMBorderView is a simple to use view that uses the new IBDesignable and IBInspectable features of Xcode 6 to easily configure a view to have a top border, left border, right border, bottom border, or a combination of those. You can pick the width and color of the border, and you can also give it a corner radius to make rounded corners.

![ViewWithBorder](https://github.com/cacmartinez/CCMBorderView/blob/master/Screenshots/screenshot.png)

Issues with this version:

- Picking specific corners to apply a radius is not yet supported.
- If you have a radius bigger than 0 it will omit the borders you pick and will apply an even border to all of the view

=============

## Usage

In the storyboard draw a view to your controller and assign it the CCMBorderView class, then customize it as you want in the Attributes inspector.

![ViewWithBorderUsage](https://github.com/cacmartinez/CCMBorderView/blob/master/Screenshots/viewInUse.gif)

## Requirements

Xcode version 6.0 or later.

## Installation

Download or clone the repository, and copy the `CCMBorderView.swift` or the `CCMBorderView.h` and `CCMBorderView.m` files in case your are using objective-c, to your project.

## Author

Carlos Compean, ccompean@icalialabs.com

## License

CCMBorderView is available under the Apache License, Version 2.0. See the LICENSE file for more info.

