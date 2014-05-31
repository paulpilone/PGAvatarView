//
//  PGAvatarView.m
//  Avatar Example
//
//  Created by Paul Pilone on 5/30/14.
//  Copyright (c) 2014 Paul Pilone. All rights reserved.
//

#import "PGAvatarView.h"

@implementation PGAvatarView

/*
 
*/
- (void)drawRect:(CGRect)rect
{
    // Draw the clip.
    UIBezierPath *circleClip = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    [circleClip addClip];
    
    // Draw the image.
    [self.image drawInRect:self.bounds];
}

@end
