//
//  PGAvatarView.h
//  Avatar Example
//
//  Created by Paul Pilone on 5/30/14.
//  Copyright (c) 2014 Paul Pilone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PGAvatarView : UIView

@property (nonatomic, strong) UIColor *borderColor;

@property (nonatomic, assign) CGFloat borderWidth;

@property (nonatomic, strong) UIColor *fillColor;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, copy) NSString *placeholder;

@property (nonatomic, strong) UIFont *placeholderFont;

@property (nonatomic, strong) UIColor *placeholderTextColor;

@end
